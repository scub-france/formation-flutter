// Importer le paquet flutter material pour utiliser les widgets
// de material design et pouvoir définir le thème de l'application
import 'package:flutter/material.dart';

void main() {
  runApp(const FlutterThemeSimple());
}

// Je défini la classe MonTheme qui va me permettre de définir
// le thème de l'ensemble de l'application
class MonTheme {
  static ThemeData get theme {
    return ThemeData(
      appBarTheme: const AppBarTheme(
        color: Colors.red,
      ),
      primaryColor: Colors.blue,
      fontFamily: 'Roboto',
      textTheme: const TextTheme(
        headline1: TextStyle(fontSize: 24.0),
        bodyText1: TextStyle(fontSize: 16.0),
      ),
    );
  }
}

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

class FlutterThemeSimple extends StatelessWidget {
  const FlutterThemeSimple({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // 👇 On retourne un widget MaterialApp qui va nous permettre de définir le thème de l'application
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
        // backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text('Flutter Thème', style: TextStyle(fontSize: 24.0)),
          ],
        ),
      ),
    );
  }
}
