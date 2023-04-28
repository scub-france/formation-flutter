import 'package:flutter/material.dart';

## KEY

// Pour utiliser une clé dans Flutter, il suffit de créer une nouvelle instance du type de clé souhaité
// et de la passer au constructeur du widget :

Widget monWidget = MonWidget(key: GlobalKey());

//En fournissant une clé à un widget, vous permettez à Flutter de gérer efficacement l'arbre de widgets
// et de garantir qu'il est toujours à jour avec l'état le plus récent de votre application.

## ValueKEY

//Par exemple, considérons une liste d'objets Person.
// Chaque personne a un identifiant unique et un nom.
// Pour créer une liste de widgets Person,
// nous pourrions utiliser le constructeur ListView.builder,
// qui nécessite un objet Key pour chaque élément de la liste.
// Étant donné que chaque objet Person a un identifiant unique,
// nous pouvons utiliser un objet ValueKey basé sur l'identifiant pour identifier chaque widget Person :



ListView.builder(
itemCount: persons.length,
itemBuilder: (context, index) {
final person = persons[index];
return PersonWidget(
key: ValueKey(person.id),
name: person.name,
);
},
);

//En utilisant une ValueKey avec la valeur id de chaque Person,
// nous nous assurons que Flutter peut mettre à jour efficacement l'arborescence du widget lorsque la liste des objets Person change,
// par exemple lorsqu'une nouvelle Person est ajoutée ou qu'une Person existante est mise à jour.

## Global KEY

//Pour utiliser une GlobalKey, vous pouvez créer une instance de GlobalKey dans votre classe de widget :
GlobalKey<MyWidgetState> myWidgetKey = GlobalKey<MyWidgetState>();

//Vous pouvez ensuite passer cette clé à votre widget :
MyWidget(key: myWidgetKey)

//Pour référencer le widget associé à la GlobalKey, vous pouvez utiliser la méthode currentState de la clé :
MyWidgetState myWidgetState = myWidgetKey.currentState;
