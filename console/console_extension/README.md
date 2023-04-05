# Dart et les extensions

Les méthodes d'extension ajoutent des fonctionnalités aux bibliothèques existantes.
Supposant qu'on a un traitement recurrent dans notre application par exemple sur un type Iterable et que
Notre type ne fourni pas une méthode pour réaliser ce traitement.
Une fois on code une methode qui réalise notre traitement, il peut etre interessant de pouvoir utiliser notre methode
partout dans le projet voir meme dans d'autres projets... les extensions nous facilite la tache.

## Comment faire

### Utilisez la syntaxe suivante pour créer une extension :
    extension <extension name>? on <type> {
    (<member definition>)*
    }
### Implémentation d'extensions génériques:
Les extensions peuvent avoir des paramètres de type génériques. Par exemple, voici un code qui étend le type intégré List<T> avec une méthode :
extension MaList<T> on List<T> {
List<List<T>> split(int at) => [sublist(0, at), sublist(at)];
}
Le type Test lié en fonction du type statique de la liste sur laquelle les méthodes sont appelées.

### Regrouper les extensions dans un fichier
Une fois qu'on code une extension, il peut etre interessant de pouvoir l'utiliser partout dans un projet voir meme dans d'autres projets !
Pour ce faire, il suffit de placer l'extension voir LES extensions dans un fichier qu'on pourra ensuite importer la ou l'on souhaite.
Bravo, vous venez de créer une librairie!!!

### Conflit entre extension
il existe des règles sur l'extension qui l'emporte lorsqu'il y en a plus d'une dans la portée qui s'applique. Fondamentalement, le gagnant est
l'extension avec un ontype le plus proche du type réel de l'expression sur laquelle vous appelez un membre, avec quelques mises en garde et
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
Si on imports les deux extensions dans le meme fichier3.dart :
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
Effectivement, avant meme la compilation, l'IDE vous préviendra qu'il n'arrive pas à se décider quelle méthode prendre !
ca reste logique, car les deux méthodes portent le meme nom et affectent le meme type....
La solution la plus simple consiste à utiliser une application d'extension explicite :
nom_extension(donnée_a_traiter).nom_methode()
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

Une autre option consiste à modifier la façon dont vous importez l'extension en conflit, en utilisant show ou hide pour limiter l'API exponsée :
supposons que dans notre code on a pas besoin des methodes de l'extension2, il serait pratique de pouvoir importer la librairie et pouvoir masquer
les extensions qui nous interessent pas et qui peuvent engendrer un conflit ! eh oui, c'est possible ! et voici comment :
Fichier3.dart:
----------------------------------------------
        import chemain.../lib1;
        import chemain.../lib2 hide extension2;
        void main(List<String> arguments) {
            final test ="du_text";
            print(test.decorate());
        }
---------------------------------------------
