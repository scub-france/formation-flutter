# Future

Dart exécute une opération à la fois, il est mono-thread, ce qui signifie que tant qu’une opération
est en cours d’exécution, elle ne peut être interrompue par un autre directive. 

Une Future **n'est pas exécutée** en parallèle mais en séquence d'événements,
gérés par l’Event-Loop (https://www.youtube.com/watch?v=vl_AaCgudcY)

A _exempleThen()_, voici ce qu'il ce passe :


- `print(‘Avant Future’)`
- ajouter ```(){print(‘Future active’);}``` à la queue “Event” 
- ``print(‘Après Future’)``
- l’Event-Loop récupère le code (référencé au point 2) et le lance quand le code se termine, il
  exécute enfin `then` puis renvoit le résultat.

## Méthodes de type Async

Lorsque vous suffixez la déclaration d’une méthode avec le mot clé `async`, Dart sait que:

- le résultat de la méthode est une Future, même si ce retour est void ->
  ex: `Future<void> main() async { ... };`
- il exécute le code de cette méthode de manière synchrone jusqu’au tout premier mot-clé `await`, puis
  il suspend l’exécution du reste de cette méthode.
- la prochaine ligne de code sera exécutée dès que la Future, référencée par le mot-clé `await`, sera
  terminé (pour des exemples, voir les exercices en rapport avec `async`).

Une méthode `async` n'est pas exécutée en parallèle mais selon la séquence normale des événements,
gérés par l’Event-Loop.

## Méthodes de type then

Then() est une méthode de Future qui permet de définir une action à effectuer lorsque la Future est
terminée. Cette méthode prend en paramètre une fonction qui sera exécutée lorsque la Future est
terminée. ex: `Future.delayed(const Duration(seconds: 2).then((v) => print(v));`

## Utiliser `await` ou `then`

`await` est utilisé pour attendre qu'un Future soit résolu avant de poursuivre l'exécution du code,
tandis que then est utilisé pour chaîner des opérations sur un Future après sa résolution.

# Liens

- [Dart async-await](https://dart.dev/codelabs/async-await)
- [Dart asynchrony support](https://dart.dev/guides/language/language-tour#asynchrony-support)
- https://api.flutter.dev/flutter/dart-async/Future-class.html
