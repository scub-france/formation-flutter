A sample command-line application with an entrypoint in `bin/`, library code
in `lib/`, and example unit test in `test/`.
# Les types de variables en Dart

En Dart, les variables ont des types. Le type de variable détermine le genre de données qui peuvent être stockées dans cette variable et les opérations qui peuvent être effectuées avec ces données.

Voici les différents types de variables en Dart :
## Les variables numériques

Les variables numériques représentent les nombres. Il existe plusieurs types de variables numériques en Dart, dont les plus courantes sont :

    - int : représente les nombres entiers, positifs ou négatifs, sans décimales.
    - double : représente les nombres à virgule flottante, qui peuvent avoir une partie fractionnaire.

Exemple :

```dart

int age = 30;
double temperature = 20.5;
```

Pour en savoir plus sur les variables numériques en Dart, consultez [la documentation officielle](https://dart.dev/language/built-in-types#numbers).

## Les variables de chaînes de caractères

Les variables de chaînes de caractères représentent les textes. En Dart, les chaînes de caractères sont des objets de la classe String.

Exemple :

```dart

String message = 'Bonjour tout le monde';
```

Pour en savoir plus sur les variables de chaînes de caractères en Dart, consultez [la documentation officielle](https://dart.dev/language/built-in-types#strings).

## Les variables booléennes

Les variables booléennes représentent des valeurs booléennes, c'est-à-dire true ou false. En Dart, les variables booléennes sont de type bool.

Exemple :

```dart

bool estActif = true;
```

Pour en savoir plus sur les variables booléennes en Dart, consultez [la documentation officielle](https://dart.dev/language/built-in-types#booleans).

## Les variables de listes

Les variables de listes représentent des collections de valeurs. En Dart, les listes sont des objets de la classe List.

Exemple :

```dart

List<int> nombres = [1, 2, 3, 4, 5];
```

Pour en savoir plus sur les variables de listes en Dart, consultez [la documentation officielle](https://dart.dev/language/collections#lists).

## Les variables de maps

Les variables de maps représentent des associations clé-valeur. En Dart, les maps sont des objets de la classe Map.

Exemple :

```dart

Map<String, int> scores = {'Alice': 10, 'Bob': 5, 'Charlie': 8};
```

Pour en savoir plus sur les variables de maps en Dart, consultez [la documentation officielle](https://dart.dev/language/collections#maps).

## Les variables de sets

Les variables de sets représentent des ensembles de valeurs uniques. En Dart, les sets sont des objets de la classe Set.

Exemple :

```dart

Set<int> nombres = {1, 2, 3, 4, 5};
```

Pour en savoir plus sur les variables de sets en Dart, consultez [la documentation officielle](https://dart.dev/language/collections#sets).
Les variables dynamiques

Les variables dynamiques peuvent contenir n'importe quelle valeur et peuvent changer de type au fil du temps. En Dart, les variables dynamiques sont de type `