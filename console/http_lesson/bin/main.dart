// Nous utilisons le package `http` pour effectuer une requete HTTP
import 'package:http/http.dart' as http;


void main() async {
   // Nous utilisons le package `http` pour effectuer la requete à l'URL
  var response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos/1'));
  if (response.statusCode == 200) {
    // Si la requete est réussi, nous affichsons le corps de la réponse
    print(response.body);
  } else {
    // Si la requete échoue, nous affichons le statut de celle-ci
    print('Request failed with status: ${response.statusCode}');
  }
}

// Notez que la méthode `get()` est asynchrone, nous utilisons donc le mmot-clé `await` pour attendre que la réponse soit renvoyée avant de continuer l'exécution du code.
// Cela signifie que la fonction `main()` doit être déclarée comme asynchrone en ajoutant le mot-clé `async`