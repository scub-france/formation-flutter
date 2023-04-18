# equatable

Gestion equatable

## Getting Started

Equatable est un package Dart qui fournit une implémentation simple et pratique de comparaison et de la représentation des objets.

Il suffit d'étendre la classe Equatable pour implémenter une comparaison basée sur vos attributs.


## Installation

Pour utiliser Equatable dans votre projet Dart, il faut ajouter la dépendence `equatable`


## Utilisation

Pour utiliser Equatable, vous devez étendre la classe Equatable dans vos propres classes.

Ensuite, vous pouvez appeler la méthode props pour retourner une liste de propriétés que vous souhaitez inclure dans le calcul de l'égalité.

Dans cette leçon, la classe Person étend la classe Equatable, et elle définit deux propriétés : name et age et address.

La méthode props retourne une liste contenant ces deux propriétés. Cela signifie que deux instances de Person seront considérées comme égales si elles ont le même nom et le même âge et la même adresse.

Dans cet exemple encore, person1 et person2 ont le même nom et le même âge et adresse, ils sont donc considérés comme égaux.


## Conclusion

Equatable est un package Dart simple mais puissant qui vous permet de comparer des objets basés sur leur contenu plutôt que sur leur identité.

En étendant la classe Equatable dans vos propres classes, vous pouvez facilement ajouter une implémentation de l'égalité basée sur le contenu.