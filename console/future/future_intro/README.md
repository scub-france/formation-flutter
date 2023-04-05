# Future

Contrairement à un calcul synchrone qui renvoie immédiatement un résultat, un calcul asynchrone ne
peut pas fournir un résultat immédiatement lorsqu'il est lancé. Cela peut être dû au fait qu'un
calcul asynchrone peut avoir besoin d'attendre quelque chose d'extérieur au programme (comme la
lecture d'un fichier, l'interrogation d'une base de données, ou la récupération d'une page Web), ce
qui prend du temps.

Au lieu de bloquer tout calcul jusqu'à ce que le résultat soit disponible, un calcul asynchrone
renvoie immédiatement une Future qui finira par "se terminer" avec le résultat. Cette Future
représente essentiellement la promesse que le résultat sera disponible à un moment donné dans le
futur. Une fois que le résultat est disponible, la Future est remplie avec le résultat et toutes les
méthodes then() associées à la Future seront exécutées. Dart exécute une opération à la fois, il est
mono-thread, ce qui signifie que tant qu’une opération est en cours d’exécution, elle ne peut être
interrompue par un autre directive.

Une Future **n'est pas exécutée** en parallèle mais en séquence d'événements, gérés par l’Event
Loop (https://www.youtube.com/watch?v=vl_AaCgudcY)

## Constructeurs

Future possède plusieurs constructeurs:

`Future.delayed`: permet de créer une Future qui sera résolue après un certain délai \
`Future.value`: permet de créer une Future qui sera résolue avec une valeur donnée \
`Future.error`: permet de créer une Future qui sera résolue avec une erreur donnée \
`Future.microtask` : exécute une tâche de manière asynchrone, mais avec une priorité plus élevée que
les tâches qui sont en attente dans la queue d'attente des Futures. \
`Future.sync`: pour exécuter une tâche de manière synchrone, ce qui signifie que la tâche sera
exécutée immédiatement sans être placée dans la queue d'événements et sans bloquer le thread
principal.
`Future.wait`: permet de créer une Future qui sera résolue lorsque toutes les Futures passées en
paramètre seront résolues.

## Utiliser `await` ou `then` ou `isolate`

`await` est utilisé pour attendre qu'un Future soit résolu avant de poursuivre l'exécution du code,
tandis que then est utilisé pour enchaîner des opérations sur un Future une fois qu'il est résolu.En
revanche, l'isolate est utilisé pour exécuter du code de manière isolée et asynchrone par rapport au
thread principal de l'application.

# Liens

- [Dart async-await](https://dart.dev/codelabs/async-await)
- [Dart asynchrony support](https://dart.dev/guides/language/language-tour#asynchrony-support)
- https://api.flutter.dev/flutter/dart-async/Future-class.html
