void main() {

  /// Spread Operator (…) et Null-aware Spread Operator (…?) sont utilisés pour insérer plusieurs éléments dans une collection comme des listes, des cartes, etc.


  print("--- Spread operators avec List ---");

  /// liste
  List listA = ["Geeks", "For", "Geeks"];
  print("La première liste : ");
  print(listA);

  /// nouvelle liste sur la base de la première
  List listB = ["Wow", ...listA, "is", "amazing"];
  print("La seconde liste listB : ");
  print(listB);


  print("--- Spread operators avec Map ---");

  /// dictionnaire
  Map mapA = { "eric": 35, "julie": 37, "marc": 42};
  print("Le premier dictionnaire : ");
  print(mapA);

  /// nouveau dictionnaire sur la base du premier
  Map mapB = { "antoine": 25, ...mapA};
  print("La seconde mapLe second dictionnaire mapB : ");
  print(mapB);


  print("--- Spread operators avec Set ---");

  /// ensemble
  Set setA = { "eric", "julie", "marc"};
  print("Le premier ensemble : ");
  print(setA);

  /// nouvel ensemble sur la base de du premier
  Set setB = { "antoine", ...setA};
  print("La seconde ensemble setB : ");
  print(setB);


  print("--- Control-flow operators avec List ---");

  /// liste avec condition (if)
  bool isBrexit = true;
  List cities = ["Berlin", "Paris", "Madrid", if (!isBrexit) "London"];
  print("Les villes après Brexit : ");
  print(cities);

  /// liste avec itération (for)
  List letters = ["H", "e", "l", "l", for (int i = 0; i < 10; i++) "o"];
  print("Messages de bienvenue : ");
  print(letters.join(""));

  print("--- Control-flow operators avec Map ---");

  /// dictionnaire avec condition (if)
  bool mixte = true;
  Map firstnamesAndAge = { "eric": 35, "marc": 42, if (mixte) "julie": 37};
  print("Les prénoms / âges mixtes : ");
  print(firstnamesAndAge);

  /// dictionnaire avec itération (for)
  Map gifts = { "cadeau 1": "chocolate", for (int i = 2; i <= 5; i++) "cadeau " + i.toString(): "flowers"};
  print("Les cadeaux de la Saint Valentin : ");
  print(gifts);


  print("--- Control-flow operators avec Set ---");

  /// ensemble avec condition (if)
  mixte = true;
  Set firstnames = {"eric", "marc", if (mixte) "julie"};
  print("Les prénoms mixtes : ");
  print(firstnames);

  /// ensemble avec itération (for)
  Set wishlist = { "chocolate", for (int i = 1; i <= 5; i++) "flowers " + i.toString()}; // ne pas oublier que pour un ensemble, les éléments sont uniques
  print("Les cadeaux de la Saint Valentin : ");
  print(wishlist);

}
