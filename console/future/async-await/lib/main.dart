main() async {
  exempleAsyncAwait();

  //le code ci-dessous va s'exécuter avant la fin de la fonction exempleAsyncAwait()
  //car elle n'est pas bloquée par un await
  print('Avant Future dans le main');
}

/// exemple de Async et await
exempleAsyncAwait() async {
  print('Avant Future');
  await Future.delayed(Duration(seconds: 3), () {
    print('Future terminée');
  });
  print('Après Future'); ///<-- cette ligne s'exécute après la ligne "Future terminée"
}
