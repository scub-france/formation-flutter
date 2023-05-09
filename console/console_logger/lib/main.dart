import 'package:logging/logging.dart';

final log = Logger('ExampleLogger');

/// Dans ce programme, nous allons configurer le journal pour enregistrer les messages à tous les niveaux de gravité.
void main() {
  // Configuration du root logger pour affichage des messages du niveaux souhaité et supérieur à ce niveau
  // rappel les niveaux de gravité sont classés du plus élevé au plus bas(le plus bas étant à droite)
  // OFF, SHOUT, SEVERE, WARNING, INFO, CONFIG, FINE, FINER, FINEST
  Logger.root.level = Level.WARNING;
  // Configuration du root logger pour affichage les informations utile du log
  Logger.root.onRecord.listen((record) {
    //affichage des tout les informations utile de log
    // il y'en a d'autre comme record.error, record.stackTrace, record.object, record.sequenceNumber, record.time
    print('${record.level.name}: ${record.time}: '
        '${record.message} , ${record.zone.runtimeType.toString()}, ${record.loggerName}');
  });

  // Création des instances des classe, et appel des méthodes de log qui vont afficher chacun des log avec différents niveau de gravité
  Person person = Person('John', 30);
  Student student = Student('John', 30, 'MIT');
  Teacher teacher = Teacher('John', 30, 'Math');
  Employee employee = Employee('John', 30, 'Google');

  // logPerson avec le niveau INFO
  Person.logPerson(person);
  // logStudent avec le niveau SEVERE
  Student.logStudent(student);

  // logTeacher avec le niveau FINE
  Teacher.logTeacher(teacher);

  // logEmployee avec le niveau FINEST
  Employee.logEmployee(employee);

  // try catch pour tester le niveau SHOUT et WARNING
  try {
    throw Exception('Exception');
  } catch (e) {
    log.shout('Exception: $e');
    log.warning('Exception: $e');
  }
}

class Person {
  String name;
  int age;
  static final tab = [1, 2, 3];
  static Logger log = Logger('Person');

  Person(this.name, this.age);

  static logPerson(Person person) {
    log.info('Person: ${person.name}, ${person.age}');
  }
}

class Student extends Person {
  String school;
  static Logger log = Logger('Student');

  Student(String name, int age, this.school) : super(name, age);

  static logStudent(Student student) {
    log.severe('Student: ${student.name}, ${student.age}, ${student.school}');
  }
}

class Teacher extends Person {
  String subject;
  static Logger log = Logger('Teacher');

  Teacher(String name, int age, this.subject) : super(name, age);

  static logTeacher(Teacher teacher) {
    log.fine('Teacher: ${teacher.name}, ${teacher.age}, ${teacher.subject}');
  }
}

class Employee extends Person {
  String company;
  static Logger log = Logger('Employee');

  Employee(String name, int age, this.company) : super(name, age);

  static logEmployee(Employee employee) {
    log.finest('Employee: ${employee.name}, ${employee.age}, ${employee.company}');
  }
}





