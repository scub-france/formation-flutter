import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Cet exemple contient trois filtres.
/// Chaque filtre a son noeud de focus et les trois noeuds ont comme
/// parent notre widget principale qui contient le focus parent.
/// On constatera ainsi comment chaque focus traite les évènements
/// clavier et/ou les renvois au scope parent

void main() => runApp(MaterialApp(
    home: Scaffold(
        appBar: AppBar(title:  const Center(child: Text("Focus et les evenements clavier"))),
        body: const SingleChildScrollView(child: AlphaNumeriqueFilter()))));

/// Notre fabrique de filtres,
class ChildButton extends StatefulWidget {
  const ChildButton(
      {super.key,
      required this.alphanumerique,
      required FocusNode focusParent,
      required this.affichageParDefaut});

  final List<String> alphanumerique;
  final String affichageParDefaut;

  @override
  State<ChildButton> createState() => _ChildButtonState();
}

class _ChildButtonState extends State<ChildButton> {
// Chaque FocusButton possède son propre noeud de focus
  final FocusNode _node = FocusNode();

// Cet variable permets de savoir si le focus a changé on la comparent
// a _node.hasFocus ! Permet de changer l'état du widget qu'en cas
// du changement du focus
  bool _focused = false;

// Cet attribut est initialisé et expliqué dans la methode initState()
  late FocusAttachment _nodeAttachment;
  Color _color = Colors.white;
  String affichage = "";

  @override
  void initState() {
    super.initState();

// Si vous souhaitez être averti chaque fois que Focus change, enregistrez un écouteur avec addListener
    _node.addListener(_handleFocusChange);

// Une fois créé, un FocusNode doit être attaché à l'arborescence du widget par
// son hôte StatefulWidget via un objet FocusAttachment
    _nodeAttachment = _node.attach(context, onKey: _handleKeyPress);
  }

  /// Change l'état de notre widget si le changement du focus le concerne
  void _handleFocusChange() {
    if (_node.hasFocus != _focused) {
      setState(() {
        _color = _node.hasFocus ? Colors.lightBlueAccent : Colors.white;
        affichage = "";
        _focused = _node.hasFocus;
      });
    }
  }

  /// Cette methode est appelée a chaque évènement du clavier,
  /// l'appel a la methode se fait grace a l'attribut onKey de
  /// la methode attach voir plus haut dans initState()
  KeyEventResult _handleKeyPress(FocusNode node, RawKeyEvent event) {
    if (event is RawKeyDownEvent) {
// on ignore l'événement "Tab" pour garder la fonctionalité tabulation
      if (event.logicalKey.keyLabel == "Tab") {
        return KeyEventResult.ignored;
      }
      if (widget.alphanumerique.contains(event.logicalKey.keyLabel)) {
        setState(() {
          /// On traite le cas des numPad
          affichage =
              affichage + event.logicalKey.keyLabel.replaceAll('Numpad ', '');
          _color = Colors.green;
        });

// On prévient le FocusManager que l'événement est traité et stoppera
// ainsi la propagation
        return KeyEventResult.handled;
      } else if (!widget.alphanumerique.contains(event.logicalKey.keyLabel)) {
        setState(() {
          _color = Colors.red;
        });

// On prévient le FocusManager que l'événement n'a pas été traité pour
// qu'il n'arrête pas ainsi la propagation
        return KeyEventResult.ignored;
      }
    }
    setState(() {
      _color = node.hasFocus ? Colors.lightBlueAccent : Colors.white;
    });

// On prévient le FocusManager que l'événement n'a pas été traité pour
// qu'il n'arrête pas ainsi la propagation
    return KeyEventResult.ignored;
  }

  /// oublions pas de libérer la memoire
  @override
  void dispose() {
    _node.removeListener(_handleFocusChange);

// l'attachement sera automatiquement détaché grace a FocusNode.dispose().
    _node.dispose();
    super.dispose();
  }

