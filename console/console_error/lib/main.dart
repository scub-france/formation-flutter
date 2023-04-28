/// Un type d'Exception explicite
/// avec un message pour simplifier la gestion des exceptions
class ContenuInvalideException implements Exception {
  final String message;
  const ContenuInvalideException([this.message = ""]);
}

void main() {
  try {
    // Communication va échouer mais être récupérée
    communication();
  } catch (e) {
    // Rethrow nous permet un second niveau de gestion
    print("Tentative de communication interrompue");
  }
}

/// Simuler un message reçu par un utilisateur à un agent
void communication() {
  try {
    final valeurUtilisateur = 'Pouvez-vous traiter ma demande';
    // Le message n'est pas valide => throws
    confirmation(valeurUtilisateur);
  } on ContenuInvalideException catch (e) {
    // On traite spécifiquement le contenu invalide
    print("Pensez à saluer nos agents");
    rethrow;
  } finally {
    // Le bloc finally s'exécute toujours, que l'erreur se produise ou non
    print("Confirmation de prise de contact avec un agent.");
  }
}

String confirmation(String message, {String required = 'Bonjour'}) {
  if (!message.contains(required)) throw ContenuInvalideException('Non trouvé: $required');
  return message;
}
