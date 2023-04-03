# streambuilder

### Qu'est ce que le streambuilder ?

Le StreamBuilder est un widget dans Flutter qui permet de réagir aux changements dans un flux de
données (Stream).

Lorsqu'un flux de données est lié à un StreamBuilder, chaque fois que le flux émet une nouvelle
valeur, le StreamBuilder reconstruit son arbre de widget en appelant la fonction de création de
widget (builder) spécifiée, avec la dernière valeur du flux de données en tant que paramètre.

Cela permet de créer des interfaces utilisateur réactives qui reflètent les changements en temps
réel dans les données de l'application.

Il est important de noter que le StreamBuilder doit être utilisé avec un flux de données qui peut
être diffusé plusieurs fois (broadcast stream) ou qui est asynchrone. Si un flux de données ne peut
être écouté qu'une seule fois, il est préférable d'utiliser le widget FutureBuilder à la place.

En résumé, le StreamBuilder est un outil puissant pour créer des interfaces utilisateur réactives en
utilisant des flux de données, et il est particulièrement utile pour les applications qui
nécessitent des mises à jour en temps réel des données.

### Link

- https://api.flutter.dev/flutter/widgets/StreamBuilder-class.html