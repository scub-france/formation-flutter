# Set

Set fait partie des 3 types de collections Dart. 

Les ensembles (set) sont des listes de taille modifiable d'éléments uniques.

La principale différence entre les listes et les ensembles est que les ensembles ne contienent jamais plusieurs fois le même élément.

> **_NOTE :_** Contrairement aux listes, les éléments des ensembles se trouvent dans des accolades { }. Elles ont les même propriétés et les mêmes méthodes que les listes.

## Déclaration d'un ensemble

````
var mySet = {'londres', 'paris', 'turin'};
````

ou 

````
var mySet = {
    'londres', 
    'paris', 
    'turin',
};
````

> **_NOTE :_**  vous pouvez ajouter le séparateur "," à la fin, pour éviter les erreurs de copier-coller.

## Accès

Ajoutez des éléments à un ensemble existant à l'aide des méthodes add() ou addAll()
````
var elements = <String>{};
elements.add('chicago');
elements.addAll(mySet);
````

## Longueur / Taille

Vous pouvez obtenir la longueur d'un ensemble à l'aide de la propriété  .length

````
print(elements.length);   // 4
````



