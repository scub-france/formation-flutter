// Importer le paquet flutter material pour utiliser les widgets
// de material design et pouvoir définir le thème de l'application
import 'package:flutter/material.dart';

void main() {
  runApp(const FlutterThemeWidget());
}

// Je défini la classe MonTheme qui va me permettre de définir
// le thème de l'ensemble de l'application
class MonTheme {
  static ThemeData get theme {
    return ThemeData(
      useMaterial3: true,
      appBarTheme: const AppBarTheme(
        color: Colors.red,
      ),
      scaffoldBackgroundColor: Colors.white,
      primaryColor: Colors.white,
      fontFamily: 'Roboto',
      textTheme: const TextTheme(
        headline1: TextStyle(fontSize: 24.0),
        bodyText1: TextStyle(fontSize: 16.0),
      ),
      // platform: TargetPlatform.iOS, // 👈 Définir la plateforme spécifique
    );
  }

  static ThemeData get customButtonTheme {
    return ThemeData(
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            textStyle: const TextStyle(
              fontFamily: 'RubikPixels-Regular',
              fontSize: 24,
            )),
      ),
    );
  }
}

// Je défini la classe MonThemeSombre qui va me permettre de définir
// le thème de l'ensemble de l'application en mode sombre
class MonThemeSombre extends MonTheme {
  static ThemeData get theme {
    final base = MonTheme.theme;
    return base.copyWith(
        // 👆 On utilise la méthode copyWith pour cloner le thème de base
        appBarTheme: AppBarTheme(
          color: Colors.red[900],
        ),
        scaffoldBackgroundColor: Colors.grey[900],
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue[900],
          ),
        ),
        brightness: Brightness.dark,
        primaryColor: Colors.blueGrey[800]);
  }
}

class FlutterThemeWidget extends StatefulWidget {
  const FlutterThemeWidget({super.key});

  @override
  State<FlutterThemeWidget> createState() => _FlutterThemeWidgetState();
}

class _FlutterThemeWidgetState extends State<FlutterThemeWidget> {
  bool _isDarkMode = false;

  void _toggleDarkMode() {
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
  }

// Widget pour expérimenter le thème dark avec le toggle button
  @override
  Widget build(BuildContext context) {
    // 👇 On retourne un widget MaterialApp qui va nous permettre de définir le thème de l'application
    return MaterialApp(
        theme: _isDarkMode ? MonThemeSombre.theme : MonTheme.theme,
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Flutter Theme Widget'),
          ),
          body: Center(
            child: ElevatedButton(
              onPressed:
                  _toggleDarkMode, // 👈 On appelle la fonction _toggleDarkMode
              child: const Text(
                'Basculer en mode sombre',
              ),
            ),
          ),
        ));
  }

  // Widget pour expérimenter le customButtonTheme
  // ⚠️ Pense à commenter le widget précédent pour tester celui-ci

  // @override
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     title: 'Mon Application',
  //     theme: MonTheme.theme,
  //     home: Scaffold(
  //       appBar: AppBar(
  //         title: const Text('Mon Application'),
  //       ),
  //       body: Center(
  //         child: Theme(
  //           data: MonTheme.customButtonTheme,
  //           child: ElevatedButton(
  //             onPressed: () {},
  //             child: const Text(
  //               'Mon bouton',
  //             ),
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }
}
