import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'main.dart';

class Profil extends StatefulWidget {
  final String id;

  const Profil({Key? key, required this.id}) : super(key: key);

  @override
  State<Profil> createState() => _ProfilState(id);
}

class _ProfilState extends State<Profil> {
  _ProfilState(String id);

  final _name = TextEditingController();
  final _age = TextEditingController();
  final _email = TextEditingController();
  final _address = TextEditingController();
  final _password = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  build(_) => Scaffold(
    appBar: AppBar(
          title: const Text('Update User'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          )
        ),
        body: Column(children: [
          StreamBuilder(
            stream: FirebaseFirestore.instance.collection('users').doc(widget.id).snapshots(),
            builder: (_, snapshot) {
              if (snapshot.hasData) {
                var user = User.fromJson(snapshot.data?.data() as Map<String, dynamic>);
                return Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        customTextField(label: user.name, controller: _name, needValidator: true),
                        customTextField(label: '${user.age}', controller: _age, needValidator: true),
                        customTextField(label: user.email, controller: _email, needValidator: true),
                        customTextField(label: user.address, controller: _address, needValidator: true),
                        customTextField(label: user.password, controller: _password, needValidator: true),
                      ],
                    ));
              } else {
                return const Text('Loading...');
              }
            },
          ),
        ]),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            if (_formKey.currentState!.validate()) {
              var user = User(
                  name: _name.text,
                  age: int.parse(_age.text),
                  email: _email.text,
                  address: _address.text,
                  password: _password.text);
              await FirebaseFirestore.instance.collection('users').doc(widget.id).update(user.toJson());
              _name.clear();_age.clear();_email.clear();_address.clear();_password.clear();
            }
          },
          tooltip: 'Update User',
          child: const Icon(Icons.refresh),
        ),
      );
}
