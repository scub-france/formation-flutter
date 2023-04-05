// A noter: Pour simplifier la lisibilité, tout a été mis dans un seul fichier mais seul la méthode `main` peut être compilé. Donc, vous devez isoler chaque class et remplacer les main1,2,3...par main

// On définit une classe avec le mot clé `class` suivi du nom de la classe avec la 1ere lettre en Majuscule.
// Le nom de la classe est suivi par deux acolades, entre lesquelles est placé le corps de notre classe,
// c'est-à-dire ses champs(propriétés ou attributs) et ses méthodes

//CLASSE SIMPLE
class Person {

  String name = "indefini";
  int age = 0;
    void info() {
      print('Nom: $name, Age: $age');
    }
}

// La classe Person possède deux champs, nom, qui représente le nom de la personne et age qui stockera son âge. Puis nous avons une fonction info(), qui, dans une classe s’appelle méthode.
//
// Cette méthode ne renvoie rien, d’où l’utilisation du mot void. Cependant, la méthode info() affiche des informations sur une personne.
//
// Pour faire simple, une classe est un modèle qui stocke les propriétés de l’objet ainsi que les actions qu’ils peut effectuer.
//
// Les variables nom et age sont de types String et int, qui n’acceptent pas les valeurs nulles. Donc, nous devons fournir à ces variables des valeurs initiales.


//LE CONSTRUCTEUR DE LA CLASSE DART
void main() {

  //instancier un objet marie
  Person marie = Person();

  //changer les valeurs de nom et age
  marie.name = "Marie";
  marie.age = 25;
  marie.info();

}
// créer une classe Person
class Person2{
  String nom = "indéfini";
  int age = 0;
  void info(){
    print("Nom: $nom Age: $age");
  }
}

// print `Nom: Marie Age: 25`

// Pour créer un objet Person, nous avons utilisé l’expression Person().
//
// En fait, les anciennes versions de Dart utilisaient également le mot 'new' pour appeler le constructeur.

// Person marie = new Person (); Mais dans les versions récentes de Dart, cet opérateur peut être négligé.
//
// En fait, le constructeur par défaut n’accepte aucun paramètre. Par conséquent, l’exécution de cette expression, allouera un espace en mémoire pour stocker toutes les données de l’objet Person.
//
// Et la variable marie va avoir une référence à l’objet créé.
//
// Si le constructeur n’initialise pas les valeurs des variables de l’objet, alors ils auront les valeurs par défaut, c’est-à-dire la valeur null (l’absence réelle d’une valeur).
//
// La création d’un objet de classe ou l’instanciation, permet d’accéder aux variables et méthodes de l’objet Person via la variable marie. Donc, nous avons utilisé l’opérateur point (.) – c’est-à-dire que nous spécifions le nom du champ ou de la méthode avec un point : marie.nom.
//
// Par exemple, pour définir les valeurs des champs nous utiliserons :
//
// `marie.nom = "Marie";`
// `marie.age = 25;`


//CREER UN CONSTRUCTEUR D'UNE CLASSE DART

// Un constructeur d’une classe Dart permet d’initialiser et de définir les valeurs de notre objet.
//
// Le constructeur prend le même nom de la classe et utilise un mot clé this.

class Person3{
  String nom = "";
  int age = 0;

  // le constructeur
  Person3(String nom, int age){

    this.nom = nom;
    this.age = age;
  }

  void info(){
    print("Nom: $nom Age: $age");
  }
}

void main1() {
  //instancier un objet marie
  Person3 maria = Person3('Marie', 25);

  print(maria.nom);
  print(maria.age);
}

//Print `Marie 25`

// Le mot-clé this est utilisé pour faire référence à l’instance, dans notre cas marie.
//
// Ici, nous disons à Dart de remplacer la variable nom par celle de l’objet dans le constructeur. Ce qui va nous permettre de les utiliser en faisant référence à la classe.
//
// Si les arguments et les variables ont des noms différents, inutile de l’utiliser.
//
// Notez que le constructeur prend deux paramètres. Par conséquent, vous devez instancier votre objet en utilisant deux paramètres.
// Person marie = Person('Marie', 25).
//
// Cette manière est courante dans la plupart des langages de programmation. Cependant, Dart fournit un moyen plus simple de le faire :
//
// Person(this.nom, this.age);

// Remplacez le bloc de code du constructeur par cette ligne de code. En fait, vous pouvez laisser les deux accolades ou utiliser un point virgule.


//LES CONSTRUCTEUR NOMMÉS

//Nous pouvons utiliser des constructeurs nommés pour pouvoir initialiser une classe de différentes manières.

// En fait, pour définir plusieurs constructeurs nous écrivons nom_du_constructeur.Nom.

// Il peut être utilisé comme une alternative à la  » surcharge de constructeur  » trouvée dans d’autres langages .

