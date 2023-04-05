# link

https://zapp.run/github/Robert-Scub/formation-flutter/tree/main/demo/stateless_stateful

# zapp

- zz1i06jrz1j0 17 mars
- zk2q067uk2r0 17 mars


# stateless_stateful

Widget à états

## Widgets avec et sans état
Un widget est soit avec état, soit sans état. Si un widget peut changer, lorsqu'un utilisateur interagit avec lui, 
par exemple, il est avec état.

Un widget sans état ne change jamais. Icon, IconButton et Text sont des exemples de widgets sans état. Sous-classe 
de widgets sans état StatelessWidget.

Un widget avec état est dynamique : par exemple, il peut changer d'apparence en réponse à des événements déclenchés 
par des interactions de l'utilisateur ou lorsqu'il reçoit des données.

L'état d'un widget est stocké dans un Stateobjet, séparant l'état du widget de son apparence. L'état se compose de 
valeurs qui peuvent changer, comme la valeur actuelle d'un curseur ou si une case est cochée. Lorsque l'état du widget
change, l'objet d'état appelle setState(), indiquant au framework de redessiner le widget.

### Widge sans etat
On va s'interesser ici a la création d'un widget sans etat (statefulWidget).

L'état d'un widget peut être géré de plusieurs manières, mais dans notre exemple, le widget lui-même, FavoriteWidget, 
gérera son propre état. Dans cet exemple, basculer l'étoile est une action isolée qui n'affecte pas le widget parent ou 
le reste de l'interface utilisateur, de sorte que le widget peut gérer son état en interne.
Dans cette section, je vais detailler la création un widget avec état personnalisé. notre wigdet affichera un mot aléatoire
qu'on peut actualiser en cliquant sur un button.

L'implémentation d'un widget avec état personnalisé nécessite la création de deux classes :

    1: Une sous-classe de StatefulWidgetdéfinit le widget.
    2: Une sous-classe de Statequi contient l'état de ce widget et définit la build()méthode du widget.

La RandomWordPage gère son propre état, elle se substitue donc createState() pour créer un State objet. Le framework 
appelle createState() quand il veut construire le widget. Dans cet exemple, createState() renvoie une instance de 
_RandomWordPage, que vous implémenterez à l'étape suivante.

    class RandomWordPage extends StatefulWidget {
    const RandomWordPage({super.key});

    @override
    State<RandomWordPage> createState() => _RandomWordPage();
    }

La _RandomWordPage stocke les données mutables qui peuvent changer au cours de la durée de vie du widget. 
Lorsque l'application est lancée pour la première fois, l'interface utilisateur affiche un mot aléatoire, indiquant.
Cette valeur est stockée dans le champ _resultat :

    class _RandomWordPage extends State<RandomWordPage> {
    String _resultat = getRandom();
    ........
    }

Je vous laisse le soin de voir le code proposé dans main(), les commentaires sont là pour vous aider a la compréhension.

#### La methode initState()
Le framework appellera cette méthode exactement une fois pour chaque objet State qu'il crée.
Cette methode est utile si on doit s'abonner a un Listener par exemple....
Les implémentations de cette méthode doivent commencer par un appel à la méthode héritée, comme dans super.initState().

#### La methode dispose()
Le framework appellera cette méthode exactement une fois pour chaque objet State qu'il crée.
Cette methode est utile pour se désabonner des abonnements fait dans initState()... on évite ainsi les fuites mémoires.
Les implémentations de cette méthode doivent se terminer par un appel à la méthode héritée, comme dans super.dispose().

## Exemple
Afficher un mot aléatoire depuis une liste et l'actualiser grace a un button.
Le widget TitreDeSorite la demo n'a pas besoin de changer, il est donc stateless.
Le widget RandomWordPage contient l'element à afficher et qui doit réagir au button ... il est donc stateful


