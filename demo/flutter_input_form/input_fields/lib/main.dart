import 'package:flutter/material.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(appBarTheme: const AppBarTheme(color: Colors.deepPurple)),
      title: 'My App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Input Fields'),
        ),
        body: const MyFormWidget(),
      ),
    );
  }
}


class MyFormWidget extends StatefulWidget {
  const MyFormWidget({Key? key}) : super(key: key);

  @override
  _MyFormWidgetState createState() => _MyFormWidgetState();
}

class _MyFormWidgetState extends State<MyFormWidget> {
  final _formKey = GlobalKey<FormState>();

  String _name = '';
  String _email = '';
  String _password = '';
  String _selectedOption = 'Option 1';
  bool _isChecked = false;
  double _sliderValue = 0;
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;

  @override
  build(context) => Scaffold(
    // Créez un widget Form en utilisant la clé _formKey créée ci-dessus.
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Le widget TextFormField est un widget dans Flutter utilisé pour collecter les entrées utilisateur dans les formulaires.
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Name',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                  obscureText: true,
                ),
                const SizedBox(height: 16.0),
                //DropdownButtonFormField est un widget qui affiche une liste déroulante qui permet à l'utilisateur de choisir une option parmi une liste prédéfinie d'options.
                DropdownButtonFormField<String>(
                  value: _selectedOption,
                  items: ['Option 1', 'Option 2', 'Option 3'].map((option) {
                    return DropdownMenuItem<String>(
                      value: option,
                      child: Text(option),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedOption = value!;
                    });
                  },
                ),
                const SizedBox(height: 16.0),
                // CheckboxListTile est un widget qui combine une case à cocher avec une tuile.
                // Il peut être utilisé pour permettre à l'utilisateur de selectionner un ou plusieurs éléments d'une liste en cochant des cases à cocher.
                CheckboxListTile(
                  title: const Text('Check me out'),
                  value: _isChecked,
                  onChanged: (value) {
                    setState(() {
                      _isChecked = value!;
                    });
                  },
                ),
                const SizedBox(height: 16.0),
                // RadioListTile est un widget qui représente un seul choix parmi plusieurs options
                // présentées sous forme de liste verticale.
                RadioListTile<String>(
                  title: const Text('Option 1'),
                  value: 'Option 1',
                  groupValue: _selectedOption,
                  onChanged: (value) {
                    setState(() {
                      _selectedOption = value!;
                    });
                  },
                ),
                RadioListTile<String>(
                  title: const Text('Option 2'),
                  value: 'Option 2',
                  groupValue: _selectedOption,
                  onChanged: (value) {
                    setState(() {
                      _selectedOption = value!;
                    });
                  },
                ),
                RadioListTile<String>(
                  title: const Text('Option 3'),
                  value: 'Option 3',
                  groupValue: _selectedOption,
                  onChanged: (value) {
                    setState(() {
                      _selectedOption = value!;
                    });
                  },
                ),
                const SizedBox(height: 16.0),
                Slider(
                  value: _sliderValue,
                  min: 0,
                  max: 100,
                  divisions: 10,
                  label: _sliderValue.round().toString(),
                  onChanged: (value) {
                    setState(() {
                      _sliderValue = value;
                    });
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Date',
                    border: OutlineInputBorder(),
                  ),
                  onTap: () async {
                    // ShowDatePicker est une fonction qui permet d'afficher un dialogue de sélection de date à l'utilisateur
                    // Il prend plusieurs paramètres optionnels.
                    final date = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(), // la date initiale affichée dans le selecteur
                      firstDate: DateTime(2000), // la date minimal sélectionnable
                      lastDate: DateTime(2100), // la date maximal selectionnable
                      // il y a d'autres paramètres pouvant être pris en compte
                    );
                    // La date selectionnée ne sera pas automatiquement affichée dans l'interface utilisateur.
                    // Vous devez utiliser la méthode `setState` et mettre à jour la variable.
                    // Cela déclenchera une reconstruction de l'interface utilisateur avec la nouvelle date affichée
                    setState(() {
                      _selectedDate = date;
                    });
                  },
                  // Ici TextEditingController permet de contrôler le texte affiché dans le `TextFormField`
                  // Attention, dans ce cas, il faut impérativement utiliser setState pour mettre à jour la variable. Ici, c'est `text`
                  controller: TextEditingController(
                    text: _selectedDate != null
                        ? '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}'
                        : '',
                  ),
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Time',
                    border: OutlineInputBorder(),
                  ),
                  onTap: () async {
                    final time = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    );
                    setState(() {
                      _selectedTime = time;
                    });
                  },
                  controller: TextEditingController(
                    text: _selectedTime != null
                        ? '${_selectedTime!.hour}:${_selectedTime!.minute}'
                        : '',
                  ),
                ),
                const SizedBox(height: 16.0),
              ],
            ),
          ),
        ),
      ),
    );
}
