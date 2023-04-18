// Importer le paquet flutter material pour utiliser les widgets
// de material design et pouvoir définir le thème de l'application
import 'package:flutter/material.dart';

void main() {
  runApp(const FlutterThemeAnvancee());
}

// Je défini la classe MonTheme qui va me permettre de définir
// le thème de l'ensemble de l'application
class MonTheme {
  static ThemeData get theme {
    return ThemeData(
      useMaterial3: true, // 👈 Activer le Material Design 3
      appBarTheme: const AppBarTheme(
        color: Colors.red,
      ),
      primaryColor: Colors.blue,
      fontFamily: 'Roboto',
      textTheme: const TextTheme(
        headline1: TextStyle(fontSize: 24.0),
        bodyText1: TextStyle(fontSize: 16.0),
      ),
      platform: TargetPlatform.iOS, // 👈 Définir la plateforme spécifique
    );
  }
}

class PersonnaliserMaterialTheme {
  static ThemeData get theme {
    final base = ThemeData.light();
    return base.copyWith(
      primaryColor: Colors.green,
      buttonTheme: const ButtonThemeData(
        buttonColor: Colors.red,
        textTheme: ButtonTextTheme.primary,
      ),
      textTheme: const TextTheme(
        headline1: TextStyle(
          color: Colors.red,
          fontSize: 24.0,
        ),
      ),
    );
  }
}
// Pour visualiser cette personnalisation, modifie le thème de la classe FlutterThemeAnvancee
// dans le widget MaterialApp

// Nouvelle propriété Material Design 3
final ThemeData theme = ThemeData.from(
  colorScheme: const ColorScheme.light(
    primary: Color(0xff6200ee), // nouvelle couleur principale
    onPrimary:
        Colors.white, // couleur de texte sur la nouvelle couleur principale
    secondary: Color(0xff03dac6), // nouvelle couleur secondaire
    onSecondary:
        Colors.black, // couleur de texte sur la nouvelle couleur secondaire
  ),
);

class MonThemeSombre extends MonTheme {
  static ThemeData get theme {
    final base = MonTheme.theme;
    return base.copyWith(
      appBarTheme: AppBarTheme(
        color: Colors.red[900],
      ),
      brightness: Brightness.dark,
      primaryColor: Colors.blueGrey[800],
    );
  }
}

class FlutterThemeAnvancee extends StatelessWidget {
  const FlutterThemeAnvancee({super.key});

  @override
  Widget build(BuildContext context) {
    // 👇 On retourne un widget MaterialApp qui va nous permettre de définir le thème de l'application
    return MaterialApp(
      theme:
          MonTheme.theme, // 👈 On applique le thème principal de l'application

      // Décommente les lignes suivantes pour appliquer la variation de thème
      // darkTheme:
      //     MonThemeSombre.theme, // 👈 On applique le thème dark de l'application
      home: const HomePage(title: 'Flutter Thème'),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Theme.of(context)
            .primaryColor, // 👈 Utiliser les thèmes dans les widgets
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Flutter Thème', style: TextStyle(fontSize: 24.0)),
            IconButton(
              icon: const Icon(
                Icons.info_outlined,
              ), // utiliser la nouvelle icône "info_outline"
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
