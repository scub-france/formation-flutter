import 'package:flutter/material.dart';

void main() {
  runApp(const ScrollView());
}

/// Utilisation de [SingleChildScrollView] pour afficher une liste de 50 éléments
class ScrollView extends StatelessWidget {
  const ScrollView({super.key});

  // This widget is the root of your application.
  @override
  build(_) {
    return MaterialApp(
        title: 'SingleChildScrollView Demo',
        theme: ThemeData(
          primarySwatch: Colors.grey,
        ),
        home: Scaffold(
            appBar: AppBar(
              title: const Text('SingleChildScrollView Demo'),
            ),
            body: const DemoScroll()));
  }
}

class DemoScroll extends StatefulWidget {
  const DemoScroll({Key? key}) : super(key: key);

  @override
  State<DemoScroll> createState() => _DemoScrollState();
}

class _DemoScrollState extends State<DemoScroll> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    // [addPostFrameCallback] permet d'exécuter une fonction après le premier build du widget
    //  [jumpTo] permet de sauter à une position donnée, ici la fin du scroll
    WidgetsBinding.instance
        .addPostFrameCallback((_) => _scrollController.position.jumpTo(_scrollController.position.maxScrollExtent));
  }

  // [SingleChildScrollView] est un widget qui permet de scroller dans une direction donnée (vertical ou horizontal)
  // [SingleChildScrollView] il est utile pour afficher un contenu qui ne tient pas dans l'écran (par exemple une liste)
  @override
  build(_) => SingleChildScrollView(
        // [controller] permet de définir un [ScrollController] pour le widget [SingleChildScrollView]
        // [ScrollController] renseigne sur la position du scroll (début, fin, position actuelle)
        // et peut être utilisé pour animer le scroll
        controller: _scrollController,
        // [scrollDirection] permet de définir la direction du scroll (vertical ou horizontal)
        scrollDirection: Axis.vertical,
        // [physics] permet de définir le comportement du scroll (par exemple le rebond)
        // [BouncingScrollPhysics] permet d'avoir un rebond lorsqu'on atteint le début ou la fin du scroll
        physics: const BouncingScrollPhysics(),
        // [clipBehavior] permet de définir le comportement de dépassement du widget
        clipBehavior: Clip.none,
        child: Column(
          children: [
            Column(
              // [List.generate] permet de générer une liste d'éléments en fonction d'un nombre donné (ici 50)
              children: List.generate(
                50,
                (index) => ListTile(
                  title: GestureDetector(
                      onTap: () {
                        print(_scrollController.position);
                      },
                      child: Text('Item $index')),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onPressed: () {
                    _scrollController.animateTo(0, duration: const Duration(seconds: 1), curve: Curves.easeIn);
                  },
                  child: const Text('Scroll to top')),
            )
          ],
        ),
      );
}
