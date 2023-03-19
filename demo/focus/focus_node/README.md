# focus_node

Un objet qui peut être utilisé par un widget avec état pour obtenir le focus clavier et gérer les événements clavier.

Veuillez consulter les widgets Focus et FocusScope , qui sont des widgets utilitaires qui gèrent respectivement leurs propres FocusNode s et FocusScopeNode s. S'ils ne sont pas appropriés, les FocusNode peuvent être gérés directement, mais le faire soi-même est rare.

Les FocusNode sont des objets persistants qui forment un arbre de focus qui est une représentation des widgets de la hiérarchie qui sont intéressés par le focus. Un nœud de focus peut devoir être créé s'il est transmis depuis un ancêtre d'un widget Focus pour contrôler le focus des enfants de l'ancêtre, ou un widget peut avoir besoin d'en héberger un si le sous-système de widget n'est pas utilisé, ou si les widgets Focus et FocusScope offrent un contrôle insuffisant.

Les FocusNode sont organisés en portées (voir FocusScopeNode ), qui forment des sous-arborescences de nœuds qui restreignent la traversée à un groupe de nœuds. Dans une portée, les nœuds les plus récents ayant le focus sont mémorisés, et si un nœud est focalisé puis non focalisé, le nœud précédent reçoit à nouveau le focus.

La hiérarchie des nœuds de focus peut être parcourue à l'aide des accesseurs parent , children , ancestors et descendants .

Les FocusNode sont des ChangeNotifier , de sorte qu'un écouteur peut être enregistré pour recevoir une notification lorsque le focus change. Si les widgets Focus et FocusScope sont utilisés pour gérer les nœuds, envisagez d'établir une dépendance InheritedWidget sur eux en appelant Focus.of ou FocusScope.of à la place. FocusNode.hasFocus peut également être utilisé pour établir une dépendance similaire, en particulier si tout ce qui est nécessaire est de déterminer si le widget est focalisé ou non au moment de la construction.

Pour voir l'arborescence de focus dans la console de débogage, appelez debugDumpFocusTree . Pour obtenir l'arborescence de focus sous forme de chaîne, appelez debugDescribeFocusTree .

## Cycle de vie
Plusieurs acteurs sont impliqués dans le cycle de vie d'un FocusNode / FocusScopeNode . Ils sont créés et supprimés par leur propriétaire , attachés, détachés et reparentés à l'aide d'un FocusAttachment par leur hôte (qui doit appartenir à l' État d'un StatefulWidget ), et ils sont gérés par le FocusManager . Différentes parties de l' API FocusNode sont destinées à ces différents acteurs.

Les FocusNode (et donc les FocusScopeNode ) sont des objets persistants qui font partie d'un arbre de focus qui est une représentation clairsemée des widgets de la hiérarchie qui souhaitent recevoir des événements de clavier. Ils doivent être gérés comme tout autre état persistant, ce qui est généralement fait par un StatefulWidget qui possède le nœud. Un widget avec état qui possède un nœud de portée de focus doit appeler dispose depuis sa méthode State.dispose .

Une fois créé, un FocusNode doit être attaché à l'arborescence du widget via un objet FocusAttachment . Cette pièce jointe est créée en appelant attach , généralement à partir de la méthode State.initState . Si le widget d'hébergement est mis à jour pour avoir un nœud de focus différent, le nœud mis à jour doit être attaché dans State.didUpdateWidget , après avoir appelé FocusAttachment.detach sur le FocusAttachment précédent .

Étant donné que les FocusNode forment une représentation fragmentée de l'arborescence des widgets, ils doivent être mis à jour chaque fois que l'arborescence des widgets est reconstruite. Cela se fait en appelant FocusAttachment.reparent , généralement à partir des méthodes State.build ou State.didChangeDependencies du widget qui représente la région ciblée, de sorte que le BuildContext attribué au FocusScopeNode puisse être suivi (le contexte est utilisé pour obtenir le RenderObject , à partir de laquelle la géométrie des régions ciblées peut être déterminée).

La création d'un FocusNode chaque fois que State.build est invoqué entraînera la perte du focus à chaque fois que le widget est construit, ce qui n'est généralement pas un comportement souhaité (appelez unfocus si la perte du focus est souhaitée).

Si, comme c'est souvent le cas, le StatefulWidget d'hébergement est également le propriétaire du nœud de focus, il appellera également dispose à partir de son State.dispose (auquel cas le FocusAttachment.detach peut être ignoré, car dispose se détachera automatiquement). Si un autre objet possède le nœud de focus, il doit appeler dispose lorsque le nœud a fini d'être utilisé.

## Propagation des événements clés
Le FocusManager reçoit les événements clés de RawKeyboard et HardwareKeyboard et les transmet aux nœuds ciblés. Il commence par le nœud avec le focus principal et appellera le rappel onKey ou onKeyEvent pour ce nœud. Si le rappel renvoie KeyEventResult.ignored , indiquant qu'il n'a pas géré l'événement, le FocusManager se déplacera vers le parent de ce nœud et appellera son onKey ou onKeyEvent . Si cet onKey ou onKeyEvent renvoie KeyEventResult.handled , il arrêtera de propager l'événement. S'il atteint la racineFocusScopeNode , FocusManager.rootScope , l'événement est ignoré.

## Traversée de mise au point
Le terme parcours , parfois appelé parcours de tabulation , fait référence au déplacement du focus d'un widget à l'autre dans un ordre particulier (également parfois appelé ordre de tabulation , puisque la touche TAB est souvent liée à l'action pour passer au widget suivant ).

Pour donner le focus au widget suivant ou précédent logique dans l'interface utilisateur, appelez les méthodes nextFocus ou previousFocus . Pour donner le focus à un widget dans une direction particulière, appelez la méthode focusInDirection .

La politique pour ce qu'est le widget suivant ou précédent , ou le widget dans une direction particulière, est déterminée par la FocusTraversalPolicy en vigueur.

La politique ambiante est déterminée en recherchant la hiérarchie des widgets pour un widget FocusTraversalGroup et en obtenant la politique de traversée du focus à partir de celui-ci. Différents nœuds de focus peuvent hériter de politiques différentes, de sorte qu'une partie de l'application peut aller dans un ordre prédéfini (à l'aide de OrderedTraversalPolicy ), et une partie peut aller dans l'ordre de lecture (à l'aide de ReadingOrderTraversalPolicy ), selon le cas d'utilisation.

Les stratégies prédéfinies incluent WidgetOrderTraversalPolicy , ReadingOrderTraversalPolicy , OrderedTraversalPolicy et DirectionalFocusTraversalPolicyMixin , mais des stratégies personnalisées peuvent être créées en fonction de ces stratégies. Voir FocusTraversalPolicy pour plus d'informations.