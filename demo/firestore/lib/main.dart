import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:faker/faker.dart';
import 'package:firestore/profil.dart';
import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const Firestore());
}

class Firestore extends StatelessWidget {
  const Firestore({super.key});

  // This widget is the root of your application.
  @override
  build(_) => MaterialApp(
        title: 'Firestore Demo',
        theme: ThemeData(
          primarySwatch: Colors.grey,
        ),
        home: const UserWidget(),
      );
}

class UserWidget extends StatefulWidget {
  const UserWidget({super.key});

  @override
  createState() => _UserWidgetState();
}

class _UserWidgetState extends State<UserWidget> {
  final _controller = TextEditingController();
  final _name = TextEditingController();
  final _age = TextEditingController();
  final _email = TextEditingController();
  final _address = TextEditingController();
  final _password = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  late Query<Map<String, dynamic>> _requete = FirebaseFirestore.instance.collection('users');

  @override
  dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  build(_) => Scaffold(
        appBar: AppBar(
          title: const Text('Firestore Demo'),
        ),
        body: Column(
          children: [
            Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    customTextField(label: 'name', controller: _name, needValidator: true),
                    customTextField(label: 'age', controller: _age, needValidator: true),
                    customTextField(label: 'email', controller: _email, needValidator: true),
                    customTextField(label: 'address', controller: _address, needValidator: true),
                    customTextField(label: 'password', controller: _password, needValidator: true),
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('appuyer sur un button pour modifier la requete'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  listButton(FirebaseFirestore.instance.collection('users'), 'Get all users'),
                  listButton(FirebaseFirestore.instance.collection('users').where('age', isEqualTo: 10), 'age = 20'),
                  listButton(FirebaseFirestore.instance.collection('users').limit(2), 'limit 2'),
                  listButton(FirebaseFirestore.instance.collection('users').orderBy('age'), 'order by age'),
                  listButton(FirebaseFirestore.instance.collection('users').orderBy('age', descending: true),
                      'order by age desc'),
                ],
              ),
            ),
            Expanded(
                child: StreamBuilder(
              stream: _requete.snapshots(),
              builder: (_, snapshot) {
                if (snapshot.hasError) {
                  return const Text('Something went wrong');
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Column(
                    children: const [
                      CircularProgressIndicator(),
                      Text("Loading"),
                    ],
                  );
                }

                if (snapshot.data!.docs.isEmpty) {
                  return Column(
                    children: [
                      const Text('No users'),
                      ElevatedButton(
                        onPressed: _initDb,
                        child: const Text('add 10 users'),
                      ),
                    ],
                  );
                }

                return ListView(
                  children: snapshot.data!.docs.map((document) {
                    return ListTile(
                      title: Text(document.get('name')),
                      subtitle: Text('${document.get('email')} \n ${document.get('age')}'),
                      trailing: SizedBox(
                        width: 100,
                        child: Row(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.edit),
                              onPressed: () async {
                                Navigator.push(context, MaterialPageRoute(builder: (_) => Profil(id: document.id)));
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () async {
                                await FirebaseFirestore.instance.collection('users').doc(document.id).delete();
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                );
              },
            )),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _addUser,
          tooltip: 'Add User',
          child: const Icon(Icons.add),
        ),
      );

  Widget listButton(Query<Map<String, dynamic>> query, String label) => ElevatedButton(
        onPressed: () {
          setState(() {
            _requete = query;
          });
        },
        child: Text(label),
      );

  _addUser() async {
    if (_formKey.currentState!.validate()) {
      var user = User(
          name: _name.text,
          age: int.parse(_age.text),
          email: _email.text,
          address: _address.text,
          password: _password.text);
      await FirebaseFirestore.instance.collection('users').add(user.toJson());
      _name.clear();
      _age.clear();
      _email.clear();
      _address.clear();
      _password.clear();
    }
  }

  _initDb() async {
    for (int i = 0; i < 10; i++) {
      var user = User(
          name: faker.person.name(),
          age: faker.randomGenerator.integer(50),
          email: faker.internet.email(),
          address: faker.address.streetAddress(),
          password: faker.internet.password(length: 5));
      await FirebaseFirestore.instance.collection('users').add(user.toJson());
    }
  }
}

Widget customTextField(
    {required String label, required TextEditingController controller, required bool needValidator}) =>
    TextFormField(
        controller: controller,
        decoration: InputDecoration(
          hintText: label,
        ),
        validator: (value) {
          if (needValidator) {
            if (value!.isEmpty) {
              return 'Please enter some text';
            }
          }
        });

class User {
  late String name;
  late int age;
  late String email;
  late String address;
  late String password;

  User({required this.name, required this.age, required this.email, required this.address, required this.password});

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    age = json['age'];
    email = json['email'];
    address = json['address'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'age': age,
      'email': email,
      'address': address,
      'password': password,
    };
  }
}
