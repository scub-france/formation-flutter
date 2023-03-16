import 'package:future/main.dart' as future;

class User {
  int userId;
  int id;
  String title;
  bool completed;

  User({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  });
}

///Exercice 1
/// Dans la fonction getUser ou main utilise async et await, pour faire en sorte de récupèrer le résultat de la fonction getUser() avant d'afficher "test"
/// Après avoir réussis, utlise le .then() pour modifier les informations de ton user et afficher le résultat
Future<void> getUser() async {
  User user = User(
    userId: 1,
    id: 1,
    title: 'scuber',
    completed: false,
  );
  Future.delayed(Duration(seconds: 3), () {
    print(user.title);
  });
}

void main() {
  // getUser();
  // print("test");
  //
  exo2();
}

/// Exercice 2
/// rajoute un await quelque part pour afficher D à la fin du programme
void exo2() async {
  methodA();
  await methodB();
  await methodC('main');
  methodD();
}

methodA() {
  print('A');
}

methodB() async {
  print('B start');
  await methodC('B');
  print('B end');
}

methodC(String from) async {
  print('C start from $from');

  Future(() {
    print('C running Future from $from');
  }).then((_) {
    print('C end of Future from $from');
  });

  print('C end from $from');
}

methodD() {
  print('D');
}
