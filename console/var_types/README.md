A sample command-line application with an entrypoint in `bin/`, library code in `lib/`, and example
unit test in `test/`.

# Les types de variables en Dart

En Dart, les variables ont des types. Le type de variable détermine le genre de données qui peuvent
être stockées dans cette variable et les opérations qui peuvent être effectuées avec ces données.

Voici les différents types de variables en Dart :

## Les variables numériques

Les variables numériques représentent les nombres. Il existe plusieurs types de variables numériques
en Dart, dont les plus courantes sont :

    - int : représente les nombres entiers, positifs ou négatifs, sans décimales.
    - double : représente les nombres à virgule flottante, qui peuvent avoir une partie fractionnaire.

Exemple :

```dart

int age = 30;
double temperature = 20.5;
```

Pour en savoir plus sur les variables numériques en Dart,
consultez [la documentation officielle](https://dart.dev/language/built-in-types#numbers).

## Les variables de `String`

Les variables de chaînes de caractères représentent les textes. En Dart, les chaînes de caractères
sont des objets de la classe `String`.

Exemple :

```dart

String message = 'Bonjour tout le monde';
```

Pour en savoir plus sur les variables de chaînes de caractères en Dart,
consultez [la documentation officielle](https://dart.dev/language/built-in-types#strings).

## Les variables `bool`

Les variables booléennes représentent des valeurs booléennes, c'est-à-dire true ou false. En Dart,
les variables booléennes sont de type `bool`.

Exemple :

```dart

bool estActif = true;
```

Pour en savoir plus sur les variables booléennes en Dart,
consultez [la documentation officielle](https://dart.dev/language/built-in-types#booleans).

## Les variables de `list`

Les variables de `list` représentent des collections de valeurs. En Dart, les `list` sont des objets
de la classe `List`.

Exemple :

```dart

List<int> nombres = [1, 2, 3, 4, 5];
```

Pour en savoir plus sur les variables de listes en Dart,
consultez [la documentation officielle](https://dart.dev/language/collections#lists).

## Les variables de `maps`

Les variables de `maps` représentent des associations clé-valeur. En Dart, les `maps` sont des objets de
la classe `Map`.

Exemple :

```dart

Map<String, int> scores = {'Alice': 10, 'Bob': 5, 'Charlie': 8};
```

Pour en savoir plus sur les variables de maps en Dart,
consultez [la documentation officielle](https://dart.dev/language/collections#maps).

## Les variables de `sets`

Les variables de `sets` représentent des ensembles de valeurs uniques. En Dart, les `sets` sont des
objets de la classe `Set`.

Exemple :

```dart

Set<int> nombres = {1, 2, 3, 4, 5};
```

Pour en savoir plus sur les variables de sets en Dart,
consultez [la documentation officielle](https://dart.dev/language/collections#sets). Les variables
dynamiques

## Les variables dynamiques

Les variables dynamiques peuvent contenir n'importe quelle valeur et peuvent changer de type au fil
du temps.  `

Exemple :

```dart 

dynamic variable = 10;
variable = 'Bonjour tout le monde';
```

# Les mots clés

## Le mot-clé `null`

Le mot-clé "null" est utilisé pour déclarer une variable qui n'a pas de valeur.

Exemple :

```dart

int? age;
```


## Le mot-clé `void`

Le mot-clé "void" est utilisé pour déclarer une fonction qui ne renvoie aucune valeur.

Exemple :

```dart

void main() {
  print('Hello World');
}
```

## Le mot-clé `late`

le mot-clé "late" est utilisé pour déclarer des variables qui ne sont pas initialisées immédiatement
c'est variable ne peuvent être null à l'exécution. 
Exemple :

```dart

late int age;
age = 20;
```

## Le mot-clé `final`

le mot-clé "final" est utilisé pour déclarer des variables comme immuables, ce qui signifie qu'une
fois qu'elles ont été initialisées, leur valeur ne peut plus être modifiée. Les variables "final"
sont souvent utilisées pour les widgets ou les propriétés qui ne changent pas pendant la durée de
vie d'un widget ou d'une classe.

Exemple :

```dart 

final int age = 30;
```

## Le mot-clé `const`

"const" est un mot-clé utilisé pour déclarer des valeurs constantes et immuables qui sont connues à
l'avance et ne changent jamais pendant l'exécution de l'application. En utilisant "const" pour
déclarer ces valeurs, les performances de l'application peuvent être améliorées car ces valeurs sont
résolues lors de la compilation plutôt qu'à l'exécution.

Exemple :

```dart

const String color = "RED";
```

## Le mot-clé `var`

le mot-clé "var" est utilisé pour déclarer des variables dont le type est déduit automatiquement
par le compilateur. 

Exemple :

```dart

var age = 30;
```

le type de age va être déduit automatiquement par le compilateur. Et dans ce cas, le type de age
sera int.

## Le mot-clé `static`

le mot-clé "static" est utilisé pour déclarer des variables, des fonctions ou des méthodes qui
appartiennent à la classe plutôt qu'à une instance particulière de la classe. Cela signifie qu'ils
peuvent être appelés ou utilisés sans avoir besoin d'une instance de la classe et que leur valeur
est partagée par toutes les instances de la classe.

Exemple :

```dart

static int age = 30;
```
