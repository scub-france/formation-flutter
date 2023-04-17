# flutter_pointer_event

## Introduction

La class `PointerEvent` est la class de base pour les événements tactiles, stylet ou souris.
`PointerEvent` fournit des événements qui expliquent l'emplacement et le mouvement des points sur les écrans, tels que les
touches, les souris et le style. Flutter ne fournit pas de moyen d'annuler ou d'arrêter l'envoi d'événements de 
pointeur.

## Implementation

`PointerEvent` est une class abstraite. Elle est donc implémentée par plusieurs class :

- `PointerAddedEvent`: L'appareil a commencé à suivre le pointeur.
                     Par exemple, le pointeur peut planer au-dessus de l'appareil, n'ayant pas encore été en contact avec
                     la surface de l'appareil.

- `PointerCancelEvent`: L'entrée du pointeur n'est plus dirigée vers ce récepteur.
                      Listener.onPointerCancel, permet aux appelants d'être informés de ces événements dans une 
                      arborescence de widgets.

- `PointerDownEvent`: Le pointeur est entré en contact avec l'appareil.
                    Listener.onPointerDown, permet aux appelants d'être informés de ces événements dans une 
                    arborescence de widgets.

- `PointerEnterEvent`: Le pointeur s'est déplacé par rapport au dispositif alors que le pointeur est ou n'est pas en 
                     contact avec le dispositif, et il est entré dans un objet cible.

- `PointerExitEvent`: Le pointeur s'est déplacé par rapport au dispositif alors que le pointeur est ou n'est pas en 
                    contact avec le dispositif, et a quitté un objet cible.

- `PointerHoverEvent`: Le pointeur s'est déplacé par rapport à l'appareil alors que le pointeur n'est pas en contact avec 
                     l'appareil.

- `PointerMoveEvent`: Le pointeur s'est déplacé par rapport au dispositif alors que le pointeur est en contact avec le 
                    dispositif.
                    Listener.onPointerMove permet aux appelants d'être informés de ces événements dans une arborescence
                    de widgets.

- `PointerPanZoomEndEvent`: Le panoramique/zoom sur ce pointeur est terminé.
                          Listener.onPointerPanZoomEnd, permet aux appelants d'être informés de ces événements dans une
                          arborescence de widgets.

- `PointerPanZoomStartEvent`: Un panoramique/zoom a commencé sur ce pointeur.
                            Listener.onPointerPanZoomStart permet aux appelants d'être informés de ces événements dans 
                            une arborescence de widgets.

- `PointerPanZoomUpdateEvent`: Le panoramique/zoom actif sur ce pointeur a été mis à jour.
                             Listener.onPointerPanZoomUpdate permet aux appelants d'être informés de ces événements
                             dans une arborescence de widgets.

- `PointerRemovedEvent`: L'appareil ne suit plus le pointeur.
                       Par exemple, le pointeur peut s'être éloigné de la plage de détection de survol de l'appareil ou 
                       avoir été entièrement déconnecté du système.

- `PointerSignalEvent`: Un événement qui correspond à un signal de pointeur discret.
                      Les signaux de pointeur sont des événements qui proviennent du pointeur, mais ne changent pas 
                      l'état du pointeur lui-même, et sont discrets plutôt que d'avoir besoin d'être interprétés dans
                      le contexte d'une série d'événements.
                      Listener.onPointerSignal, permet aux appelants d'être informés de ces événements dans une 
                      arborescence de widgets.
                      PointerSignalResolver, qui fournit un mécanisme d'acceptation par lequel les agents participants 
                      peuvent désambiguïser la cible d'un événement.

## Ecouter les événements

Un widget qui appelle des rappels en réponse à des événements de pointeur courants.

Il écoute les événements qui peuvent construire des gestes, comme lorsque le pointeur est enfoncé, déplacé, puis relâché
ou annulé.

Il n'écoute pas les événements qui sont exclusifs à la souris, comme lorsque la souris entre, sort ou survole une région
sans appuyer sur aucun bouton. Pour ces événements, utilisez `MouseRegion`.

Plutôt que d'écouter les événements de pointeur bruts, envisagez d'écouter les gestes de niveau supérieur à l'aide de 
`GestureDetector`.









                            
                          






                    






