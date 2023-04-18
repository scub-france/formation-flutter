abstract class A {
  void  bar();
  static void affichage() {
    print("foo");
  }
}

class B extends A{
  int _compteur = 0;

  @override
  void bar() {
    print("bar");
  }

  void incrementer() {
    _compteur++;
  }
  void sayHello() {
    print("Hello");
  }
}

/// Appel des méthodes
void main() {
  // Instanciation de la classe B
  B b = new B();
  // Appel de la méthode sayHello() de la classe B (méthode dite "normale")
  b.sayHello();
  // Appel de la méthode bar() de la classe B (méthode dite "static" qui appartient à la classe A)
  A.affichage();
  // Appel de la méthode bar() de la classe B (méthode dite "asbstrait" qui appartient à la classe A)
  b.bar();

  // Appel de la méthode incrementer() de la classe B

  print("${b._compteur} avant l'incrémentation");
  b.incrementer();
  print("${b._compteur} après l'incrémentation" );
}
