# FutureBuilder

## Explications

`FutureBuilder` est un widget qui permet de gérer l'affichage des données asynchrones.
Il est utilisé pour configurer l'affichage de widget en fonction de l'état d'une `Future`.

`FutureBuilder` prend une Future en entrée et retourne un widget qui peut être reconstruit
plusieurs fois en fonction de l'état du Future. Lorsque le Future est en cours d'exécution, le
widget renvoie une indication de chargement. Lorsque le Future est complété, le widget renvoie le modèle de donnée de la tâche complétée. Si une 
erreur se produit pendant l'exécution, le cas peut aussi être traité en renvoyant un `Icon(Icons.warning)` par exemple.

En utilisant le widget `FutureBuilder` dans votre application Flutter, vous pouvez gérer facilement
les données asynchrones et garantir que l'état de l'interface utilisateur est toujours à jour avec
les dernières données.

## Ressources

- [Introduction à la programmation asynchrone](https://zapp.run/github/Robert-Scub/formation-flutter/tree/main/console/future/future_intro)
- [liens vers la doc officielle](https://api.flutter.dev/flutter/widgets/FutureBuilder-class.html)