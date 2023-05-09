import 'package:logging/logging.dart';

/// Dans cet exemple, nous allons créer des micro-services qui généreront des logs
void main() {
  // Configuration du root logger pour affichage des messages
  // du niveaux souhaité et supérieur à ce niveau rappel les
  // niveaux de gravité sont classés du plus élevé
  // au plus bas(le plus bas étant à droite)
  // OFF, SHOUT, SEVERE, WARNING, INFO, CONFIG, FINE, FINER, FINEST
  Logger.root.level = Level.FINER;

  // Configuration du root logger pour afficher les informations utiles du log.
  Logger.root.onRecord.listen((record) {
    print('${record.level.name}: ${record.time}: '
        '${record.message} , ${record.zone.runtimeType.toString()}, ${record.loggerName}');
  });

  // Création d'une instance de la classe RegisterService et appel de la méthode register().
  RegisterService(name: 'Api').register();

  // Affichage du nom de chaque logger enfant de root logger.
  Logger.root.children.forEach((key, log) => print("::Logs:: ${log.name}"));

  // Enregistrement d'un message de niveau "shout,qui valide la fin des enregistrement.
  Logger.root.shout("Enregistrement complet");
}

/// Classe abstraite définissant une propriété "name" et un logger "log".
abstract class Service {
  final String name;
  late Logger log;

  // constructeur de la classe Service qui prend en paramètre le nom du service.
  Service({required this.name}) {
    log = Logger(name);
    log.info("Création de $runtimeType");
  }

  // Méthode abstraite qui sera implémentée par les classes filles.
  void register();
}

/// Classe qui étend Service et enregistre plusieurs BackupService.
class RegisterService extends Service {
  // Création des instances des classes BackupService et DisabledService.
  final zone1 = BackupService(name: 'Zone1');
  final zone2 = BackupService(name: 'Zone2');
  final zone3 = DisabledService(name: 'Zone3');

  RegisterService({required super.name}) {
    log.finest("Instance $runtimeType démarrée");
  }

  // Méthode qui enregistre les instances des classes BackupService et DisabledService.
  // et qui affiche un message pour chaque zone.
  @override
  void register() {
    log.info('$runtimeType register()');
    for (final zone in [zone1, zone2, zone3]) {
      log.fine("Enregistrement par zone $zone");
      zone.register();
    }
  }
}

/// Classe qui étend Service et qui enregistre simplement son état.
class BackupService extends Service {
  BackupService({required super.name});

  // Méthode qui enregistre le nom de la classe.
  @override
  void register() => log.info('$runtimeType register()');

  // Override de la méthode toString() pour afficher le nom de la classe.
  @override
  toString() => '[Service $name]';
}

/// Classe qui étend BackupService et qui enregistre un message en cas de dégradation du service réseau.
class SlowService extends BackupService {
  SlowService({required super.name});

  // Override de la méthode register() et enregistre un message de niveau "warning".
  @override
  void register() {
    log.warning("Le service réseau est dégradé");
    super.register();
  }
}

/// Classe qui étend BackupService et qui lance une exception pour simuler un service en panne.
class DisabledService extends BackupService {
  DisabledService({required super.name});

  // Override de la méthode register() et lance une exception, qui sera gérée
  // par le bloc catch en affichant un message de niveau "severe".
  @override
  void register() {
    try {
      throw Exception("Service en panne;");
    } catch (e) {
      log.severe(e.toString());
    }
  }
}
