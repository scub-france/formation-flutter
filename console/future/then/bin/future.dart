import 'package:future/main.dart' as future;

class User {
  int userId;
  int id;
  String nom;
  bool completed;

  User({
    required this.userId,
    required this.id,
    required this.nom,
    required this.completed,
  });
}

///Exercice 1
/// modifie la methode main, afin de récuperer t'on user grâce à un then et modifie par la suite le nom de ce user et affiche le nom de l'user modifié
User getUser() {
  User user = User(
    userId: 1,
    id: 1,
    nom: 'scuber',
    completed: false,
  );
  return user;
}

void main() {
  Future.delayed(Duration(seconds: 1), () {
    getUser();
  });
  // getUser();
}

///Exo 2 : Créez une fonction asynchrone qui simule une opération asynchrone qui prend 3 secondes pour s'exécuter et qui renvoie
///une chaîne de caractères "Done". Utilisez "then" pour afficher la valeur retournée par cette fonction à la console.


/// Exo 3 :Créez une fonction asynchrone qui récupère les données à partir d'une API RESTful
/// (par exemple, https://jsonplaceholder.typicode.com/posts). La fonction doit renvoyer une liste de titres d'articles
/// sous forme de Future<List<String>>. Utilisez "then" pour afficher les titres d'articles récupérer