# Introduction

On a vu dans le cours stateless/stateful que l'état d'un `StatefulWidget` peut être manipulé depuis le widget lui-même
ou depuis le widget parent.

Vous vous êtes certainement demandés comment faire pour changer l'état d'un widget A depuis un widget B alors qu'ils ne partagent pas de lien 
direct. 

Flutter nous propose les InheritedWidgets, ceux-ci permettent de partager des informations dans 
l'arborescence des widgets. Néanmoins, les InheritedWidgets sont laborieux à mettre en œuvre.

# Le package Provider


Le package `Provider` réponds à ce besoins. Il suffit de placer notre `Provider` comme parent de nos widgets, il pourra ainsi transmettre les 
informations aux enfants que nous appellerons `Consumer`et ses derniers peuvent aussi mettre à jour les informations de leurs 
parent.

Le package Provider nous fournit plusieurs outils :

**ChangeNotifier** : Celui-ci devrait être étendu pour fournir un objet pouvant être utilisé pour envoyer des notifications 
de changement à ses écouteurs.

**ChangeNotifierProvider** : il contient des modifications d'un ChangeNotifier. Les widgets enfants peuvent accéder à l'objet
d'état et écouter les changements.

**Consumer** : Reconstruit une partie d'un sous-arbre lorsque l'état d'écoute change.

**Provider.of** : autorise les widgets descendants à accéder à l'objet d'état.

#### Construire un provider

```
class CompteurProvider extends ChangeNotifier {

// Valeur managée
int valeur=0;

void incrementeCompteur() {
    valeur++;
    // prévenir les consumers de la mise à jour
    notifyListeners();
   }
 }
```

Le provider doit étendre `ChangeNotifier`, de cette manière, `CompteurProvider` partage un compteur avec ses widgets enfants.
Notez l'appel à `notifyListeners()` qui est nécessaire pour notifier les abonnés des changements. 

#### Consommer notre provider

```
class ExampleCompteur extends StatelessWidget {

  const ExampleCompteur({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create:  (context) => CompteurProvider(),
    child: MaterialApp(......
```

Ici, ChangeNotifierProvider est le widget parent de tous les widgets. Notre provider aura ainsi, dans notre exemple,
la portée sur toute application. On peut Consommer notre provider de deux maniéres:
- *Via le Consumer widget :* 
    ```
    return Consumer<CompteurProvider>(
      builder: (context, compteur, child) {
        return Text('Valeur compteur: ${compteur.valeur}');
      },
    );
    ```
    Consumer est un widget qui écoute un Provider et transfère ses informations au constructeur. Grace a ça,
    l'appel de notifyListeners() reconstruit uniquement les éléments que Consumer englobe. Vous n'avez pas besoin de
    reconstruire toute la vue.
  
- *Via Provider.of :*
    ```
    Syntaxe: final MonProvider monProvider = Provider.of<MonProvider>(context, listen:true);
    ```
    Le paramètre booléen listen et facultatif, sa valeur par defaut est true, mettre ce paramètre a false permets d'eviter
    toute reconstruction inutile (l'appel a notifyListeners() n'aura aucun effet)...

#### MultiProvider

Selon les cas, on peut avoir besoin de plusieurs Provider ! le package Provider nous propose MultiProvider pour répondre
à notre besoin.
    
```
    class ExampleProvider extends StatelessWidget {
        const ExampleProvider({Key? key}) : super(key: key);
        @override
        Widget build(BuildContext context) {
        return MultiProvider(
        providers:
            [
                ChangeNotifierProvider(create:  (context) => CompteurProvider(),),
                ChangeNotifierProvider(create:  (context) => UserProvider(),)
            ],
    child: MaterialApp(......
    
```

# les variantes de Provider

Le Provider comprend de nombreuses variantes :

- ListenableProvider
- ChangeNotifierProvider
- ChangeNotifierProxyProvider
- ValueListenableProvider
- StreamProvider
- FutureProvider

Pour chacune de ces variantes de `Provider`, lorsque la “valeur fournie” change, vous avez la possibilité de notifier 
les Widgets qui font partie de l’arborescence dont le Provider est à l’origine, sous les conditions suivantes :

La “classe fournie” demande à notifier (via le 'notifyListeners()') ou est un Stream ou une Future qui se termine
La méthode externe facultative 'updateShouldNotify' renvoie true (ou est absente).
Vous avez un Widget Consumer ou des widgets qui ont appelé le 'Provider.of<…>(context, listen: true)' (avec le paramètre 
facultatif 'listen == true').

