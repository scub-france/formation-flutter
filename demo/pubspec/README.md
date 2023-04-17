# Pubspec


## Pourquoi lui ?

Le fichier `pubspec.yaml` est un fichier de configuration pour votre application Flutter qui contient des informations sur les dépendances, les ressources et les métadonnées de votre projet. 

Il est essentiel pour toute application Flutter, car il spécifie les packages et les ressources utilisés par votre application.

Le fichier `pubspec.yaml` est un fichier YAML (Yet Another Markup Language) qui est utilisé par Flutter pour gérer les packages et les dépendances de votre application. 

Il contient des informations sur les packages tiers que vous avez ajoutés à votre projet, ainsi que des informations sur les ressources telles que les polices de caractères, les images et les fichiers de traduction.

Voici un exemple de fichier `pubspec.yaml` de base :

`name: mon_application
description: "Ceci est une application de démonstration"
version: 1.0.0
dependencies:
    flutter:
        sdk: flutter
    cupertino_icons: ^1.0.3`


Dans cet exemple, nous avons défini le nom de l'application, sa description et sa version. 

Nous avons également déclaré que notre application dépend de Flutter en utilisant la clé `flutter` et spécifié que nous avons besoin de l'icône `Cupertino` en utilisant la clé `cupertino_icons`. 

La version de `cupertino_icons` est spécifiée en utilisant le symbole ^ qui signifie que nous voulons la dernière version compatible.

Une fois que vous avez modifié votre fichier `pubspec.yaml`, vous devez exécuter la commande `flutter pub get` pour télécharger et installer les packages et les dépendances que vous avez spécifiés. 

Cette commande doit être exécutée chaque fois que vous modifiez votre fichier `pubspec.yaml`.


## Comment enrichir le pubspec ?

Il y a deux façons courantes d'ajouter des packages à votre projet Flutter :

-En tapant le nom du package directement dans le fichier `pubspec.yaml`.
-En utilisant la commande `flutter pub add` + le nom du package.


Voici un exemple de la façon d'ajouter le package http à votre projet Flutter :

1.Ouvrez le fichier `pubspec.yaml` de votre projet.
2.Sous la clé `dependencies`, ajoutez le package http :

`dependencies:
    flutter:
        sdk: flutter
    http: ^0.13.3`

Dans cet exemple, nous avons ajouté la dépendance http avec la version 0.13.3.

Pour être à jour, vous pouvez ajouter des dépendances en ne mettant aucune version, de cette façon:

`dependencies:
    flutter:
        sdk: flutter
    http:`

De cette façon, la dernière version du package `http` sera installé, et cela, à chaque fois que vous relancerez la commande `flutter pub get`.

3.Enregistrez le fichier pubspec.yaml.

Alternativement, vous pouvez ajouter la dépendance `http` en utilisant la commande `flutter pub add` dans votre terminal :


`flutter pub add http`

Une fois que vous avez ajouté un package à votre projet, vous pouvez l'importer dans vos fichiers Dart en utilisant la directive import. 

Par exemple, pour importer le package http, vous pouvez ajouter la ligne suivante au début de votre fichier Dart :

`import 'package:http/http.dart' as http;`

Cela importera le package http dans votre fichier Dart et vous permettra d'utiliser ses fonctionnalités dans votre code.

En résumé, vous pouvez ajouter des packages à votre projet Flutter en ajoutant le nom du package directement dans le fichier pubspec.yaml ou en utilisant la commande flutter pub add. Une fois que vous avez ajouté un package, vous pouvez l'importer dans vos fichiers Dart en utilisant la directive import.


## Conclusion

Le fichier pubspec.yaml est un fichier important dans le développement d'applications Flutter. 

Il contient des informations sur les dépendances et les ressources de votre application et doit être mis à jour chaque fois que vous ajoutez ou supprimez des packages ou des ressources.
