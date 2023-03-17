# gorouter

# Liens

https://zapp.run/github/Robert-Scub/formation-flutter/tree/main/demo/gorouter/gorouter_intro

Gestion gorouter

## go_router... ok, mais c'est qui ce router ?

go_router est un package Flutter qui permet de gérer la navigation dans une application en utilisant des routes. 
Il offre des fonctionnalités avancées telles que la gestion des itinéraires de navigation et la personnalisation de l'apparence des itinéraires de navigation.

## Getting Started

Pour utiliser go_router, il faut installer le package:
"go_router" :sweat_smile:

_Deux façons de l'installer_ :

-Taper dans la console du projet => `flutter pub add go_router`;

-Se rendre dans le fichier pubspec.yaml et y inscrire le package =>

"dependencies:
    go_router: ^6.2.0"
(attention à l'indentation). Lancer impérativement la commande `flutter pub get` pour que le package soit intégré au projet.

Ensuite, il faut faire appel à ce package lors de l'utilisation de go_router. 
Dans vos fichiers où vous faites appel à go_router, vous devez noter:

`import 'package:go_router/go_router.dart';`

Note: 
Si vous déjà installé le package et que vous mettez une 'route' en place, votre IDE pointera une erreur et vous proposera d'importer go_router.

## Fonctionnalitées

#### Gestion des itinéraires:

go_router vous permet de définir facilement des itinéraires de navigation dans votre application. 
Vous pouvez définir des itinéraires pour chaque page de votre application, et go_router se chargera de les afficher lorsque l'utilisateur navigue dans votre application.

#### Gestion des erreurs de navigation:

Lorsque l'utilisateur navigue vers une page qui n'existe pas ou qui n'est pas autorisée, go_router peut afficher une page d'erreur personnalisée.
Vous pouvez définir une page d'erreur personnalisée pour chaque type d'erreur de navigation, ce qui facilite la gestion des erreurs dans votre application.

#### Transitions d'écran personnalisées:

go_router vous permet de personnaliser les transitions d'écran lorsque l'utilisateur navigue dans votre application. 
Vous pouvez définir des transitions personnalisées pour chaque itinéraire, ou utiliser une transition par défaut pour tous les itinéraires.

#### Gestion de l'état de navigation:

go_router facilite la gestion de l'état de navigation dans votre application. 
Vous pouvez utiliser l'état de navigation pour stocker des informations sur la position actuelle de l'utilisateur dans votre application, et pour faciliter la navigation en arrière et en avant.

#### Gestion des paramètres de navigation:

Lorsque l'utilisateur navigue vers une page, il peut souvent être utile de passer des paramètres à cette page. 
go_router facilite la gestion des paramètres de navigation en les stockant dans l'état de navigation. 
Vous pouvez récupérer ces paramètres dans la page de destination en utilisant la propriété state.


En utilisant go_router, vous pouvez facilement créer une navigation personnalisée dans votre application Flutter, 
avec des fonctionnalités telles que la gestion des erreurs, les transitions personnalisées et la gestion de l'état et des paramètres de navigation.
