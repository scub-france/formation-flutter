# Liens

https://zapp.run/github/Robert-Scub/formation-flutter/tree/main/demo/gorouter/gorouter_go_or_push

## Context.go VS context.push

Lorsque vous naviguez vers une nouvelle page avec GoRouter, vous pouvez utiliser la méthode go ou push. 

Les deux méthodes permettent de naviguer vers une nouvelle page, mais il y a quelques différences importantes.

La méthode go :

La méthode go permet de naviguer vers une nouvelle page en utilisant une transition animée. La transition est définie par les propriétés transitionDuration et transitionCurve dans les options de la route.

La méthode go remplace l'ensemble de la pile de navigation par la nouvelle page. Cela signifie que la page précédente sera supprimée de la pile et ne pourra pas être récupérée.

Utilisez go si vous souhaitez remplacer complètement la pile de navigation par une nouvelle page.

Exemple d'utilisation de go :

`context.go('/new-page');`


La méthode push :

La méthode push permet de naviguer vers une nouvelle page en l'ajoutant à la pile de navigation actuelle. Cela signifie que la page précédente restera en place et pourra être récupérée avec la méthode context.pop().

La méthode push ne permet pas de définir de transition animée. La transition par défaut est une transition de fondu.

Utilisez push si vous souhaitez ajouter une nouvelle page à la pile de navigation actuelle.

Exemple d'utilisation de push :

`context.push('/new-page');`

La méthode context.pop() :

La méthode context.pop() permet de supprimer la page actuelle de la pile de navigation et de revenir à la page précédente.

Si la page actuelle a été ajoutée à la pile avec push, context.pop() permettra de revenir à la page précédente en conservant la page précédente dans la pile.

Si la page actuelle a été ajoutée à la pile avec go, context.pop() ne pourra pas être utilisée pour revenir à la page précédente.

Exemple d'utilisation de context.pop() :

`context.pop();`

## Concusion

En résumé, si vous voulez remplacer complètement la pile de navigation par une nouvelle page, utilisez go. 

Si vous voulez ajouter une nouvelle page à la pile de navigation actuelle, utilisez push,

et si vous voulez revenir à la page précédente, utilisez context.pop().

L'optimisation veut que la méthode `push` soit utilisé le plus possible.


## A vous de jouer

Essayer, dans cet exercice de remplacer `context.go` par `context.push` et si vous avez compris la différence entre les deux, 

je vous laisse deviner les 2 choix possibles pour revenir en arrière.
