# flutter_layout

Gestion flutter_layout

## L'arbre de Layout

L'arbre de Layout est un concept clé dans la construction de l'interface utilisateur dans Flutter. 

Il représente la structure hiérarchique des widgets de mise en page utilisé pour organiser les éléments d'une interface utilisateur.


L'arbre de layout commence par un widget racine (généralement MaterialApp ou WidgetsApp) et chaque widget de mise en page ajouté ensuite est un enfant du widget parent qui l'a créé. 

L'ensemble des widgets de mise en page forme donc une hiérarchie d'arborescence qui détermine l'emplacement et la taille de chaque widget dans l'interface utilisateur.

Lorsque l'interface utilisateur est construite, Flutter effectue un processus de "layout" (ou "composition") pour déterminer l'emplacement et la taille de chaque widget en fonction de leur position dans l'arbre de layout. 

Ce processus se déroule en deux étapes :

-La première étape est le calcul des contraintes de mise en page pour chaque widget en descendant dans l'arbre de layout. 
 Les contraintes incluent la taille minimale et maximale du widget, ainsi que la position et la taille des widgets parents. 
 Cette étape se termine par la définition des contraintes de mise en page pour le widget racine de l'arbre de layout.

-La deuxième étape consiste à effectuer le "layout" proprement dit, en utilisant les contraintes de mise en page pour chaque widget dans l'arbre. 
 Cela détermine la position et la taille de chaque widget dans l'interface utilisateur en fonction de la disposition des widgets parents et de leurs propres contraintes de mise en page.

Une fois le layout effectué, Flutter affiche l'interface utilisateur mise à jour sur l'écran. L'arbre de layout est donc un élément clé de la construction d'interfaces utilisateur flexibles et adaptables dans Flutter.