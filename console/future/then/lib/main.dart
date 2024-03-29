
main() async {
  doInSeconds(2).then((result) {
    print(result);
  }).catchError((error) {
    print('> dans le cacheError');
    print(error);
  });
}

Future<int> doInSeconds(int sec) {
  print('> Le temps en seconde est de =${sec}...');

  if (sec <= 0) {
    return Future.error('> le temp \'sec\' doit être supérieur à 0');
  }

  return Future.delayed(Duration(seconds: sec), () => sec).then((sec) {
    print('sec = ${sec} second(s) à la fin du future et je peux interragir avec la valeur retourner par ce future grâce au then.');
    sec = sec * 2;
    print('> Maintenant sec = ${sec} second(s).');
    return sec;
  });
}