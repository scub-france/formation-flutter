import 'package:logging/logging.dart';

final log = Logger('ExampleLogger');
final Logger myLogger = Logger('MyLogger');

/// Dans ce programme, nous allons configurer le journal pour enregistrer les messages à tous les niveaux de gravité.
/// Qui sont: SEVERE, WARNING, INFO, CONFIG, FINE, FINER, FINEST
void main() {
  // Configuration du logger pour enregistrer les messages à tous les niveaux de gravité
  Logger.root.level = Level.ALL;
  // Ecouteur de journalisation, qui enregistre les messages de journalisation dans la console
  // avec des informations supplémentaires telles que le niveau de gravité, l'heure, le nom du journal, etc.
  // ce qui n'est pas disponible dans les print() fonctions.
  Logger.root.onRecord.listen((record) {
    //affichage des tout les informations de log
    print('${record.level.name}: ${record.time}: '
        '${record.message} , ${record.zone.runtimeType.toString()}, ${record.loggerName}, '
        '${record.error}, ${record.stackTrace}, ${record.sequenceNumber}, ${record.object}'
        ' ${record.time.day}');
  });

  // Utilisation du logger pour enregistrer des messages de journalisation à différents niveaux de gravité
  myLogger.severe('Ceci est un message SEVERE');
  myLogger.warning('Ceci est un message WARNING');
  myLogger.info('Ceci est un message INFO');
  myLogger.config('Ceci est un message CONFIG');
  myLogger.fine('Ceci est un message FINE');
  myLogger.finer('Ceci est un message FINER');
  myLogger.finest('Ceci est un message FINEST');

  // fonction pour afficher des messages avec un logger différent
  logMessage();

}

void logMessage() {
  log.warning('message d\'un log différent');
  log.info('message d\'un log différent');
  log.info('message d\'un log différent');
}



