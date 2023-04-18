main() async {
  print('!!!!!!!!!!! Wait !!!!!!!!!!!');
  exempleWait();
  print('!!!!!!!!!!! Sync !!!!!!!!!!!');
  sync();
  print('!!!!!!!!!!! Value !!!!!!!!!!!');
  value();
  print('!!!!!!!!!!! Delayed !!!!!!!!!!!');
  exempleDelayed();
  print('!!!!!!!!!!! Error !!!!!!!!!!!');
  exempleError();
  print('!!!!!!!!!!! microtask !!!!!!!!!!!');
  microtask();
}

/// exemple de Future.delayed()
void exempleDelayed() {
  print('Avant Future');
  Future.delayed(Duration(seconds: 3), () {
    print('Future terminée');
  });
  print('Après Future'); ///<-- cette ligne s'exécute avant la ligne "Future terminée"
}

/// exemple de Future.error()
void exempleError() {
  print('Avant Future');
  Future.error('Future terminée');
  print('Après Future');
}

/// exemple de Future.microtask()
void microtask() {
  print('Début du programme');
  Future(() => print('Future exécuté'));
  Future.microtask(() => print('Microtask 1 exécuté'));
  Future.microtask(() => print('Microtask 2 exécuté'));
  print('Fin du programme');
}

/// exemple de Future.value()
Future<String> fetchData() {
  return Future.value("Données récupérées avec succès !");
}

void value() {
  fetchData().then((value) {
    print(value);
  });
}

/// exemple de Future.value()
void sync() async {
  print("Start");
  await Future.sync(() {
    // le code à exécuter de manière synchrone
    print("Running Future.sync()");
  });
  print("End");
}

/// Future.wait() permet de retourner une valeur après que toutes les futures soient terminées
void exempleWait() {
  print('Avant Future');
  Future.wait([
    Future.delayed(Duration(seconds: 3), () {
      print('Future 1 terminée');
    }),
    Future.delayed(Duration(seconds: 1), () {
      print('Future 2 terminée');
    }),
    Future.delayed(Duration(seconds: 4), () {
      print('Future 3 terminée');
    }),
  ]).then((_) {
    print('Toutes les futures sont terminées');
  });
  print('Après Future');

  ///<-- cette ligne s'exécute avant la ligne "Toutes les futures sont terminées"
}