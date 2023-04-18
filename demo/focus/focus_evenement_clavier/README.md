#### Appelé si ce nœud de focus reçoit un événement clé alors qu'il est focalisé (c'est-à-dire quand hasFocus renvoie true).

# Propagation des événements clés

Le FocusManager reçoit les événements clés de RawKeyboard et HardwareKeyboard et les transmet aux nœuds ciblés. Il commence par 
le nœud avec le focus principal et appellera le rappel onKey ou onKeyEvent pour ce nœud. Si le rappel renvoie KeyEventResult.ignored , 
indiquant qu'il n'a pas géré l'événement, le FocusManager se déplacera vers le parent de ce nœud et appellera son onKey ou onKeyEvent .

Si cet onKey ou onKeyEvent renvoie KeyEventResult.handled , il arrêtera de propager l'événement. S'il atteint la racineFocusScopeNode ,
FocusManager.rootScope , l'événement est ignoré.