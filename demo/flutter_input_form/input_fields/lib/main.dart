import 'package:flutter/material.dart';


// INPUT FIELDS
void main() => runApp(const MyApp());

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
  const MyFormWidget({super.key});

  @override
  MyFormWidgetState createState() => MyFormWidgetState();
}

class MyFormWidgetState extends State<MyFormWidget> {
  final formKey = GlobalKey<FormState>();

  String name = '';
  String email = '';
  String password = '';
  String selectedOption = 'Option 1';
  bool isChecked = false;
  double sliderValue = 0;
  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  @override
  build(context) => Scaffold(
    // Créez un widget Form en utilisant la clé formKey créée ci-dessus.
      body: Form(
        key: formKey,
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
                  value: selectedOption,
                  items: ['Option 1', 'Option 2', 'Option 3'].map((option) {
                    return DropdownMenuItem<String>(
                      value: option,
                      child: Text(option),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedOption = value!;
                    });
                  },
                ),
                const SizedBox(height: 16.0),
                // CheckboxListTile est un widget qui combine une case à cocher avec une tuile.
                // Il peut être utilisé pour permettre à l'utilisateur de selectionner un ou plusieurs éléments d'une liste en cochant des cases à cocher.
                CheckboxListTile(
                  title: const Text('Check me out'),
                  value: isChecked,
                  onChanged: (value) {
                    setState(() {
                      isChecked = value!;
                    });
                  },
                ),
                const SizedBox(height: 16.0),
                // RadioListTile est un widget qui représente un seul choix parmi plusieurs options
                // présentées sous forme de liste verticale.
                RadioListTile<String>(
                  title: const Text('Option 1'),
                  value: 'Option 1',
                  groupValue: selectedOption,
                  onChanged: (value) {
                    setState(() {
                      selectedOption = value!;
                    });
                  },
                ),
                RadioListTile<String>(
                  title: const Text('Option 2'),
                  value: 'Option 2',
                  groupValue: selectedOption,
                  onChanged: (value) {
                    setState(() {
                      selectedOption = value!;
                    });
                  },
                ),
                RadioListTile<String>(
                  title: const Text('Option 3'),
                  value: 'Option 3',
                  groupValue: selectedOption,
                  onChanged: (value) {
                    setState(() {
                      selectedOption = value!;
                    });
                  },
                ),
                const SizedBox(height: 16.0),
                Slider(
                  value: sliderValue,
                  min: 0,
                  max: 100,
                  divisions: 10,
                  label: sliderValue.round().toString(),
                  onChanged: (value) {
                    setState(() {
                      sliderValue = value;
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
                      selectedDate = date;
                    });
                  },
                  // Ici TextEditingController permet de contrôler le texte affiché dans le `TextFormField`
                  // Attention, dans ce cas, il faut impérativement utiliser setState pour mettre à jour la variable. Ici, c'est `text`
                  controller: TextEditingController(
                    text: selectedDate != null
                        ? '${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}'
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
                      selectedTime = time;
                    });
                  },
                  controller: TextEditingController(
                    text: selectedTime != null
                        ? '${selectedTime!.hour}:${selectedTime!.minute}'
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
