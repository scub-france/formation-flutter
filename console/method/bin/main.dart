import 'package:method/method.dart' as method;

import 'dart:io'; // Importation de la bibliothèque pour les entrées/sorties

// Définition de la fonction somme qui prend deux entiers en entrée et retourne leur somme
int somme(int a, int b) {
  int resultat = a + b; // Calcul de la somme
  return resultat; // Retourne le résultat de la somme
}

void main() {
  int x = 5; // Déclaration de la première variable
  int y = 10; // Déclaration de la deuxième variable

  int resultat =
      somme(x, y); // Appel de la fonction somme avec les valeurs de x et y

  // Affichage du résultat dans la console
  stdout.writeln("La somme de $x et $y est $resultat");

  // Instructions pour l'utilisateur
  stdout.writeln(
      "Déclarez une nouvelle variable entière a et assignez-lui une valeur de votre choix.");
  stdout.writeln(
      "Déclarez une nouvelle variable entière b et assignez-lui une valeur de votre choix.");
  stdout.writeln(
      "Appelez la fonction somme avec les variables a et b en paramètres.");
  stdout.writeln("Affichez le résultat de la somme dans la console.");
}
