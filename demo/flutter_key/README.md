# flutter_key

Gestion flutter_key

## Flutter Key

En Flutter, une Key est un objet qui aide à identifier un widget dans l'arbre de widgets.
Chaque widget dans Flutter doit avoir un objet Key associé, 
ce qui permet à Flutter d'identifier efficacement le widget 
et son état correspondant lorsque l'arbre de widgets est reconstruit.

Les clés sont utilisées pour aider Flutter à comprendre la relation entre les anciennes 
et les nouvelles instances de widgets lors de la mise à jour de l'arbre de widgets. 
Sans les clés, Flutter ne serait pas en mesure de distinguer entre les widgets qui ont changé 
et les widgets qui sont nouveaux, ce qui peut conduire à des mises à jour incorrectes ou inefficaces.

Il existe plusieurs types de clés dans Flutter, notamment :

GlobalKey : 
Une GlobalKey est une clé qui peut être utilisée pour identifier un widget depuis n'importe 
où dans l'application, pas seulement depuis son parent immédiat.

LocalKey : 
Une LocalKey est une clé qui n'est unique que dans le contexte de son widget parent. 
Elle est utilisée pour identifier un enfant spécifique d'un widget parent.

ValueKey : 
Une ValueKey est une clé qui est basée sur la valeur du widget avec lequel 
elle est associée. Elle est souvent utilisée lorsqu'on travaille avec des collections de widgets similaires, 
comme lors de la construction d'une liste ou d'une grille.

ObjectKey : 
Une ObjectKey est une clé qui est basée sur l'identité de l'objet avec lequel 
elle est associée. Elle est souvent utilisée lorsqu'on travaille avec des widgets complexes qui ont un état mutable.



## ValueKEY


Dans Flutter, une clé est un objet qui permet d'identifier un widget dans l'arborescence des widgets.
Chaque widget dans Flutter doit avoir un objet Key qui lui est associé, 
ce qui permet à Flutter d'identifier efficacement le widget et son état correspondant lorsque l'arborescence des widgets est reconstruite.

La classe ValueKey est un type spécifique de clé utilisé pour identifier les widgets en fonction de leur valeur.
Il est souvent utilisé lorsqu'il s'agit de collections de widgets similaires, comme lors de la création d'une liste ou d'une grille.

Par exemple, considérons une liste d'objets Person. Chaque personne a un identifiant unique et un nom. 
Pour créer une liste de widgets Person, nous pourrions utiliser le constructeur ListView.builder, 
qui nécessite un objet Key pour chaque élément de la liste.
Étant donné que chaque objet Person a un identifiant unique,
nous pouvons utiliser un objet ValueKey basé sur l'identifiant pour identifier chaque widget Person 


## GlobalKEY

En Flutter, une GlobalKey est un type de Key qui peut être utilisé pour identifier un widget depuis n'importe
où dans l'application, pas seulement depuis son parent immédiat.

Lorsqu'un widget est associé à une GlobalKey,
il peut être référencé par cette clé depuis n'importe où dans l'application, 
ce qui peut être utile pour accéder ou manipuler ce widget à partir d'un autre endroit que son parent direct.

Par exemple, vous pouvez utiliser une GlobalKey pour accéder à un champ de texte à partir d'un bouton situé dans un autre widget,
ou pour accéder à une méthode d'un widget à partir d'un autre widget qui n'est pas directement lié.





