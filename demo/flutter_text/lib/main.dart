// Nous devons importer le package auto_size_text
// pour pouvoir utiliser le widget AutoSizeText 👇
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MonTheme {
  static ThemeData get theme {
    return ThemeData(
      textTheme: const TextTheme(
        // A travers la propriété bodyText2, nous définissons la police de caractère,
        // la taille et la couleur du texte,
        // que nous allons utiliser pour le widget Text
        bodyText2: TextStyle(
            fontFamily: 'BebasNeue', fontSize: 30, color: Colors.green),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // 👇 On retourne un widget MaterialApp qui va nous permettre de définir le thème de l'application
    return MaterialApp(
      theme:
          MonTheme.theme, // 👈 On applique le thème principal de l'application
      home: const MyHomePage(title: 'Flutter Text'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: const Center(
        // Pour expérimenter le widget RichText pense à supprimer const
        // #Le widget Text
        child: SizedBox(
          width: 200,
          child: Text(
            'Ceci est un texte stylisé avec la police Bebas Neue et de couleur rouge',
            style: TextStyle(
                fontFamily: 'BebasNeue',
                fontSize: 30,
                color: Color.fromRGBO(244, 67, 54, 1)),
            textAlign: TextAlign.start,
            textDirection: TextDirection.rtl,
          ),
        ),

        // 💡 Commence par commenter le widget précédent et décommente le widget suivant 💡
        // Tu effecturas cette opération pour chaque widget que tu souhaites tester

        // Pluggin auto_size_text
        // child: SizedBox(
        //   // Nous définissons la largeur du widget AutoSizeText grâce au widget SizedBox
        //   width: 200,
        //   // 👇 Nous utilisons le widget AutoSizeText à la place du widget Text
        //   child: AutoSizeText(
        //     'Ceci est un texte stylisé et sa taille est automatiquement adapté grâce au widget AutoSizeText !',
        //     textAlign: TextAlign.center,
        //     textDirection: TextDirection.ltr,
        //     // Nous pouvons définir le nombre de lignes maximum
        //     maxLines: 2,
        //   ),
        // ),

        // Utilisation du theme
        // child: SizedBox(
        //   width: 200,
        //   child: Text(
        //     'Ceci est un texte stylisé utilisant le style du thème !',
        //     textAlign: TextAlign.start,
        //     textDirection: TextDirection.ltr,
        //   ),
        // ),

        // #Le Rich Text
        // Pense à supprimer const du wiget Center pour pouvoir tester le widget RichText
        // child: SizedBox(
        //   width: 200,
        //   child: RichText(
        //       text: const TextSpan(
        //     text: 'Ceci est un RichText ',
        //     style: TextStyle(
        //         fontFamily: 'BebasNeue',
        //         fontSize: 30,
        //         color: Color.fromRGBO(244, 67, 54, 1)),
        //     children: <TextSpan>[
        //       TextSpan(
        //           text: 'avec un ',
        //           style: TextStyle(fontSize: 20, color: Colors.blue)),
        //       TextSpan(
        //           text: 'style ',
        //           style: TextStyle(
        //               fontStyle: FontStyle.italic,
        //               fontSize: 40,
        //               color: Colors.green)),
        //       TextSpan(
        //           text: 'différent !',
        //           style: TextStyle(fontWeight: FontWeight.bold, fontSize: 55)),
        //     ],
        //   )),
        // ),
      ),
    );
  }
}
