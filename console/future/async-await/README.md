## Méthodes de type Async

Le mot-clé "async" est utilisé pour définir une fonction asynchrone. Les fonctions asynchrones sont des fonctions qui peuvent être suspendues pendant l'exécution, le temps d'attendre une Future ou une Promesse. Lorsqu'une fonction asynchrone est appelée, elle renvoie immédiatement une Future, même si le calcul n'est pas terminé.

Le mot-clé "await" est utilisé pour attendre l'achèvement d'une Future ou d'une Promesse avant de poursuivre l'exécution du code. Lorsqu'un "await" est rencontré, la fonction asynchrone est suspendue et la valeur de la Future ou de la Promesse est renvoyée. La fonction reprend ensuite son exécution normale à partir de l'instruction suivant le "await".

Lorsque vous suffixez la déclaration d’une méthode avec le mot clé `async`, Dart sait que:

- le résultat de la méthode est une Future, même si ce retour est void ->
  ex: ``Future<void> main() async { ... };`
- il exécute le code de cette méthode de manière synchrone jusqu’au tout premier mot-clé await, puis
  il suspend l’exécution du reste de cette méthode.
- la prochaine ligne de code sera exécutée dès que la Future, référencée par le mot-clé await, sera
  terminé (pour des exemples, voir exo en rapport avec le async).

Une méthode async n'est pas exécutée en parallèle mais selon la séquence normale des événements,
gérés par l’Event Loop

# Liens

- [Dart async-await](https://dart.dev/codelabs/async-await)
- [Dart asynchrony support](https://dart.dev/guides/language/language-tour#asynchrony-support)
- https://api.flutter.dev/flutter/dart-async/Future-class.html
