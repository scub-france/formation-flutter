# stateful_form

Gestion stateful_form

## StatefulWidget vs. StatelessWidget pour un formulaire

Flutter offre deux types de widgets principaux pour la création d'interface utilisateur : 
`StatefulWidget` et `StatelessWidget` . Il est important de comprendre la différence entre les deux pour choisir le bon widget pour votre formulaire.


# StatefulWidget

`StatefulWidget` est utilisé pour créer des widgets qui puevent être modifiés dynamiquement en réponse à des évènements utilisateur ou à des chagements de données.

Ces widgets sont généralements utillisés pour des parties de l'interface utilisateur qui doivent être mises à jour en temps réel, telles que l'affichage des résultats de 

recherche ou la modification des champs de saisie de formulaire en fonction des entrées de l'utilisateur.


Lorsque vous utilisez `StatefulWidget`, vous devez également créer une classe d'état (`State`), qui stocke l'état actuel de l'application. 

Vous pouvez ensuite mettre à jour cet état en appelant la méthode `setState()`.


# StatelessWidget

`StatelessWidget`, en revanche, est utilisé pour créer des widgets qui ne peuvent pas être modifiées dynamiquement après leur création.

Ces widgets son généralement utilisés pour des parties d'interface utilisateur statiques qui n'ont pas besoin de réagir à des évènements utilisateur ou de changer leur apparence.


Lorsque vous utilisez `StatelessWidget`, vous n'avez pas besoin de créer une classe d'état car l'état du widget est immuable.



# ok...mais comment je choisi le bon widget pour mon formulaire ?


Si votre formaulaire contient uniquement des champs statiques, tels que des champs de texte et des boutons, vous pouvez utiliser `StatelessWidget`.

Cela rendra votre code plus simple et plus facile à comprendre.


Si votre formaulaire contient des champs de saisie dynamiques qui doivent être mis à jour en temps réel en réponse aux entrées de l'utilisateur, vous decriez utiliser `StatefulWidget`.

Cela vous permettra de stocker l'état actuel de l'application et de le mettre à jour en temps réel.


En fin de compte, le choixentre `StatelessWidget` et `StatefulWidget` dépendra des besoins spécifiques de votre formulaire. 

En comprenant les différences entreles deux, vous pourrez choisir le widget qui convient le mieux à la situation.

