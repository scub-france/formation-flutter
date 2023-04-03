# KeepAlive

Nous sert à marquer un enfant comme ayant besoin de rester en vie. Imaginez un widgets qui necessite des calculs
ou des appels HTTP. Sans le KeepAlive l'état du widget sera perdu a chaque fois qu'il n'apparait plus a l'écran ! et au moment
ou l'utilisateur decide de revenir sur le widget, ce dernier sera réinitialisé et par consequence, le calcul ou appel HTTP sera effectué
a chaque réinitialisation...  ce comportement peut étre indésirable selon les cas d'utilisations.

Le widget KeepAlive est rarement utilisé directement. Les délégués SliverChildBuilderDelegate et SliverChildListDelegate, 
utilisés avec SliverList et SliverGrid, ainsi que les homologues de la vue de défilement ListView et GridView, ont une fonctionnalité
addAutomaticKeepAlives, qui est activée par défaut, et qui provoque l'insertion de widgets AutomaticKeepAlive autour de chaque enfant.

En pratique, la façon la plus simple de gérer ces notifications est de mélanger AutomaticKeepAliveClientMixin dans son State. 


# AutomaticKeepAliveClientMixin

Un mixin, avec des méthodes pratiques pour les clients de AutomaticKeepAlive, utilisé avec les sous classe State.
Les sous-classes doivent implémenter wantKeepAlive et leurs méthodes de construction doivent appeler super.build().

### Exemple de code
J'ai opté pour un TabBar comme exemple, consultez le code et ses commentaires, ensuite, manipulez le rendu !




