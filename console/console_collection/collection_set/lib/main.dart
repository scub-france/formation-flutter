void main() {

  /**
   * Déclaration d'un ensemble
   */

  print('--- Déclaration ---');
  var mySet = {
    'londres',
    'paris',
    'turin',
  };

// Mon ensemble
  print(mySet);
  print("La longueur de mon ensemble est : ${mySet.length}");

  // L'action ci-dessous sera ignorée car les éléments dans un ensemble sont uniques
  mySet.add('paris');

// Mon ensemble ne change pas
  print(mySet);
  print("La longueur de mon ensemble est toujours : ${mySet.length}");

  print("Le premier élément : ${mySet.first} ");
  print("Le dernier élément : ${mySet.last} ");
  print("L'élément à l'indice 1 : ${mySet.elementAt(1)}");

  /**
   * Itération
   */

  print('--- Boucle for each ---');
  mySet.forEach((value) =>
      print("La valeur est \"${value}\" ")
  );

  /**
   * Supression de tous les éléments
   */
  
  print('--- Suppression ---');
  mySet.clear();
  // Mon ensemble vidé
  print(mySet);

  print("La longueur de mon nouvel ensemble est : ${mySet.length}");



}