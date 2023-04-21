import 'package:flutter/material.dart';

void main() {
  runApp(const ScaffoldWidget());
}

class ScaffoldWidget extends StatefulWidget {
  const ScaffoldWidget({super.key});

  @override
  State<ScaffoldWidget> createState() => _ScaffoldWidgetState();
}

/// Dans cet exemple, nous utiliserons toujours [Scaffold] mais avec un peu plus de complexité
class _ScaffoldWidgetState extends State<ScaffoldWidget> {
  // création d'une variable qui va permettre de savoir si la barre de recherche est visible ou non
  bool _searchVisible = false;
  // création d'une variable qui va permettre de savoir quel page est affiché
  int item = 0;
  // création d'une [List] qui va contenir les pages
  late final List page = [_page1(), _page2(), _page3()];

  @override
  build(_) => MaterialApp(
      title: 'Scaffold Widget Demo',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Exemple de Scaffold'),
          // Utilisation de [centerTitle] pour centrer le titre de l'AppBar
          centerTitle: true,
          // Utilisation de [elevation] pour changer l'ombre de l'AppBar
          elevation: 4.0,
          // Utilisation de [backgroundColor] pour changer la couleur de l'AppBar
          backgroundColor: Colors.grey,
          // Utilisation de [actions] pour ajouter des boutons à droite de l'AppBar
          actions: [
            // Utilisation de [IconButton] pour ajouter des boutons à l'AppBar et intéragir avec l'utilisateur
            IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {
                  // Utilisation de [setState] pour mettre à jour l'interface et afficher la barre de recherche
                  setState(() {
                    _searchVisible = !_searchVisible;
                  });
                }),
            IconButton(
              icon: const Icon(Icons.notifications),
              onPressed: () {},
            ),
          ],
          // Utilisation de [bottom] pour ajouter une barre en bas de l'AppBar
          bottom: _searchVisible
              ? const PreferredSize(
                  preferredSize: Size.fromHeight(48.0),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Rechercher...',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                )
              : null,
        ),
        // Utilisation de la List [page] pour afficher la page correspondante grâce à la variable [item]
        body: page[item],
        // Utilisation de [floatingActionButton] pour ajouter un bouton flottant
        // qui lors du clic affiche un message en bas de l'écran grâce à [ScaffoldMessenger]
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Message affiché'),
              ),
            );
          },
          // Utilisation de [backgroundColor] pour changer la couleur du bouton flottant
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          child: const Icon(Icons.arrow_upward),
        ),
        // Utilisation de [bottomNavigationBar] pour ajouter une barre de navigation en bas de l'écran
        bottomNavigationBar: BottomNavigationBar(
          // Utilisation de [currentIndex] pour savoir quel page est affiché
          currentIndex: item,
          // Utilisation de [onTap] pour savoir quel page à été sélectionné
          onTap: (index) {
            // Utilisation de [setState] pour mettre à jour l'interface et afficher la page correspondante
            setState(() {
              item = index;
            });
          },
          // Utilisation de [items] pour ajouter les icons qui feront référence aux pages
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Accueil',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.explore),
              label: 'Explorer',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profil',
            ),
          ],
          // Utilisation de [selectedItemColor] pour changer la couleur de l'icone sélectionné
          selectedItemColor: Colors.blue,
          // Utilisation de [unselectedItemColor] pour changer la couleur de l'icone non sélectionné
          unselectedItemColor: Colors.grey,
          // Utilisation de [showUnselectedLabels] pour afficher ou non le label de l'icone non sélectionné
          showUnselectedLabels: true,
        ),
        // Utilisation de [drawer] pour ajouter un drawer à gauche de l'écran (drawer est un widget qui s'affiche sur le côté de l'écran)
        // comme un menu
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              // Utilisation de [UserAccountsDrawerHeader] pour ajouter un header au drawer avec des informations sur l'utilisateur
              const UserAccountsDrawerHeader(
                accountName: Text('Jean Paul'),
                accountEmail: Text('jeanpaul@example.com'),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage('https://picsum.photos/seed/picsum/200/300'),
                ),
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
              ),
              // Utilisation de [ListTile] pour ajouter des éléments au drawer
              ListTile(
                leading: const Icon(Icons.person),
                title: const Text('Profil'),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text('Paramètres'),
                onTap: () {},
              ),
              // Utilisation de [Divider] pour ajouter une ligne de séparation entre les éléments du drawer
              const Divider(),
              ListTile(
                leading: const Icon(Icons.exit_to_app),
                title: const Text('Se déconnecter'),
                onTap: () {},
              ),
            ],
          ),
        ),
        backgroundColor: Colors.grey[200],
        // Utilisation de [resizeToAvoidBottomInset] pour éviter que le clavier cache les éléments de l'interface si il est true
        // si il est false, l'interface ne sera pas redimensionnée
        resizeToAvoidBottomInset: false,
        // Utilisation de [drawerEnableOpenDragGesture] pour activer ou non le glissement pour ouvrir le drawer (sur mobile)
        drawerEnableOpenDragGesture: false,
        // Utilisation de [drawerScrimColor] pour changer la couleur du fond du drawer
        drawerScrimColor: Colors.black45,
        // Utilisation de [drawerEdgeDragWidth] pour changer la largeur du glissement pour ouvrir le drawer
        drawerEdgeDragWidth: 200.0,
        // Utilisation de [drawerDragStartBehavior] pour changer le comportement du glissement pour ouvrir le drawer (sur desktop)
        endDrawerEnableOpenDragGesture :true,
      ));

  // Utilisation de [Widget] afin de simuler des pages
  Widget _page1() => const Center(
        child: Text(
          'Page 1',
          style: TextStyle(fontSize: 24.0),
        ),
      );

  Widget _page2() => const Center(
        child: Text(
          'Page 2',
          style: TextStyle(fontSize: 24.0),
        ),
      );

  Widget _page3() => const Center(
        child: Text(
          'Page 3',
          style: TextStyle(fontSize: 24.0),
        ),
      );

}
