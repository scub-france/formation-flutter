import 'package:equatable/equatable.dart';

// La classe Person hérite de la classe Equatable
class Person extends Equatable {
  // Les champs de la classe Person
  final String name;
  final int age;
  final String address;

  // Le constructeur de la classe Person
  const Person({required this.name, required this.age, required this.address});

  // La méthode get props renvoie une liste des champs qui doivent être pris en compte pour la comparaison
  @override
  List<Object> get props => [name, age, address];
}

void main() {
  // Création de trois instances de la classe Person
  const person1 = Person(name: 'John', age: 30, address: '123 Main St');
  const person2 = Person(name: 'John', age: 30, address: '123 Main St');
  const person3 = Person(name: 'Jean', age: 30, address: '123 Main St');

  // On peut utiliser l'opérateur == pour comparer les instances
  print(person1 == person2); // sera égal à true
  print(person1 == person3); // sera égale à false

  //Vous pouvez essayer d'instancier d'autre Person et de les comparer
}
