void main() {

  // Déclaration d'un ensemble
  var mySet = {
    'londres',
    'paris',
    'turin',
  };
  print("Mon ensemble : ");
  print(mySet);
  print("La longueur de mon ensemble est : ${mySet.length}");

  // L'action ci-dessous sera ignorée car les éléments dans un ensemble sont uniques
  mySet.add('paris');
  print("La longueur de mon ensemble est toujours : ${mySet.length}");

  print("Le premier élément : ${mySet.first} ");
  print("Le dernier élément : ${mySet.last} ");
  print("L'élément à l'indice 1 : ${mySet.elementAt(1)}");

  // Supreesion de tous les éléments
  mySet.clear();
  print("La longueur de mon nouvel ensemble est : ${mySet.length}");




}