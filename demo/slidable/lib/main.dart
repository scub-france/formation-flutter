import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

void main() {
  runApp(
       MaterialApp(
          title: 'Slidable Demo',
          theme: ThemeData(
            primarySwatch: Colors.grey,
          ),
          home: const ShoeList())
  );
}

/// Utilisation de [Slidable] pour afficher une liste de chaussures avec des actions au swipe
/// Avec un léger swipe vers la droite, on peut afficher les actions (supprimer, modifier)
/// Avec un swipe plus important, on peut supprimer directement la chaussure
class ShoeList extends StatefulWidget {
  const ShoeList({super.key});

  @override
  createState() => _ShoeListState();
}

class _ShoeListState extends State<ShoeList> {
  // Liste des chaussures
  final List<Shoe> _shoes = [
    Shoe(id:1,name: 'Air Jordan 1', marque: 'Nike', price: 150),
    Shoe(id:2,name: 'Superstar', marque: 'Adidas', price: 80),
    Shoe(id:3,name: 'Old Skool', marque: 'Vans', price: 60),
    Shoe(id:4,name: 'Chuck Taylor All Star', marque: 'Converse', price: 50),
  ];

  @override
  build(_) => Scaffold(
      appBar: AppBar(
        title: const Text('Shoe List'),
      ),
      // si la liste est vide, on affiche un bouton pour ajouter des chaussures
      body: _shoes.isEmpty
          ? Center(
            child: ElevatedButton(
                onPressed: () {
                  _addShoe();
                },
                child: const Text("Add shoes")),
          )
          // sinon on affiche la liste des chaussures
          : ListView.builder(
              itemCount: _shoes.length,
              itemBuilder: (_, int index) {
                final shoe = _shoes[index];
                // voici le widget [Slidable]
                return Slidable(
                  // [key] permet de définir une clé unique pour chaque [Slidable]
                  // permet d'éviter des erreurs lors de la suppression d'un élément
                  key: Key(shoe.id.toString()),
                  // [startActionPane] permet de définir les actions à afficher lors d'un swipe vers la droite
                  startActionPane: ActionPane(
                    // [motion] permet de définir l'animation lors de l'affichage des actions
                    // n'hésitez pas à aller voir dans la doc, il y a un lien dans l'intro
                    // ici [DrawerMotion] permet d'avoir une animation de type tiroir
                    motion: const DrawerMotion(),
                    // [dragDismissible] permet de définir si on peut supprimer l'élément en faisant un swipe complet vers la droite
                    dragDismissible: true,
                    // [extentRatio] permet de définir le ratio de l'élément à afficher lors d'un swipe vers la droite
                    extentRatio: 0.25,
                    // [dismissible] permet de définir une action à effectuer lors d'un swipe complet vers la droite
                    dismissible: DismissiblePane(onDismissed: ()=> _deleteShoe(shoe)),
                    children: [
                      // [SlidableAction] permet de définir une action à afficher lors d'un swipe vers la droite
                      SlidableAction(
                        // sur cette exemple, on défini une action pour supprimer la chaussure
                        onPressed: (_) => _deleteShoe(shoe),
                        icon: Icons.delete,
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.red,
                      ),
                      SlidableAction(
                        // sur cette exemple, on défini une action pour modifier la chaussure
                        onPressed: (_) => _editShoe(shoe),
                        icon: Icons.edit,
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.green,
                      ),
                    ],
                  ),
                  // [child] permet de définir le widget à afficher
                  // ici on affiche un [ListTile] avec le nom et le prix de la chaussure
                  child: ListTile(
                    title: Text(shoe.name),
                    subtitle: Text('${shoe.marque} - \$${shoe.price}'),
                  ),
                );
              },
            ),
    );

  // fonction pour ajouter des chaussures
  _addShoe() {
    for (var i = 0; i < 2; i++) {
      setState(() {
        _shoes.add(Shoe(id: _shoes.length+1,name: 'Air Jordan 1', marque: 'Nike', price: 150),);
        _shoes.add(Shoe(id: _shoes.length+1,name: 'Superstar', marque: 'Adidas', price: 80),);
        _shoes.add(Shoe(id: _shoes.length+1,name: 'Old Skool', marque: 'Vans', price: 60),);
        _shoes.add(Shoe(id: _shoes.length+1,name: 'Chuck Taylor All Star', marque: 'Converse', price: 50),);
      });
    }
  }

  // fonction pour modifier une chaussure
  _editShoe(Shoe shoe) {
  setState(() {
      shoe.name = 'Air Jordan 1';
      shoe.marque = 'Nike';
      shoe.price = 150;
    });
  }

  // fonction pour supprimer une chaussure
  _deleteShoe(Shoe shoe) {
    setState(() {
      _shoes.remove(shoe);
    });
  }
}

class Shoe {
  late int id;
  late String name;
  late String marque;
  late double price;

  Shoe({required this.id ,required this.name, required this.marque, required this.price});
}
