import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'main.dart';

/// Profil Page pour modifier les données de l'utilisateur
/// en récupérant son id dans les paramètres
class Profil extends StatefulWidget {
  final String id;

  const Profil({Key? key, required this.id}) : super(key: key);

  @override
  State<Profil> createState() => _ProfilState(id);
}

class _ProfilState extends State<Profil> {
  _ProfilState(String id);

  // Déclaration des variables
  final _name = TextEditingController();
  final _age = TextEditingController();
  final _email = TextEditingController();
  final _address = TextEditingController();
  final _password = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  build(context) => Scaffold(
    appBar: AppBar(
          title: const Text('Update User'),
          // Bouton pour revenir en arrière (vers la page précédente) grâce à la fonction pop de Navigator
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          )
        ),
        body: Column(children: [
          StreamBuilder(
            // Récupération des données de l'utilisateur grâce à son id
            stream: FirebaseFirestore.instance.collection('users').doc(widget.id).snapshots(),
            builder: (_, snapshot) {
              if (snapshot.hasData) {
                var user = User.fromFirebase(snapshot.data!.data()!);
                return Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        customTextField(label: user.name, controller: _name, needValidator: false),
                        customTextField(label: '${user.age}', controller: _age, needValidator: false),
                        customTextField(label: user.email, controller: _email, needValidator: false),
                        customTextField(label: user.address, controller: _address, needValidator: false),
                        customTextField(label: user.password, controller: _password, needValidator: false),
                      ],
                    ));
              } else {
                return const Text('Loading...');
              }
            },
          ),
        ]),
        floatingActionButton: FloatingActionButton(
          onPressed: ()  {
            if (_formKey.currentState!.validate()) {
              if(_name.text.isNotEmpty)  FirebaseFirestore.instance.collection('users').doc(widget.id).update({'name': _name.text});
              if(_age.text.isNotEmpty)  FirebaseFirestore.instance.collection('users').doc(widget.id).update({'age': _age.text});
              if(_email.text.isNotEmpty)  FirebaseFirestore.instance.collection('users').doc(widget.id).update({'email': _email.text});
              if(_age.text.isNotEmpty)  FirebaseFirestore.instance.collection('users').doc(widget.id).update({'age': _age.text});
              if(_password.text.isNotEmpty)  FirebaseFirestore.instance.collection('users').doc(widget.id).update({'password': _password.text});

              _name.clear();_age.clear();_email.clear();_address.clear();_password.clear();

              Navigator.push(context, MaterialPageRoute(builder: (context) => const Firestore()));
            }
          },
          tooltip: 'Update User',
          child: const Icon(Icons.refresh),
        ),
      );
}
