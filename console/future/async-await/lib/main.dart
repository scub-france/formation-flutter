main() async {
  await exempleAsyncAwait();
}

/// exemple de Async et await
exempleAsyncAwait() async {
  print('Avant Future');
  await Future.delayed(Duration(seconds: 3), () {
    print('Future terminée');
  });
  print('Après Future'); ///<-- cette ligne s'exécute après la ligne "Future terminée"
}
