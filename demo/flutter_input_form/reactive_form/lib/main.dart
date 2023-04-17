import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';


//REACTIVE FORMS
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  build(context) => MaterialApp(
      theme: ThemeData(appBarTheme: const AppBarTheme(color: Colors.indigo)),
      title: 'My app',
      home: Scaffold(
        body: Column(
          children: [
            MyForm(),
            const Divider(height: 20, thickness: 5, color: Colors.black),
            const Text('A VOUS DE JOUER'),
            MyExerciseForm(),
          ],
        ),
      ),
    );
}
class MyForm extends StatelessWidget {
  MyForm({super.key});
  // FormGroup provient de Reactive Forms. Il gère et valide les données d'un groupe de champs de formulaire.
  // Ici, formGroup est initialisé avec 3 champs
  final form = FormGroup({
    // Pour chaque champs, nous définissons un objet 'FormControl' avec les validateurs que nous voulons appliquer  pour la validation de chaque champ.
    'name': FormControl<String>(validators: [Validators.required]), // ici, nous voulons que le champ soit requis
    'email': FormControl<String>(validators: [
      Validators.email, // ici, nous voulons que le champ soit au format Email
      Validators.required,
    ]),
    'password': FormControl<String>(
      validators: [
        Validators.minLength(8), // ici, nous voulons que le champ ait, au minimum 8 caractères
        Validators.required,
      ],
    ),
  });

  @override
  build(context) {
    // Nous retournons un Widget 'ReactiveForm' afin d'utiliser tout ce que propose le package
    return ReactiveForm(
      formGroup: form, // Utilisation du formGroup défini ci-dessus
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.all(1),
            child: Text('Nom'),
          ),
          // ReactiveTextField est un widget qui s'adapte automatiquement aux modifications de la valeur de son contrôle, c'est-à-dire du formulaire,
          // et peut afficher des erreurs de validation en temps réel
          ReactiveTextField(
            // 'formControlName' est utillisé pour pour lier un contrôle de formulaire à un champ de saisie
            formControlName: 'name',
            validationMessages: {
              // Messages d'erreur personnalisés pour les validateurs définis dans le formGroup
              ValidationMessage.required: (_) => 'Le champ Nom est obligatoire',
            },
          ),
          const Padding(
            padding: EdgeInsets.all(1),
            child: Text('Email'),
          ),
          ReactiveTextField(
            formControlName: 'email',
            validationMessages: {
              ValidationMessage.required: (_) => 'Le champ Email est obligatoire',
              ValidationMessage.email: (_) =>
              'Le champ doit contenir un email valide',
            },
          ),
          const Padding(
            padding: EdgeInsets.all(1),
            child: Text('Password'),
          ),
          ReactiveTextField(
            formControlName: 'password',
            obscureText: true,
            validationMessages: {
              ValidationMessage.minLength: (_) =>
              'Le mot de passe doit contenir au moins 8 caractères',
              ValidationMessage.required: (_) =>
              'La saisie d\'un mot de passe est obligatoire',
            },
          )
        ],
      ),
    );
  }
}


// A VOUS DE JOUER
// Créez un nouveau formulaire qui contient un champ 'username' et un champ 'age'.
// Le champ 'username' doit être requis, tandis que le champ 'age' doit être un entier supérieur à 18.
// Utilisez les widgets ReactiveTextField pour créer les champs de saisie.
// N'oubliez pas de gérer les messages d'erreur de validation pour chaque champ.



class MyExerciseForm extends StatelessWidget {
  final form = FormGroup({
    // TODO SOMETHING HERE
  });

  @override
  build(context) {
    return ReactiveForm(
      formGroup: form,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // TODO SOMETHING HERE
      ),
    );
  }
}

