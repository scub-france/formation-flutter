#Isolate 
### Qu’est-ce qu’un Isolate

Un isolate en Dart est une unité de traitement isolée qui s'exécute en parallèle avec le reste de l'
application. C'est une sorte de thread léger qui permet de traiter des tâches lourdes en
arrière-plan sans bloquer l'interface utilisateur.

Chaque isolate dispose de son propre espace mémoire et s'exécute de manière indépendante des autres
isolates et de l'application principale. Cela permet de préserver la stabilité et la réactivité de
l'interface utilisateur, même lorsque des tâches lourdes sont en cours d'exécution en arrière-plan.

En résumé, les isolates en Dart sont des unités de traitement isolées qui permettent de traiter des
tâches lourdes en arrière-plan sans bloquer l'interface utilisateur. Ils peuvent être gérés à l'aide
de la classe **`Isolate`**
et communiquer entre eux et avec l'application principale en utilisant des ports.

### Comment lancer un Isolate/Comment ça fonctionne

  **Remarque Flutter :** si vous utilisez Flutter, envisagez
  d'utiliser [la fonction Flutter`compute()`](https://api.flutter.dev/flutter/foundation/compute-constant.html)
  au lieu de `Isolate.run()`. La `compute`fonction permet à votre code de fonctionner sur
  des [plates-formes natives et non natives](https://dart.dev/overview#platform) . À
  utiliser `Isolate.run()`uniquement lorsque vous ciblez des plateformes natives pour une API plus
  ergonomique.

  Pour créer un isolate en Dart, vous devez d'abord importer la classe **`Isolate`** à partir du
  module **`dart:isolate`**. Ensuite, vous pouvez utiliser la méthode **`Isolate.spawn()`** pour
  créer un nouvel isolate.

  Voici un exemple de code qui crée un nouvel isolate et y exécute une fonction
  appelée **`isolateFunction()`** :

    ```dart

    import 'dart:isolate';
    
    void isolateFunction() {
      // Code à exécuter dans l'isolate
    }
    
    void main() async {
      Isolate isolate = await Isolate.spawn(isolateFunction);
    }
    
    ```

  Dans cet exemple, la fonction **`isolateFunction()`** sera exécutée dans le nouvel isolate créé
  par la méthode **`Isolate.spawn()`**. Notez que la méthode **`Isolate.spawn()`** renvoie une
  future, donc nous utilisons l'opérateur `await` pour attendre la fin de la création de
  l'isolate.

  Maintenant que l'isolate est créé, vous pouvez communiquer avec lui en utilisant des ports. Les
  ports sont des canaux de communication unidirectionnels qui permettent d'envoyer et de recevoir
  des messages entre les isolates.

  Voici un exemple de code qui envoie un message à l'isolate et attend une réponse :

    ```dart
    
    import 'dart:isolate';
    
    void isolateFunction() {
      ReceivePort receivePort = ReceivePort();
      sendPort.send(receivePort.sendPort);
      receivePort.listen((message) {
        print('Message reçu dans l\'isolate : $message');
      });
    }
    
    void main() async {
      ReceivePort receivePort = ReceivePort();
      Isolate isolate = await Isolate.spawn(isolateFunction, receivePort.sendPort);
      SendPort sendPort = await receivePort.first;
      sendPort.send('Bonjour depuis l\'application principale !');
    }
    
    ```

  Dans cet exemple, nous créons un port **`ReceivePort`** dans l'isolate et envoyons son port d'
  envoi à l'application principale en utilisant la méthode **`send()`**. Ensuite, nous écoutons les
  messages reçus sur ce port en utilisant la méthode **`listen()`**. Dans l'application principale,
  nous envoyons un message à l'isolate en utilisant le port d'envoi que nous avons reçu
  précédemment, et attendons une réponse en utilisant la méthode **`first`** du
  port **`ReceivePort`**.

  En suivant ces étapes, vous pouvez créer un isolate en Dart et communiquer avec lui en utilisant
  des ports. Il est important de noter que les isolates doivent être bien gérés pour éviter les
  fuites de mémoire et les conflits de synchronisation, donc assurez-vous de bien comprendre comment
  les isolates fonctionnent avant de les utiliser dans votre application.

### Quand devrais-je utiliser des Futures et/ou des Isolates

  Les Futures et les Isolates sont deux mécanismes de Dart qui permettent de gérer des tâches
  asynchrones. Cependant, ils sont utilisés dans des contextes différents.

  Les Futures sont utilisés pour exécuter des tâches asynchrones de manière non bloquante. Par
  exemple, si vous avez besoin d'exécuter une tâche qui prend du temps (comme une requête réseau),
  vous pouvez utiliser un Future pour exécuter cette tâche en arrière-plan tout en permettant à
  votre application de continuer à s'exécuter. Une fois que le Future a terminé de s'exécuter, il
  retourne un résultat (ou une erreur) à votre application.

  Les Isolates, quant à eux, sont utilisés pour exécuter des tâches de manière parallèle en
  utilisant plusieurs threads. Ils sont particulièrement utiles pour les tâches qui nécessitent
  beaucoup de calculs (par exemple, le traitement d'images ou de vidéos). Les isolates s'exécutent
  dans un environnement séparé de votre application, ce qui signifie que les erreurs ou les
  plantages qui se produisent dans un isolate n'affectent pas le reste de votre application.

  En résumé, vous devriez utiliser des Futures lorsque vous avez besoin d'exécuter des tâches
  asynchrones de manière non bloquante et des isolates lorsque vous avez besoin d'exécuter des
  tâches de manière parallèle. Si vous n'êtes pas sûr de la méthode à utiliser, vous pouvez vous
  poser les questions suivantes : La tâche nécessite-t-elle beaucoup de calculs ? Est-ce que je dois
  exécuter la tâche de manière indépendante de l'application ? Si la réponse est "oui" à l'une ou l'
  autre de ces questions, alors l'utilisation d'un isolate est probablement plus appropriée que
  l'utilisation d'un Future.
  
## Link

- [Dart Isolates](https://dart.dev/language/concurrency)