class Chien {
  var nom;
  //constructeur simple
  Chien() {
    this.nom = 'inconnu';
  }
  //constructeur nommé
  Chien.nom(this.nom);
}

main2() {
  var chien = Chien.nom('Tango');
  print(chien.nom);
}

//print 'Tango'


//LES GETTERS ET SETTERS

//Dans une classe Dart, il existe des méthodes de classe utilisées pour initialiser et récupérer respectivement les valeurs des champs de classe.
//
// La méthode setter est utilisée pour la définition d’une variable et la méthode getter pour la récupérer.
//
// En fait, elles existent par défaut dans une classe, toutefois nous pouvons les définir si nous le voulons.
//
// Un getter n’a pas de paramètres et renvoie une valeur, et un setter a un paramètre et ne renvoie aucune valeur.

class Person5{
  String nom = "";
  int age = 0;

  void set leNom(String nom){
    this.nom = nom; // this désigne l'instance
  }

  String get leNom{
    return nom;
  }
}

void main4(){
  Person5 marie = Person5(); //instancier un objet marie

  marie.nom = "Marie";

  print(marie.leNom);
}

// Notez que nous avons utilisé les mots clés set et get avec la même fonction à savoir leNom.
//
// De plus, la fonction getter n’est pas définie avec des parenthèses.
//
// L’idée ici, est que nous avons utilisé une seule fonction (leNom) pour définir (set) et récupérer (get) la valeur envoyée par une instance (marie).


//L'HERITAGE SIMPLE

// Une classe hérite uniquement d’une autre classe.

class A{
  afficherA(){
    print("A");
  }
}

class B extends A{
  afficherB(){
    print("B");
  }
}

void main5(){
  A a = A();    // instancier un objet a
  B b = B();    // instancier un objet b
  a.afficherA();
  print('');   // sauter une ligne
  b.afficherA(); // b appel une méthode héritée de A
  b.afficherB(); // b appel sa propre méthode
}

// La classe B a hérité la méthode `afficherA()`.


//L'HERITAGE MULTI-NIVEAUX

// C’est lorsque la classe hérite d’une classe enfant. Une classe E hérite d’une classe D qui elle même hérite d’une classe C.

class C{
  afficherC(){
    print("C");
  }
}

class D extends C{
  afficherD(){
    print("D");
  }
}

class E extends D{
  afficherE(){
    print("E");
  }
}

void main6(){
  // instancier des objets c, d et e
  C c = C();
  D d = D();
  E e = E();

  c.afficherC();

  print('');       // sauter une ligne
  d.afficherC();   // d appel la méthode héritée de la classe C
  d.afficherD();   // d appel sa propre méthode

  print('');       // sauter une ligne
  e.afficherC();   // e appel la méthode héritée de la classe C
  e.afficherD();   // e appel la méthode héritée de la classe D
  e.afficherE();   // e appel sa propre méthode

}

// Donc, la classe E qui hérite de la classe D qui a hérité de la classe C, a accédé aux méthodes des classes C et D.
//
// L’objectif de l’héritage est de pouvoir réutiliser le code d’une autre classe, ce qui nous évitera de réécrire le même code encore et encore.
//
// Afin d’améliorer la structure et la performance du code, le concept de l’héritage est largement utilisé par les développeurs.
//
// Notez que, contrairement à d’autres langages de programmation, une classe Dart ne peut pas hériter directement de plusieurs classes .


//LE POLYMORPHISME DANS LES CLASSES DART

// Le mot polymorphisme signifie « avoir plusieurs formes ».
//
// En fait, le polymorphisme est associé avec l’héritage à partir d’une classe parente commune.
//
// Nous disons que nous avons un polymorphisme lorsque l’appel d’une méthode entraîne l’exécution d’une opération différente selon le type d’objet appelant la méthode.
//
// Le polymorphisme signifie simplement qu’une même méthode peut avoir différentes applications.
//
// Les sous-classes ou les classes enfants remplacent généralement les méthodes d’instance, les getters et les setters.
//
// On peut utiliser @override pour indiquer que nous modifions le comportement d’une méthode.

class Etudiant{
  void langage(){
    print("apprendre la programmation.");
  }
}

class Etudiant1 extends Etudiant{
  // modifier la méthode du parent
  @override
  void langage(){
    print("apprendre Dart.");
    super.langage(); // appeler la méthode du parent
  }
}

void main7(){
  Etudiant1 e =  Etudiant1(); // instancier un objet e
  e.langage();
}

// La classe Etudiant1 hérite de la classe Etudiant.
// Nous avons modifié la méthode héritée `langage`.
// On a utilisé `@override` au dessus de la méthode pour dire qu’elle a été modifiée.
// Nous utilisons le mot clé `super` pour appeler une méthode de la classe parente dans la classe enfant.