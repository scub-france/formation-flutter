import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(const MaterialApp(home: Scaffold(body: AlphaNumeriqueFilter())));

//Notre fabrique de filtres,
class ChildButton extends StatefulWidget {
  const ChildButton({super.key, required this.alphanumerique, required FocusNode focusParent});

  final List<String> alphanumerique;

  @override
  State<ChildButton> createState() => _ChildButtonState(alphanumerique);
}

class _ChildButtonState extends State<ChildButton> {
  late FocusNode _node;
  bool _focused = false;
  late FocusAttachment _nodeAttachment;
  Color _color = Colors.white;
  final List<String> alphanumerique;

  _ChildButtonState(this.alphanumerique);

  String affichage = "";

  @override
  void initState() {
    super.initState();
    _node = FocusNode(debugLabel: 'Button');
    _node.addListener(_handleFocusChange);
    _nodeAttachment = _node.attach(context, onKey: _handleKeyPress);
  }

  void _handleFocusChange() {
    if (_node.hasFocus != _focused) {
      setState(() {
        affichage = "";
        _focused = _node.hasFocus;
      });
    }
  }

  //Cette methode est appelée a chaque evenement du clavier, l'appel a la methode se fait grace a l'attribut onKey de la methode attach
  //voir plus haut dans initState()
  KeyEventResult _handleKeyPress(FocusNode node, RawKeyEvent event) {
    if (event is RawKeyDownEvent) {
      //on ignore l'evenement "Tab" pour garder la fonctionalité tabulation
      if (event.logicalKey.keyLabel == "Tab") {
        return KeyEventResult.ignored;
      }
      if (alphanumerique.contains(event.logicalKey.keyLabel)) {
        setState(() {
          affichage = affichage + event.logicalKey.keyLabel;
          _color = Colors.green;
        });
        //On prévient ici le FocusManager que l'evenement a été traité et stoppera ainsi la propagation
        return KeyEventResult.handled;
      } else if (!alphanumerique.contains(event.logicalKey.keyLabel)) {
        setState(() {
          _color = Colors.red;
        });
        return KeyEventResult.ignored;
      }
    }
    setState(() {
      _color = Colors.white;
    });
    return KeyEventResult.ignored;
  }

  //oublions pas de liberer la memoire
  @override
  void dispose() {
    _node.removeListener(_handleFocusChange);
    // The attachment will automatically be detached in dispose().
    _node.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _nodeAttachment.reparent();
    return GestureDetector(
      onTap: () {
        if (_focused) {
          _node.unfocus();
        } else {
          _node.requestFocus();
        }
      },
      child: Center(
        child: Container(
          width: 400,
          height: 50,
          color: _focused ? _color : Colors.white,
          alignment: Alignment.center,
          child: Text(_focused ? affichage : 'Press to focus'),
        ),
      ),
    );
  }
}

//Notre widget principal
class ParentButton extends StatefulWidget {
  const ParentButton({super.key});

  @override
  State<ParentButton> createState() => _ParentButton();
}

class _ParentButton extends State<ParentButton> {
  late FocusNode _nodeParent;
  late FocusAttachment _nodeAttachmentParent;
  String presentation =
      "On vous presente cet exemple avec trois filtres, chaque filtre a son foncusNode et les trois filtres ont comme parent notre widget principale qui contient le focus parent. \nOn constatera ainsi comment chaque focus traite les évenements clavier et/ou les renvois au scope parent.";
  String affichage = "Touche alphanumerique rejetées:";
  final voyelles = ['A', 'E', 'Y', 'U', 'O', 'I'];
  final consonnes = [
    'Z',
    'R',
    'T',
    'P',
    'Q',
    'S',
    'D',
    'F',
    'G',
    'H',
    'J',
    'K',
    'L',
    'M',
    'W',
    'X',
    'C',
    'V',
    'B',
    'N'
  ];
  final numerique = List<String>.generate(10, (int index) => index.toString());

  @override
  void initState() {
    super.initState();
    _nodeParent = FocusNode();
    _nodeAttachmentParent = _nodeParent.attach(context, onKey: _handleKeyPressParent);
  }

  //Cette methode est appelée a chque evenement du clavier, l'appel a la methode se fait grace a l'attribut onKey de la methode attach
  //voir plus haut dans initState()
  //a ce niveau (noeud parent), seul les evenements ignorés pas le noeud enfant seront traités
  KeyEventResult _handleKeyPressParent(FocusNode node, RawKeyEvent event) {
    if (event is RawKeyDownEvent) {

      //on ignore l'evenement "Tab" pour garder la fonctionalité tabulation
      if (event.logicalKey.keyLabel == "Tab") {
        return KeyEventResult.ignored;
      }

      //Ici, on traite les caractéres refusé par nos filtres
      if (voyelles.contains(event.logicalKey.keyLabel) ||
          consonnes.contains(event.logicalKey.keyLabel) ||
          numerique.contains(event.logicalKey.keyLabel)) {
        setState(() => affichage = '$affichage ${event.logicalKey.keyLabel}');
      }
      return KeyEventResult.handled;
    }

    //Tout evenement qui ne parvient pas du clavier sera ignoré par notre widget et sera ainsi traité a un niveau plus haut de l'application
    return KeyEventResult.ignored;
  }

  //N'oublions pas de dispose notre node
  @override
  void dispose() {
    _nodeParent.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _nodeAttachmentParent.reparent();
    return Center(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
      Text(presentation),
      Expanded(
        child: GridView.count(
          childAspectRatio: 3,
          crossAxisCount: 2,
          children: [
            const Center(child: Text("Filtre voyelles")),
            //c'est ici qu'on crée le liens de parenté entre notre noeud parent et enfant
            Focus(parentNode: _nodeParent, child: ChildButton(alphanumerique: voyelles, focusParent: _nodeParent)),
            const Center(child: Text("Filtre consonnes")),
            //c'est ici qu'on crée le liens de parenté entre notre noeud parent et enfant
            Focus(parentNode: _nodeParent, child: ChildButton(alphanumerique: consonnes, focusParent: _nodeParent)),
            const Center(child: Text("Filtre chiffres")),
            //c'est ici qu'on crée le liens de parenté entre notre noeud parent et enfant
            Focus(parentNode: _nodeParent, child: ChildButton(alphanumerique: numerique, focusParent: _nodeParent)),
          ],
        ),
      ),
      Text(affichage),
    ]));
  }
}

class AlphaNumeriqueFilter extends StatelessWidget {
  const AlphaNumeriqueFilter({super.key});

  @override
  build(context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return DefaultTextStyle(
      style: textTheme.headlineMedium!,
      child: const ParentButton(),
    );
  }
}
