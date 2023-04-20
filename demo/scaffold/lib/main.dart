import 'package:flutter/material.dart';

void main() {
  runApp(const ScaffoldWidget());
}

class ScaffoldWidget extends StatefulWidget {
  const ScaffoldWidget({super.key});

  @override
  State<ScaffoldWidget> createState() => _ScaffoldWidgetState();
}

/// Utilisation de [Scaffold] pour créer une page avec un [AppBar], un [Drawer], un [BottomAppBar], un [FloatingActionButton] et un [SnackBar]
/// il existe d'autres widgets qui peuvent être utilisés avec Scaffold comme [BottomNavigationBar], [PersistentBottomSheet], [BottomSheet], [SnackBar], [FloatingActionButton], [Drawer], [AppBar], [Body], [ScaffoldMessenger], [ScaffoldState]
class _ScaffoldWidgetState extends State<ScaffoldWidget> {
  int state = 0;
  // Utilisation de la clé pour accéder au ScaffoldState (le ScaffoldState est un objet qui permet de modifier le Scaffold)
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  // Fonction qui permet de changer l'etat du body
  void _showSnackbar() {
    if (state == 0) {
      // si le state est à 0, on affiche un [ModalBarrier] qui va changer l'arriere plan du body
      _scaffoldKey.currentState?.showBodyScrim(true, 1);
      state++;
    } else {
      state--;
      _scaffoldKey.currentState?.showBodyScrim(false, 1);
    }
  }

  @override
  build(_) => MaterialApp(
      title: 'Scaffold Widget Demo',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      // Utilisation de [Scaffold] pour avoir une structure de base pour une page (AppBar, Drawer, BottomAppBar, FloatingActionButton, SnackBar)
      home: Scaffold(
        // Utilisation de la clé pour accéder au ScaffoldState
        key: _scaffoldKey,
        // Utilisation de [AppBar] pour avoir une barre en haut de la page
        appBar: AppBar(
          title: const Text('Scaffold Widget Demo'),
        ),
        body: const Center(
            child: Text('Voici le corps de la page',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, decoration: TextDecoration.underline))),
        // Utilisation de [Drawer] pour avoir un menu latéral (en cliquant sur le bouton hamburger)
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: const <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.grey,
                ),
                child: Text(
                  'Drawer Header',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.message),
                title: Text('Messages'),
              ),
              ListTile(
                leading: Icon(Icons.account_circle),
                title: Text('Profile'),
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Settings'),
              ),
            ],
          ),
        ),
        // Utilisation de [FloatingActionButton] pour avoir un bouton flottant
        floatingActionButton: FloatingActionButton(
          onPressed: _showSnackbar,
          tooltip: 'Click pour changer le state du body',
          child: const Icon(Icons.refresh),
        ),
        // Utilisation de [FloatingActionButtonLocation] pour définir la position du [FloatingActionButton]
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        // Utilisation de [BottomAppBar] pour avoir une barre en bas de la page
        // On peut utiliser [BottomNavigationBar] à la place de [BottomAppBar]
        // pour une barre de navigation en bas de la page
        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          child: Container(
            height: 50.0,
            color: Colors.white10,
          ),
        ),
      ));
}
