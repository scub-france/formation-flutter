### Future

Dart exécute une opération à la fois, l’une après l’autre, ce qui signifie que tant qu’une opération
est en cours d’exécution, elle ne peut pas être interrompue par un autre code Dart. Une Future N’EST
PAS exécutée en parallèle mais selon la séquence normale des événements,
gérés par l’Event Loop (https://dart.cn/articles/archive/event-loop)

A exempleThen(), voici ce qu'il ce passe :

- print(‘Avant Future’)
- ajouter “(){print(‘Future active’);}” à la queue “Event”; - print(‘Après Future’)
- l’Event Loop récupère le code (référencé au point 2) et le lance - quand le code se termine, il
  recherche le then() et l’exécute

## Méthodes de type Async

Lorsque vous suffixez la déclaration d’une méthode avec le mot clé async, Dart sait que:

- le résultat de la méthode est une Future, même si ce retour est void ->
  ex: Future<void> main() async { ... };
- il exécute le code de cette méthode de manière synchrone jusqu’au tout premier mot-clé await, puis
  il suspend l’exécution du reste de cette méthode.
- la prochaine ligne de code sera exécutée dès que la Future, référencée par le mot-clé await, sera
  terminé (pour des exemples, voir exo en rapport avec le async).

Une méthode async N’EST PAS exécutée en parallèle mais selon la séquence normale des événements,
gérés par l’Event Loop

## Méthodes de type then

Then() est une méthode de Future qui permet de définir une action à effectuer lorsque la Future est
terminée. Cette méthode prend en paramètre une fonction qui sera exécutée lorsque la Future est
terminée. exemple: Future.delayed(Duration(seconds: 2).then((value) => print(value));

# utilisation de await ou then

await est utilisé pour attendre qu'un Future soit résolu avant de poursuivre l'exécution du code,
tandis que then est utilisé pour enchaîner des opérations sur un Future une fois qu'il est résolu.

# doc

- [Dart async](https://dart.dev/codelabs/async-await)
- [Dart async](https://dart.dev/guides/language/language-tour#asynchrony-support)
- https://api.flutter.dev/flutter/dart-async/Future-class.html
