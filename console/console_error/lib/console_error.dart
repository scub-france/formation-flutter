// Console_error
void main() {
  //En Dart, vous pouvez utiliser TRY-CATCH-FINALLY pour intercepter les erreurs qui se produisent lors de l'exécution de votre programme
  try {
    var result = divide(10, 0); // Appel de la fonction 'divide' avec les arguments 10 et 0
    print(result);
  } catch (e) { // Le bloc catch intercepte l'erreur et affiche un message
    print("Une erreur s'est produite : $e");
  } finally { // Le bloc finally s'exécute toujours, que l'erreur se produise ou non
    print("Le programme a terminé son exécution.");
  }

  var age = 24;

  // les ASSERTIONS (assert) sont utilisées pour vérifier les conditions qui doivents être vraies pour que votre code fonctionne correctement
  // Essayez de changer les valeurs de l'assert ou de la variable 'age' pour ne pas remplir la condition et compilez le code
  assert(age >= 18); // L'assertion vérifie que l'âge est supérieur ou égal à 18 dans ce cas
  print("L'âge est valide : $age");
}

double divide(double a, double b) {
  if (b == 0) { // Si le deuxième nombre est zéro, une erreur est générée avec l'instruction throw
    // Essayez de changer les paramètres de la méthode 'divide' et regarder le résultat
    throw "Impossible de diviser par zéro.";
  }
  return a / b; // Sinon, on effectue la division et on retourne le résultat
}
