# Dart et les extensions

Les méthodes d'extension ajoutent des fonctionnalités aux bibliothèques existantes auxquelles nous n'avons pas accès.
Prenons en exemple le type `Iterable`. Il appartient aux libraires de base de Dart mais nous pourrions avoir besoin
de méthodes utilitaires non disponibles. Les extensions peuvent compléter tous les types de classes.

## Explication

### Créer une extension :

``` dart
extension <extension name>? on <type> {
  (<member definition>)*
}
```

### Implémentation d'extensions génériques:

Les extensions peuvent avoir des paramètres de type génériques. Par exemple, voici un code qui étend le type intégré List<T> avec une méthode :
```dart

extension MonExtensionDeListe<T> on List<T> {
  /// Diviser une liste à un index défini
  List<List<T>> split(int at) => [sublist(0, at), sublist(at)];
}
```

Le type `MonExtensionDeListe` est lié en fonction du type de la liste sur laquelle les méthodes sont appelées.

### Regrouper les extensions dans un fichier

Une fois qu'on code une extension, il peut être intéressant de pouvoir l'utiliser partout dans un projet voir dans d'autres projets.
Pour ce faire, il suffit de placer l'extension dans un fichier qui sera importable.
Bravo, vous venez de créer une librairie!

### Conflit entre extension

Il existe des règles sur l'extension qui l'emporte lorsqu'il y en a plus d'une dans la portée qui s'applique. Fondamentalement, le gagnant est
l'extension avec le type le plus proche du type réel de l'expression sur laquelle elle est appliqué, avec quelques mises en garde et
conditions de départage. Cela "fonctionne" généralement pour les extensions qui sont écrites ensemble. Au lieu d'entrer dans ces détails,
je vais vous dire quoi faire quand ça ne marche pas.
Considérant les deux librairies suivantes :

    lib1.dart :
----------------------------------------------
        extension extension1 on String {
            String decorate()=> "***$this***";
        }
        Autres extensions........
-----------------------------------------------

    lib2.dart :
----------------------------------------------
        extension extension2 on String {
            String decorate()=> "###$this###";
        }
        Autres extensions........
-----------------------------------------------
Si on importe les deux extensions dans le meme fichier3.dart :
Fichier3.dart:
----------------------------------------------
        import chemain.../lib1;
        import chemain.../lib2;
        void main(List<String> arguments) {
            final test ="du_text";
            print(test.decorate());
        }
----------------------------------------------

Avez-vous vu le bug !?

Effectivement, avant même la compilation, l'IDE vous préviendra qu'il n'arrive pas à choisir quelle méthode appliquer!
Les deux méthodes portent le meme nom et affectent le même type....

La première solution consiste à utiliser une application d'extension explicite:
`nom_extension(donnée_a_traiter).nom_methode()`

On reprend ainsi l'exemple plus haut :
Fichier3.dart:
----------------------------------------------
        import chemain.../lib1;
        import chemain.../lib2;
        void main(List<String> arguments) {
            final test ="du_text";
            print(extension1(test).decorate());
            //ou print(extension2(test).decorate());
        }
----------------------------------------------

L'autre option consiste à modifier les imports avec `show` ou `hide` pour limiter la visibilité des membres:

Fichier3.dart:
----------------------------------------------
        import chemain.../lib1;
        // On masque le membre de la seconde librairie
        import chemain.../lib2 hide extension2;
        void main(List<String> arguments) {
            final test ="du_text";
            print(test.decorate());
        }
---------------------------------------------
