import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:faker/faker.dart';
import 'package:firestore/profil.dart';
import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  //WidgetsFlutterBinding.ensureInitialized(); s'assure que la liaison de widgets de Flutter est initialisée.
  WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp(); initialise l'application Firebase.
  await Firebase.initializeApp(
    //récupère les options de configuration par défaut pour la plateforme sur laquelle votre application est exécutée.
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const Firestore());
}

class Firestore extends StatelessWidget {
  const Firestore({super.key});

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

  //initialise les variables de type TextEditingController
  final _controller = TextEditingController();
  final _name = TextEditingController();
  final _age = TextEditingController();
  final _email = TextEditingController();
  final _address = TextEditingController();
  final _password = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  //initialise la variable de type Query qui permet de récupérer des requetes
  late Query<Map<String, dynamic>> _requete = FirebaseFirestore.instance.collection('users');

  //dispose() est appelé lorsque le widget est supprimé de l'arbre de widgets.
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
              //key permet de valider le formulaire
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
            //Création d'un bouton qui permet d'ajouter un utilisateur
            ElevatedButton(
                onPressed: () => _addUser(),
                child: const Icon(Icons.add)),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('appuyer sur un button pour modifier la requete',style:
                      TextStyle(fontSize: 15,fontWeight: FontWeight.bold,decoration: TextDecoration.underline),),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //requete qui permet de récupérer tous les utilisateurs
                  listButton(FirebaseFirestore.instance.collection('users'), 'Get all users'),
                  //requete qui permet de récupérer les utilisateurs dont l'age est égal à 10
                  listButton(FirebaseFirestore.instance.collection('users').where('age', isEqualTo: 10), 'age = 10'),
                  //requete qui permet de récupérer 2 users maximum
                  listButton(FirebaseFirestore.instance.collection('users').limit(2), 'limit 2'),
                  //requete qui permet de récupérer les utilisateurs dont l'age est supérieur ou égal à 18
                  listButton(FirebaseFirestore.instance.collection('users').where('age', isGreaterThanOrEqualTo: 18), 'user majeur'),
                  //requete qui permet de récupérer les utilisateurs dont l'age est inférieur ou égal à 17
                  listButton(FirebaseFirestore.instance.collection('users').where('age', isLessThanOrEqualTo: 17), 'user mineur'),
                  //requete qui permet de classé les utilisateurs par ordre décroissant
                  listButton(FirebaseFirestore.instance.collection('users').orderBy('age', descending: true),
                      'order by age desc'),
                ],
              ),
            ),
            Expanded(
              //StreamBuilder est un widget qui construit un widget en fonction de l'état actuel d'un flux asynchrone.
                child: StreamBuilder(
                  //snapshot est un objet qui contient les données de la requete
              stream: _requete.snapshots(),
              //snapshot.data.docs est une liste qui contient les données de la requete(etat de la requete, erreur, chargement,données)
              builder: (_, snapshot) {
                //si la requete a une erreur
                if (snapshot.hasError) {
                  return const Text('Something went wrong');
                }

                //si la requete est en cours de chargement
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Column(
                    children: const [
                      CircularProgressIndicator(),
                      Text("Loading"),
                    ],
                  );
                }

                //si la requete est vide
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

                //si la requete est valide et contient des données
                return ListView(
                  //snapshot.data!.docs.map((document) -> permet de parcourir la liste des données de la requete et de les traiter
                  children: snapshot.data!.docs.map((document) {
                    return ListTile(
                      title: Text(document.get('name')),
                      subtitle: Text('${document.get('email')} \n ${document.get('age')}'),
                      trailing: SizedBox(
                        width: 100,
                        child: Row(
                          children: [
                            //Création d'un bouton qui permet d'aller vers une autre page pour modifier un utilisateur
                            IconButton(
                              icon: const Icon(Icons.edit),
                              onPressed: () async {
                                Navigator.push(context, MaterialPageRoute(builder: (_) => Profil(id: document.id)));
                              },
                            ),
                            //Création d'un bouton qui permet de supprimer un utilisateur
                            IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () async {
                                //supprime un utilisateur de la base de données firestore en fonction de son id  
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
      );

  Widget listButton(Query<Map<String, dynamic>> query, String label) => ElevatedButton(
        onPressed: () {
          //setState permet de mettre à jour l'état du widget
          setState(() {
            //recupère la requete en fonction du bouton cliqué et la stocke dans la variable _requete
            _requete = query;
          });
        },
        //affiche le label du bouton
        child: Text(label),
      );

  _addUser() async {
    //si le formulaire est valide
    if (_formKey.currentState!.validate()) {
      //création d'un utilisateur avec les données du formulaire
      var user = User(
          name: _name.text,
          age: int.parse(_age.text),
          email: _email.text,
          address: _address.text,
          password: _password.text);
      //ajout de l'utilisateur dans la base de données firestore grâce à la méthode add de CollectionReference
      //utilisation de la méthode toJson() pour convertir l'objet en Map<String, dynamic>
      await FirebaseFirestore.instance.collection('users').add(user.toFirebase());
      //vider les champs du formulaire
      _name.clear();
      _age.clear();
      _email.clear();
      _address.clear();
      _password.clear();
    }
  }

  //fonction qui permet d'ajouter 10 utilisateurs dans la base de données firestore si la base de données est vide
  _initDb() async {
    for (int i = 0; i < 10; i++) {
      var user = User(
          name: faker.person.name(),
          age: faker.randomGenerator.integer(50),
          email: faker.internet.email(),
          address: faker.address.streetAddress(),
          password: faker.internet.password(length: 5));
      await FirebaseFirestore.instance.collection('users').add(user.toFirebase());
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

///Classe User qui permet de créer un utilisateur avec les champs name, age, email, address, password
///et de convertir l'objet en Map<String, dynamic> pour l'ajouter dans la base de données firestore
///et de convertir un Map<String, dynamic> en objet User pour récupérer les données de la base de données firestore
class User {
  late String name;
  late int age;
  late String email;
  late String address;
  late String password;

  User({required this.name, required this.age, required this.email, required this.address, required this.password});

  User.fromFirebase(Map<String, dynamic> data) {
    name = data['name'];
    age = int.parse(data['age']);
    email = data['email'];
    address = data['address'];
    password = data['password'];
  }

  Map<String, dynamic> toFirebase() {
    return {
      'name': name,
      'age': age as String,
      'email': email,
      'address': address,
      'password': password,
    };
  }
}
