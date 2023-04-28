import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Flutter Form Demo',
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Flutter Form Demo'),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                MyFormWidget(),
                const SizedBox(height: 20),
                const MyValidateForm(),
              ],
            ),
          ),
        ));
}

class MyFormWidget extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late String _name;
  late int _age;

  @override
  build(context) => Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            decoration: const InputDecoration(labelText: 'Name'),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Name is required';
              }
              return null;
            },
            onSaved: (value) {
              _name = value!;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Age'),
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Age is required';
              }
              final age = int.tryParse(value);
              if (age == null || age <= 0) {
                return 'Age must be a positive number';
              }
              return null;
            },
            onSaved: (value) {
              _age = int.tryParse(value!)!;
            },
          ),
          const SizedBox(height: 20),
          FloatingActionButton(
            child: const Text('Submit'),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                // Ici, nous pouvons ajouter du code afin d'utiliser les données de l'utilisateur
                // Dans ce cas présent, nous demandons juste d'afficher les éléments dans la console
                print('Name: $_name');
                print('Age: $_age');
              }
            },
          )
        ],
      ),
    );
}

class MyValidateForm extends StatefulWidget {
  const MyValidateForm({super.key});

  @override
  _MyValidateFormState createState() => _MyValidateFormState();
}

class _MyValidateFormState extends State<MyValidateForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // TODO SOMETHING HERE
  @override
  build(context) => Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            decoration: const InputDecoration(labelText: 'Email'),
            // TODO SOMETHING HERE
          ),
          FloatingActionButton(
            child: const Text('Submit'),
            onPressed: () {
              // TODO SOMETHING HERE
              print(''); // TODO SOMETHING HERE
            },
          ),
        ],
      ),
    );
}
