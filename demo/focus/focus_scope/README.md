# focusScope

Il s'agit d'un nœud spécial dans l'arbre de focus qui sert de mécanisme de regroupement pour les nœuds de 
focus dans un sous-arbre. La traversée du focus reste dans une portée de focus à moins qu'un nœud en dehors de la 
portée ne soit explicitement focalisé. Il garde également une trace de la focalisation actuelle et de l'historique 
des nœuds focalisés dans son sous-arbre. De cette façon, si un nœud libère le focus ou est supprimé alors qu'il avait
le focus, le focus peut être renvoyé au nœud qui avait le focus précédemment. Les étendues de focus servent également
d'endroit où retourner le focus si aucun des descendants n'a le focus. 
Cela permet au code de traversée du focus d'avoir un contexte de départ pour trouver le contrôle focusable suivant 
(ou premier) vers lequel se déplacer.