  @override
  build(_) {
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
          height: 40,
          color: _color,
          alignment: Alignment.center,
          child: Text(_focused ? affichage : widget.affichageParDefaut),
        ),
      ),
    );
  }
}

/// Notre widget principal
class ParentButton extends StatefulWidget {
  const ParentButton({super.key});

  @override
  State<ParentButton> createState() => _ParentButton();
}

class _ParentButton extends State<ParentButton> {
  late FocusNode _nodeParent;
  late FocusAttachment _nodeAttachmentParent;
  final affichageStatic = "Touche alphanumerique rejetée:";
  String affichageDynamic = "";
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
  final numerique = List<String>.generate(10, (int index) => index.toString()) +
      List<String>.generate(10, (int index) => "Numpad $index");

  @override
  void initState() {
    super.initState();
    _nodeParent = FocusNode();
    _nodeAttachmentParent =
        _nodeParent.attach(context, onKey: _handleKeyPressParent);
  }

  /// Cette methode est appelée a chaque évènement du clavier, l'appel a la methode se
  /// fait grace a l'attribut onKey de la methode attach voir plus haut dans initState()
  /// a ce niveau (noeud parent), seul les évènements ignorés pas le noeud enfant seront traités
  KeyEventResult _handleKeyPressParent(FocusNode node, RawKeyEvent event) {
    if (event is RawKeyDownEvent) {
// on ignore l'évènement "Tab" pour garder la fonctionalité tabulation
      if (event.logicalKey.keyLabel == "Tab") {
        return KeyEventResult.ignored;
      }

// Ici, on traite les caractères refusé par nos filtres
      if (voyelles.contains(event.logicalKey.keyLabel) ||
          consonnes.contains(event.logicalKey.keyLabel) ||
          numerique.contains(event.logicalKey.keyLabel)) {
        setState(() => affichageDynamic = event.logicalKey.keyLabel);
      }
      return KeyEventResult.handled;
    }

// Tout évènement qui ne parvient pas du clavier sera ignoré par notre widget et sera
// ainsi traité a un niveau plus haut de l'application
    return KeyEventResult.ignored;
  }

  /// N'oublions pas de dispose notre node
  @override
  void dispose() {
    _nodeParent.dispose();
    super.dispose();
  }

  @override
  build(_) {
// Garantit que le FocusNode attaché à ce point d'attachement a le bon nœud
// parent, en le modifiant si nécessaire.
    _nodeAttachmentParent.reparent();
    return Center(
        child: Column(mainAxisSize: MainAxisSize.min, children: [

// On crée le liens de parenté entre notre noeud parent et enfant
      Focus(
          parentNode: _nodeParent,
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: ChildButton(
              alphanumerique: voyelles,
              focusParent: _nodeParent,
              affichageParDefaut: 'Filtre voyelles',
            ),
          )),

// On crée le liens de parenté entre notre noeud parent et enfant
      Focus(
          parentNode: _nodeParent,
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: ChildButton(
              alphanumerique: consonnes,
              focusParent: _nodeParent,
              affichageParDefaut: 'Filtre consonnes',
            ),
          )),

// on crée le liens de parenté entre notre noeud parent et enfant
      Focus(
          parentNode: _nodeParent,
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: ChildButton(
              alphanumerique: numerique,
              focusParent: _nodeParent,
              affichageParDefaut: 'Filtre chiffres',
            ),
          )),
      Card(child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Text(affichageStatic, style: const TextStyle(fontSize: 18)),
      )),
      Text(
        affichageDynamic,
        style: const TextStyle(color: Colors.red, fontSize: 70),
      )
    ]));
  }
}

class AlphaNumeriqueFilter extends StatelessWidget {
  const AlphaNumeriqueFilter({super.key});

  @override
  build(context) => DefaultTextStyle(
        style: Theme.of(context).textTheme.headlineMedium!,
        child: const ParentButton(),
      );
}
