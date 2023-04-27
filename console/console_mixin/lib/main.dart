// Pour créer une classe mixin, vous devez déclarer une classe et utiliser le mot-clé 'mixin' plutot que 'class'
// Attention, une class 'mixin' ne peut être instanciée directement, elle doit être mélangée à une autre classe à l'aide du mot-clé 'with'

// Définition du mixin Logger
mixin Logger {
  // Méthode pour enregistrer des messages de journalisation
  void log(String message) {
    print('[LOG] $message');
  }
}

// Maintenant, pour utiliser le mixin Logger dans une autre classe, nous pouvons le mélanger avec le mot-clé 'with'

// Définition de la classe MyClass et mélange du mixin Logger
class MyClass with Logger {
  // Méthode pour faire quelque chose et appeler la méthode log du mixin
  void doSomething() {
    log('Doing something...');
  }
}
// La class MyClass a accès à la méthode 'log' définie dans le mixin 'logger'.
// Nous pouvons utiliser MyCLass de la même manière que n'importe quelle autre class Dart

// Fonction principale
void main() {
  // Création d'une instance de MyClass
  MyClass myClass = MyClass();
  // Appel de la méthode doSomething, qui appelle la méthode log du mixin
  myClass.doSomething();
}
