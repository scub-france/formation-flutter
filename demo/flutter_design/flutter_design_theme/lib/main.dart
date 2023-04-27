import 'package:flutter/material.dart';

// Un theme global qui est appliqué à la racine
final globalTheme = ThemeData(
    // Tous les rendus de l'application sont configurables
    // On commence avec la configuration du rendu texte
    textTheme: const TextTheme(
      // Plusieurs définitions sont disponibles, voici une conf pour un texte médian
      bodyMedium: TextStyle(fontSize: 22, color: Colors.blueGrey),
      // certaines propriétés sont maintenant deprecated
      // suite à l'arrivée de Material Design 3. Attention à caption par exemple
      // caption: const TextStyle(fontSize: 30, color: Colors.green),
    ),
    // Le theme appliqué au formulaire
    inputDecorationTheme: const InputDecorationTheme(
        outlineBorder: BorderSide(color: Colors.greenAccent),
        filled: true,
        border: OutlineInputBorder(borderSide: BorderSide(color: Colors.green))),
    // Certaines propriétés sont individuelles car globales
    // Les widgets enfants y accèdent automatiquement
    cardColor: Colors.white,
    typography: Typography.material2021(),
    // Flutter évolue vers MaterialDesign 3
    // de nouveaux widgets héritent de nouvelle propriétés
    // useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromRGBO(90, 60, 125, 1)));

final alternativeTheme = ThemeData(
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.black45,
      foregroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
    ),
  ),
  cardColor: Colors.blueGrey,
  textTheme: const TextTheme(
    bodyMedium: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
  ),
  inputDecorationTheme: const InputDecorationTheme(
      outlineBorder: BorderSide(color: Colors.greenAccent, style: BorderStyle.none),
      filled: true,
      border: UnderlineInputBorder(borderSide: BorderSide(width: 2))),
);

/// Les Themes permettent de définir à la racine de votre application un modèle de rendu
/// qui sera hérité par tous les widgets enfants.
class ThemeApp extends StatelessWidget {
  const ThemeApp({super.key});

  @override
  build(_) => MaterialApp(
        // ThemeData couvre un ensemble de thèmes chacun dédié à un aspect graphique précis
        theme: globalTheme, // 👈 On applique le thème principal de l'application
        home: const ThemedPage(),
      );
}

class ThemedPage extends StatelessWidget {
  const ThemedPage({super.key});

  @override
  build(_) => Scaffold(
        appBar: AppBar(title: const Text('Un widget, plusieurs thèmes')),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Flexible(
              child: Card(
                child: SizedBox.expand(
                  child: Container(
                    margin: const EdgeInsets.all(8),
                    width: 200,
                    height: 40,
                    child: const Model(content: "Zone rendue par un thème"),
                  ),
                ),
              ),
            ),
            Flexible(
              child: Theme(
                // En dessous de ce widget le theme général n'est plus actif
                // Le theme alternatif prend la priorité
                // De plus nous overridons la propriété focusColor
                data: alternativeTheme.copyWith(focusColor: Colors.greenAccent),
                child: const Card(
                  child: Card(
                    child: SizedBox.expand(child: Model(content: "Zone rendue par un sous-thème")),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
}

// Ce widget serait instancié sous chaque Theme pour observer son rendu
class Model extends StatelessWidget {
  final String content;

  const Model({super.key, required this.content});

  @override
  build(_) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // Aucun style appliqué, les widgets héritent tous du thème
        children: [
          Text(content),
          TextFormField(
            controller: TextEditingController(text: "Un champs texte"),
          ),
          const Spacer(),
          ElevatedButton(
            onPressed: () {},
            child: const Text("Un bouton"),
          )
        ],
      );
}

void main() => runApp(const ThemeApp());
