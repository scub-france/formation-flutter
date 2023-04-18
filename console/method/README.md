
# Methodes
En Dart, une méthode est un bloc de code qui effectue une action ou un calcul spécifique. Elle est
définie à l'intérieur d'une classe et peut être appelée sur une instance de cette classe pour
réaliser l'opération souhaitée.

Pour déclarer une méthode en Dart, on doit spécifier son nom, ses paramètres d'entrée (s'il y en a)
et son type de retour (s'il y en a). Par exemple, voici une méthode simple qui prend deux entiers et
retourne leur somme :

```dart
 int additionner(int a, int b) {
  return a + b;
}
```  

On peut appeler cette méthode sur une instance de la classe où elle est définie ou de manière
statique sur la classe elle-même, en fonction de la façon dont elle est déclarée.

Les méthodes en Dart peuvent également être utilisées pour modifier l'état interne d'une instance de
classe, ce qui peut être utile pour réaliser des opérations plus complexes. Dans ce cas, on peut
utiliser le mot-clé "void" pour indiquer qu'elle ne renvoie rien :

```dart
void incrementer() {
  _compteur++;
}
```

Ici, la méthode "incrementer" incrémente un compteur privé appelé "_compteur". On peut l'appeler sur
une instance de la classe pour modifier cet état interne.

En résumé, les méthodes en Dart sont des blocs de code qui effectuent des opérations spécifiques,
définies à l'intérieur d'une classe et appelées sur des instances de cette classe pour réaliser des
tâches.