import 'package:logging/logging.dart';

final log = Logger('ExampleLogger');

/// Dans ce programme, nous allons configurer le journal pour enregistrer
/// les messages à tous les niveaux de gravité.
void main() {
  // Configuration du root logger pour affichage des messages
  // du niveaux souhaité et supérieur à ce niveau rappel les
  // niveaux de gravité sont classés du plus élevé
  // au plus bas(le plus bas étant à droite)
  // OFF, SHOUT, SEVERE, WARNING, INFO, CONFIG, FINE, FINER, FINEST
  Logger.root.level = Level.CONFIG;
  // Configuration du root logger pour affichage les informations utile du log
  Logger.root.onRecord.listen((record) {
    //affichage des tout les informations utile de log
    // il y'en a d'autre comme record.error, record.stackTrace,
    // record.object, record.sequenceNumber, record.time
    print('${record.level.name}: ${record.time}: '
        '${record.message} , ${record.zone.runtimeType.toString()}, ${record.loggerName}');
  });

  // Création des instances des classe, et appel des méthodes de log qui vont
  // afficher chacun des log avec différents niveau de gravité
  final person = Person('John', 30);
  final student = Student('John', 30, 'MIT');
  final teacher = Teacher('John', 30, 'Math');
  final employee = Employee('John', 30, 'Google');

  // logPerson avec le niveau INFO
  person.logPerson();

  // logStudent avec le niveau SEVERE
  student.logStudent();

  // logTeacher avec le niveau FINE
  teacher.logTeacher(teacher);

  // logEmployee avec le niveau FINEST
  employee.logEmployee(employee);

  // try catch pour tester le niveau SHOUT et WARNING
  try {
    throw Exception('Exception');
  } catch (e) {
    log.shout('Exception: $e');
    log.warning('Exception: $e');
  }
}

class Person {
  final String name;
  final int age;
  final Logger log = Logger('Person');

  Person(this.name, this.age){
    log.config("Création de $runtimeType");
  }

  void logPerson() {
    log.info('Person: $name, $age');
  }
}

class Student extends Person {
  final String school;
  final Logger log = Logger('Student');

  Student(String name, int age, this.school) : super(name, age);

  void logStudent() {
    log.severe('Student: $name , $age, $school');
  }
}

class Teacher extends Person {
  final String subject;
  final Logger log = Logger('Teacher');

  Teacher(String name, int age, this.subject) : super(name, age);

  void logTeacher(Teacher teacher) {
    log.fine('Teacher: $name, $age, $subject');
  }
}

class Employee extends Person {
  final String company;
  final Logger log = Logger('Employee');

  Employee(String name, int age, this.company) : super(name, age);

  void logEmployee(Employee employee) {
    log.finest('Employee: $name, $age, $company');
  }
}





