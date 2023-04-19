# Map

Map fait partie des 3 types de collections Dart. 

Les dictionnaires (map) sont des objets qui associent des clés et des valeurs. Les clés et les valeurs peuvent être n'importe quel type de donnée. Chaque clé n'apparaît qu'une seule fois dans le dictionnaire, mais vous pouvez utiliser la même valeur plusieurs fois pour plusieurs clés.

Il y a un nombre fini de clés dans un dictionnaire et chaque clé a exactement une valeur qui lui est associée. Les dictionnaires, ainsi que leurs clés et leurs valeurs, peuvent être itérés.

> **_NOTE :_** Contrairement aux listes, les éléments des ensembles se trouvent dans des accolades { }. Elles ont les même propriétés et les mêmes méthodes que les listes.

## Déclaration d'un dictionnaire

````
var cities = { 'one': 'paris', 'two': 'londres', 'three': 'turin' };
````

ou 

````
var cities = { 
    'one': 'paris', 
    'two': 'londres', 
    'three': 'turin', 
};
````

> **_NOTE :_**  vous pouvez ajouter le séparateur "," à la fin, pour éviter les erreurs de copier-coller.

Autres manières de déclarer un dictionnaires : 

````
var cities = Map<String, String>();
cities['one'] = 'paris';
cities['two'] = 'londres';
cities['three'] = 'turin';
````

## Accès

On accède à une valeur par sa clé.

````
cities[cle]
````

Exemple : 

````
print(cities['one']);    // paris
print(cities['three']);    // turin
````

## Propriétés d'un dictionnaire

Quelques propriétés qui s'appliquent aux dictionnaires :

| Propriétés    |   Informations    |
|---            |:-                 |
|   length      | retourne le nombre d'élément du dictionnaire  |
|   isEmpty     | retourne true s'il n'y a pas d'éléments dans la liste et false si il y a au moins un élémentretourne true s'il n'y a pas d'éléments dans le dictionnaire et false si il y a au moins un élément |

## La méthode forEach pour les dictionnaires

Pour les dictionnaires, la méthode forEach( ) prend en paramètre une fonction qui a deux paramètres. Le premier paramètre désigne la clé et le deuxième désigne la valeur assignée à cette clé.

````
cities.forEach((key, name) =>
    print("the key : ${key}, the city : ${name} ")
);
````
