# List

List fait partie des 3 types de collections Dart. 

Une liste (list) est un ensemble d'élément du même type. Elles sont similaires aux tableaux en C, C++ et Java. Les listes servent principalement à créer des collections de données pouvant se répéter.

Il existe principalement deux types de liste.

 - les listes de taille non modifiable
 - les listes de taille modifiable

La taille de la liste étant le nombre d' élément que cette liste peut contenir. 

Si la taille de la liste est modifiable alors cette liste peut contenir un nombre illimité d' élément.

## Déclaration d'une liste

````
var myList = [1, 2, 3];
````

ou

````
var myList = [
    1, 
    2, 
    3,
];
````

> **_NOTE :_**  vous pouvez ajouter le séparateur "," à la fin, pour éviter les erreurs de copier-coller.

## Index

L'indice (index) est la position d'un élément dans une liste. 
Une liste utilise une indexation de base zéro, où 0 est l'indice de la première valeur et list.length - 1 est l'indice de la dernière valeur. 

## Longueur / Taille

Vous pouvez obtenir la longueur d'une liste à l'aide de la propriété  .length

````
print(myList.length);   // 3
````

## Accès

Pour accéder à une valeur d'une liste, on utilise son indice, et à l'opérateur d'indice ( [] ) :
````
myList[index]
````

Exemple d'accès en lecture :
````
var G7 = ["Allemagne", "Canada", "États-Unis", "France",
      "Italie", "Japon", "Royaume-Uni" ];

print(G7[0]);   // Allemagne
print(G7[4]);   // Italie
````

Exemple d'accès en écriture :
````
G7[2] = "USA";
print(G7);

// [Allemagne, Canada, USA, France, Italie,
// Japon, Royaume-Uni]
````

## Propriétés d'une liste

Les propriétés sont des informations qui caractérisent un type de donnée. Il existe plusieurs propriétés pour les listes comme la longueur(nombre d' élément dans la liste), le premier élément de la liste,le dernier élément de la liste.

Quelques propriétés qui s'appliquent aux listes : 

| Propriétés    |   Informations    |
|---            |:-                 |
|   length      | retourne le nombre d' élément dans la liste  |
|   first       | retourne le premier élément de la liste  |
|   last        | retourne le dernier élément de la liste  |
|   isEmpty     | retourne true s'il n'y a pas d'éléments dans la liste et false si il y a au moins un élément  |


## Méthodes

Une méthode est une fonction qui s'applique spécialement à un type de donnée. Elles permettent de faire certaines actions sur la ou les valeurs de cette variable.

Les listes ont des méthodes qui permettent de faire des actions comme :

ajouter ou supprimer un ou plusieurs éléments, appliquer des actions à chaque élément de la liste, accéder à l'index de certains éléments.

Quelques méthodes qui s'appliquent aux listes :

| Méthodes | Actions |
|---            |:-                 |
| add(élément) |	prend en paramètre un élément et l'ajoute à la fin de la liste |
| addAll(éléments) |	prend en paramètre une liste d'élément et les ajoute à la fin de la liste |
| clear() |	supprime tous les éléments de la liste |
| indexOf(élément) |	prend en paramètre un élément et retourne son index dans la liste. Elle retourne -1 si l'élément n'est pas dans cette liste |
| remove(élément) |	prend en paramètre un élément et le supprime de la liste. Elle retourne false si l'élément n'est pas dans cette liste |


## La méthode forEach pour les listes

La méthode forEach( ) est une méthode dont la syntaxe change par rapport au type de donnée sur lequel elle est appliquée. Dans le case des listes, elle prend en paramètre une fonction et applique cette fonction à tous les éléments de la liste.

Cette fonction prend comme paramètre une variable du même type que les éléments de la liste.

A chaque itération, la fonction sera exécutée avec comme variable un élément de la liste.

Elle se traduit par : Pour tout élément de la liste, faire ....

Exemple : 

````
var G7 = [
    "Allemagne",
    "Canada",
    "États-Unis",
    "France",
    "Italie",
    "Japon",
    "Royaume-Uni",
    "Union européenne"
  ];
 G7.forEach((pays)=> print(pays.toUpperCase()));

/*
ALLEMAGNE
CANADA
ÉTATS-UNIS
FRANCE
ITALIE
JAPON
ROYAUME-UNI
UNION EUROPÉENNE
*/
````
