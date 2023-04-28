void main() {

  /// Liste : itération

  var G7 = [
    "Allemagne",
    "Canada",
    "États-Unis",
    "France",
    "Italie",
    "Japon",
    "Royaume-Uni",
  ];
  print("--- List for each ---");
  print("La liste des pays du G7 : ");
  G7.forEach((pays) => print(pays.toUpperCase()));

  /// Ensemble : itérations

  var halogens = {'fluorine', 'chlorine', 'bromine', 'iodine', 'astatine'};

  print("--- Set for each ---");
  print("La liste des halogènes : ");
  halogens.forEach((halogen) => print(halogen));


  /// Dictionnaire : itération

  var cities = Map<String, String>();
  cities['one'] = 'paris';
  cities['two'] = 'londres';
  cities['three'] = 'turin';

  print("--- Map for each ---");
  print("Nom de villes : ");
  cities.forEach((key, name) =>
      print("La clé : ${key}, le nom de la ville : ${name} ")
  );
}