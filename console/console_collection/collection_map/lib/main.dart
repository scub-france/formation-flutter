void main() {

  // Déclaration de mon dictionnaire
  print('--- Déclaration ---');
  var myMap = {
    'one': 'paris',
    'two': 'londres',
    'three': 'turin',
  };

  // Mon dictionnaire :
  print(myMap);
  print("La longueur de mon dictionnaire est : ${myMap.length}");

  // L'action ci-dessous écrasera un élément
  myMap['one'] = 'Capital de la France';
  // Mon dictionnaire actualisé :
  print(myMap);
  print("La longueur de mon dictionnaire est toujours : ${myMap.length}");

  print("Pour la clé \"two\", la valeur est ${myMap['two']} ");

  // Itération
  print('');
  print('--- Boucle for each ---');
  myMap.forEach((key, name) =>
      print("Pour la clé \"${key}\", la valeur est \"${name}\" ")
  );

}