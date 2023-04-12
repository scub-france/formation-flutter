import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:faker/faker.dart';
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
                    CustomTextField(label: 'name', controller: _name),
                    CustomTextField(label: 'age', controller: _age),
                    CustomTextField(label: 'email', controller: _email),
                    CustomTextField(label: 'address', controller: _address),
                    CustomTextField(label: 'password', controller: _password),
                  ],
                ),
              ),
            ),
            Expanded(
                child: StreamBuilder(
              stream: FirebaseFirestore.instance.collection('users').snapshots(),
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
                      subtitle: Text(document.get('email')),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () async {
                          await FirebaseFirestore.instance.collection('users').doc(document.id).delete();
                        },
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

  Widget CustomTextField({required String label, required TextEditingController controller}) => TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: label,
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter some text';
        }
      });
}

class User {
  late String name;
  late int age;
  late String email;
  late String address;
  late String password;

  User({required this.name, required this.age, required this.email, required this.address, required this.password});

  // User.fromJson(Map<String, dynamic> json) {
  //   name = json['name'];
  //   age = json['age'];
  //   email = json['email'];
  //   address = json['address'];
  //   password = json['password'];
  // }

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
