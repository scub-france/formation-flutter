# stateless_stateful

Widget à états

## Widgets avec et sans état
Un widget est soit avec état, soit sans état. Si un widget peut changer, lorsqu'un utilisateur interagit avec lui, 
par exemple, il est avec état.

Un widget sans état ne change jamais. Icon, IconButtonet Text sont des exemples de widgets sans état. Sous-classe 
de widgets sans état StatelessWidget.

Un widget avec état est dynamique : par exemple, il peut changer d'apparence en réponse à des événements déclenchés 
par des interactions de l'utilisateur ou lorsqu'il reçoit des données.

L'état d'un widget est stocké dans un Stateobjet, séparant l'état du widget de son apparence. L'état se compose de 
valeurs qui peuvent changer, comme la valeur actuelle d'un curseur ou si une case est cochée. Lorsque l'état du widget
change, l'objet d'état appelle setState(), indiquant au framework de redessiner le widget.

## Exemple
Afficher un mot aléatoire depuis une liste et l'actualiser grace a un button.
Le widget TitreDeSorite la demo n'a pas besoin de changer, il est donc stateless.
Le widget RandomWordPage contient l'element à afficher et qui doit réagir au button ... el est donc stateful


