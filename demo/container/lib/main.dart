import 'package:flutter/material.dart';

void main() {
  runApp(const ContainerWidget());
}

class ContainerWidget extends StatefulWidget {
  const ContainerWidget({super.key});

  @override
  State<ContainerWidget> createState() => _ContainerWidgetState();
}
/// Dans cet exemple, nous allons voir comment utiliser le widget [Container]
class _ContainerWidgetState extends State<ContainerWidget> {
  late final List<Widget> _container = <Widget>[_thirdExample(), _firstExample(), _secondExample()];

  @override
  build(_) => MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Container Demo'),
        ),
        // [ListView.separated] permet de créer une liste qui sera scollable horizontalement avec des séparateurs
        body: ListView.separated(
          scrollDirection: Axis.horizontal,
          separatorBuilder: (_,i) => const Divider(),
          // [itemBuilder] permet de créer un widget à partir d'un index
          itemBuilder: (_,index) => SizedBox(width: 480, child: _container[index]),
          // [itemCount] permet de définir le nombre d'éléments de la liste
          itemCount: _container.length,
        ),
      ));

  // Dans cet exemple, nous allons utiliser les propriétés [alignment], [color], [padding], [margin]
  Widget _thirdExample() => Column(
        children: [
          Container(
            // [alignment] permet de définir l'alignement du widget enfant
            alignment: Alignment.center,
            color: Colors.red,
            // [padding] permet de définir la marge interne du widget
            padding: const EdgeInsets.all(10),
            // [margin] permet de définir la marge externe du widget
            margin: const EdgeInsets.all(10),
            // [child] permet de définir le widget enfant
            child: const Text('Mon Conteneur'),
          ),
          Container(
            // [constraints] permet de définir les contraintes du widget enfant (ici, la hauteur)
            constraints: const BoxConstraints.expand(height: 200),
            color: Colors.blue,
            child: const Center(child: Text('Hello World')),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            color: Colors.green,
            child: const Text('Hello World'),
          ),
        ],
      );

  // Dans cet exemple, nous allons utiliser les propriétés [transform]
  Widget _firstExample() => Container(
        alignment: Alignment.center,
        // [transform] permet de définir une transformation sur le widget enfant
        // On peut utiliser [Matrix4.rotationZ] pour faire une rotation sur l'axe Z, [skewX] pour faire une déformation sur l'axe X
        transform: Matrix4.rotationZ(0.1),
        color: Colors.red,
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(10),
        child: const Text('Mon Conteneur'),
      );

  // Dans cet exemple, nous allons utiliser les propriétés [clipBehavior], [decoration]
  Widget _secondExample() => Container(
        // [clipBehavior] permet de définir le comportement du widget enfant lorsqu'il dépasse les limites du widget parent
        clipBehavior: Clip.antiAlias,
        transform: Matrix4.skewX(0.3),
        // [decoration] permet de définir la décoration du widget enfant
        // On peut utiliser [BoxDecoration] pour définir une décoration avec une couleur, un gradient, une image, un bordure, un ombre, un dégradé, etc.
        decoration: const BoxDecoration(
          // [gradient] permet de définir un dégradé avec l'utilisation de [LinearGradient] ou [RadialGradient]
          gradient: LinearGradient(
            // [begin] et [end] permettent de définir les points de départ et d'arrivée du dégradé
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            // [colors] permet de définir les couleurs du dégradé
            colors: [Colors.red, Colors.blue, Colors.green],
          ),
          color: Colors.blue,
        ),
        child: const Center(child: Text('Hello World')),
      );
}
