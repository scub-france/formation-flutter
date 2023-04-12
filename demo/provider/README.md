# Introduction

On a vu dans le cours Stateless/stateful que l'etat d'un statefulWidget peut etre manipulé depuis le widget lui meme
ou depuis le widget parent.

Vous vous etes certainement demandés comment faire pour changer l'etat d'un widget A depuis un widget B sachant qu'ils n'ont aucun
lien de parenté... Flutter nous propose les InheritedWidgets, ceux-ci permettent de partager des informations dans 
l'arborescence des widgets. Néanmoins, les InheritedWidgets sont difficiles à mettre en œuvre.

# Le package Provider

Pour répondre a nos besoins d'une manière facile et optimale, le package Provider (fournisseur) a commencé comme une extension de 
InheritedWidget, facilitant la gestion des informations dans l'arborescence des widgets. 

Il suffit de placer notre PROVIDER comme parent de nos widgets, il pourra ainsi diffuser les informations a ses enfants
qu'on appellera CONSUMER (Consommateur) et ses derniers peuvent aussi mettre a jour les informations de leurs PROVIDER.

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
int valeur=0;
void incrementeCompteur() {
    valeur++;
    notifyListeners();
   }
 }
```

Le provider doit étendre ChangeNotifier, de cette maniere, CompteurProvider partage un compteur avec ses descendants.
Notez l'appel a notifyListeners() qui est nécessaire pour notifier les abonnés des changements. 

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

Selon les cas, on peut avoir besoin de plusieurs Provider ! le package Provider nous propose MultiProvider pour repondre
a notre besoin.
    
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

Pour chacune de ces variantes du Provider, lorsque la “valeur fournie” change, vous avez la possibilité de notifier 
les Widgets qui font partie de l’arborescence dont le Provider est à l’origine, sous les conditions suivantes :

La “classe fournie” demande à notifier (via le notifyListeners()) ou est un Stream ou une Future qui se termine
La méthode externe facultative updateShouldNotify renvoie true (ou est absente).
Vous avez un Widget Consumer ou des widgets qui ont appelé le Provider.of<…>(context, listen: true) (avec le paramètre 
facultatif listen == true).

