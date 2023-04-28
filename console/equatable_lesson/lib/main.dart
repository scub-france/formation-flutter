import 'package:equatable/equatable.dart';

// Etendre Equatable
class Utilisateur extends Equatable {
  final String nom;
  final int age;

  // Constructeur
  const Utilisateur({required this.nom, required this.age});

  // Sélection des propriétés pour comparaison
  @override
  List<Object> get props => [nom, age];

  // Bénéficier de toString()
  @override
  bool get stringify => true;
}

void main() {
  // Création de trois instances de la classe Utilisateur
  final u1 = Utilisateur(nom: 'John', age: 30);
  final u2 = Utilisateur(nom: 'John', age: 30);
  final u3 = Utilisateur(nom: 'Jean', age: 43);

  // On peut utiliser l'opérateur == pour comparer les instances
  // Les instances sont différents mais la comparaison est OK
  print(u1 == u2);
  // Valeur sont bien différentes
  print(u1 == u3);

  // Bénéficier de toString()
  print(u1);
}
