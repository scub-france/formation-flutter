A sample command-line application with an entrypoint in `bin/`, library code
in `lib/`, and example unit test in `test/`.

## Method

En Dart, les méthodes de la console sont utilisées pour interagir avec la console du système d'exploitation, où vous pouvez entrer des commandes et obtenir des résultats. Dart fournit une classe appelée dart:io qui contient des méthodes pour travailler avec la console. Voici quelques-unes des méthodes les plus couramment utilisées :

    - stdout.write() : Cette méthode permet d'écrire une chaîne de caractères dans la sortie standard de la console. Par exemple, stdout.write("Bonjour"); affichera "Bonjour" dans la console.

    - stdout.writeln() : Cette méthode permet d'écrire une chaîne de caractères suivie d'un saut de ligne dans la sortie standard de la console. Par exemple, stdout.writeln("Bonjour"); affichera "Bonjour" suivi d'un saut de ligne dans la console.

    - stdin.readLineSync() : Cette méthode permet de lire une ligne de texte entrée par l'utilisateur dans l'entrée standard de la console. Par exemple, var ligne = stdin.readLineSync(); lira une ligne de tex`te entrée par l'utilisateur et stockera cette ligne dans la variable ligne.

    - stdout.writeAll() : Cette méthode permet d'écrire une liste de chaînes de caractères dans la sortie standard de la console, séparées par un caractère spécifié. Par exemple, stdout.writeAll(["Bonjour", "monde"], " "); affichera "Bonjour monde" dans la console.

    - stdout.clearScreen() : Cette méthode permet d'effacer le contenu de la console. Par exemple, 
    stdout.clearScreen(); effacera tout le contenu de la console.

    - exit() : Cette méthode permet de quitter le programme. Par exemple, exit(0); quittera le programme avec un code de retour 0.

Voici un exemple d'utilisation de ces méthodes dans un programme Dart :

```dart

import 'dart:io';

void main() {
  stdout.writeln("Quel est votre nom ?");
  var nom = stdin.readLineSync();
  stdout.writeAll(["Bonjour", nom], " ");
  stdout.writeln("!");
}
```

Dans cet exemple, le programme demande le nom de l'utilisateur à l'aide de la méthode stdin.readLineSync() et utilise ensuite les méthodes stdout.writeAll() et stdout.writeln() pour afficher le message "Bonjour <nom> !" dans la console.

J'espère que cela vous a aidé à comprendre les méthodes de la console en Dart !