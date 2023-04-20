# Liens

https://zapp.run/github/Robert-Scub/formation-flutter/tree/main/demo/gorouter/gorouter_go_or_push

## Flutter Navigation: Go VS Push

Lorsque vous naviguez vers une nouvelle page avec GoRouter, vous pouvez utiliser la méthode **go** ou **push**. 

Les deux méthodes permettent de naviguer vers une nouvelle page, mais il y a une différence importante.

La méthode **go** **remplace l'ensemble de la pile de navigation** par la nouvelle page. Cela signifie que la page précédente sera supprimée de la pile et ne pourra pas être récupérée.

La méthode **push** permet de naviguer vers une nouvelle page **en l'ajoutant à la pile de navigation** actuelle. Cela signifie que la page précédente restera en place et pourra être récupérée .

![Stack de Navigation GO](/assets/navStack.png)


### Pour conclure

Si vous voulez remplacer complètement la pile de navigation par une nouvelle page, utilisez go. 

Si vous voulez ajouter une nouvelle page à la pile de navigation actuelle, utilisez push,
