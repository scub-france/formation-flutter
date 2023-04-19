## Les classes

Les classes en Dart sont des éléments fondamentaux de la programmation orientée objet. 

Elles permettent de définir des structures de données et des comportements qui peuvent être utilisés à plusieurs endroits dans le code.

Les classes sont définies à l'aide du mot-clé class suivi d'un nom qui commence par une majuscule. 

Elles peuvent contenir des champs et des méthodes, ainsi que des constructeurs pour initialiser les objets.


## les valeurs dans les classes

Les champs sont des variables qui stockent des données dans une instance de classe. Les champs peuvent être déclarés avec ou sans valeur initiale.


## le constructeur d'une classe

Les constructeurs sont des méthodes spéciales qui permettent d'initialiser les objets d'une classe. 

Il existe deux types de constructeurs en Dart : les constructeurs par défaut et les constructeurs nommés. 

Les constructeurs par défaut sont appelés lorsqu'on crée une nouvelle instance de classe, tandis que les constructeurs nommés permettent d'avoir plusieurs façons de créer une instance de classe avec des paramètres différents.


## Les getters et les setters

Les getters et les setters sont des méthodes qui permettent d'accéder et de modifier les champs d'une classe. 

Les getters renvoient la valeur d'un champ, tandis que les setters modifient sa valeur.


## L'héritage

L'héritage simple permet de créer une nouvelle classe en utilisant une classe existante comme base. 

La nouvelle classe hérite des champs et des méthodes de la classe de base, et peut ajouter de nouveaux champs et méthodes ou modifier ceux de la classe de base.


## L'héritage multi-niveaux

L'héritage multi-niveaux permet de créer une hiérarchie de classes dans laquelle chaque classe hérite des champs et des méthodes de sa classe parente.


## Le polymorphisme

Le polymorphisme permet à une classe de se comporter comme une autre classe en implémentant ses méthodes ou en héritant de ses champs et de ses méthodes. 

Cela permet d'écrire du code générique qui peut fonctionner avec plusieurs types de classes différentes.


## factory method

En Dart, les factories sont définies à l'aide du mot-clé `factory` et renvoient une instance de la classe en utilisant le constructeur approprié. 

Les factories peuvent être utilisées pour fournir des instances de sous-classes ou d'autres classes apparentées, ou pour fournir des instances de classes qui utilisent des caches ou d'autres techniques pour optimiser la création d'objets.

Il est important de noter que les factories peuvent également être utilisées en conjonction avec des classes abstraites ou des interfaces, en permettant de fournir des implémentations différentes pour les différentes classes qui implémentent l'interface ou héritent de la classe abstraite.



## Les champs calculées

En programmation, un champ calculé (ou propriété calculée) est une propriété qui n'est pas stockée directement dans un champ de données, mais qui est calculée dynamiquement à partir d'autres champs. 

Cela peut être utile pour fournir des données dérivées ou pour effectuer des opérations de calcul sur des champs de données existants.

Les champs calculés sont souvent implémentés sous la forme de méthodes d'accès, telles que des getters, qui renvoient une valeur calculée à partir d'autres champs ou de données.

Un exemple courant de champ calculé est le calcul d'une moyenne à partir d'un ensemble de données numériques. 

Plutôt que de stocker la moyenne directement dans un champ de données, elle peut être calculée dynamiquement à partir des valeurs stockées dans d'autres champs.


### NOTE IMPORTANTE: A chaque cours, il faut isoler ceux ci et mettre la methode main et non main + un chiffre comme montré de ce cours
