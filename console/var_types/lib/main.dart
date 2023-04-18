void main() {
  // Déclarez une variable `age` et assignez-lui la valeur 25
  int age = 25;

  // Affichez la valeur de la variable `age`
  print('J\'ai $age ans.');

  // Changez la valeur de la variable `age`
  age = 30;

  // Affichez la nouvelle valeur de la variable `age`
  print('J\'ai maintenant $age ans.');

  // Déclarez une variable `nom` de type String et assignez-lui une valeur
  String nom = 'Jean Dupont';

  // Affichez la valeur de la variable `nom`
  print('Je m\'appelle $nom.');

  // Déclarez une variable `patesPrete` de type bool et assignez-lui une valeur
  bool patesPrete = true;

  // Vérifiez si les pâtes sont prête et affichez un message approprié
  if (patesPrete) {
    print('Miam !');
  }

  // Déclarez une variable `montant` de type double et assignez-lui une valeur
  double montant = 50.0;

  // Multipliez le montant par 1.1 (10% de pourboire) et affichez le résultat
  montant *= 1.1;
  print('Le montant total avec le pourboire est de $montant euros.');

  // Déclare une variable `type` et affiche son type, déduit par Dart
  var type = "value";
  print(type.runtimeType);
}
