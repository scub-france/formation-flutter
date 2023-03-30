# futurebuilder

### Qu’est-ce qu’un future builder ?

`FutureBuilder` est un widget qui permet de gérer l'affichage des données asynchrones en temps réel.
Il est utilisé pour afficher un widget différent en fonction de l'état d'un objet Future.

Le `FutureBuilder` prend un Future en entrée et retourne un widget qui peut être reconstruit
plusieurs fois en fonction de l'état du Future. Lorsque le Future est en cours d'exécution, le
widget renvoie une indication de chargement. Lorsque le Future est terminé, le widget renvoie les
données de sortie. Si une erreur se produit pendant l'exécution du Future, le widget renvoie une
erreur.

En utilisant le widget `FutureBuilder` dans votre application Flutter, vous pouvez gérer facilement
les données asynchrones et garantir que l'état de l'interface utilisateur est toujours à jour avec
les dernières données.

### Link
TODO : MODIFIER LE LIEN EN METTANT LE ZAPPID
- Vous ne savez pas ce qu'est un FUTURE ? [Cliquez ici](https://zapp.run/github/Robert-Scub/formation-flutter/tree/main/console/future/future_intro)