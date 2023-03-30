import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: const AlphaNumeriqueFilter(),
      ),
    );
  }
}

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
        affichage="";
        _focused = _node.hasFocus;
      });
    }
  }

  KeyEventResult _handleKeyPress(FocusNode node, RawKeyEvent event) {
    if (event is RawKeyDownEvent) {
      if(event.logicalKey.keyLabel=="Tab"){
        return KeyEventResult.ignored;
      }
      if (alphanumerique.contains(event.logicalKey.keyLabel)) {
        setState(() {
          affichage = affichage + event.logicalKey.keyLabel;
          _color = Colors.green;
        });
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

class ParentButton extends StatefulWidget {
  const ParentButton({super.key});

  @override
  State<ParentButton> createState() => _ParentButton();
}

class _ParentButton extends State<ParentButton> {
  late FocusNode _nodeParent;
  late FocusAttachment _nodeAttachmentParent;
  String presentation="On vous presente cet exemple avec trois filtres, chaque filtre a son foncusNode et les trois filtres ont comme parent notre widget principale qui contient le focus parent. \nOn constatera ainsi comment chaque focus traite les évenements clavier et/ou les renvois au scope parent.";
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

  KeyEventResult _handleKeyPressParent(FocusNode node, RawKeyEvent event) {
    if (event is RawKeyDownEvent) {
      if(event.logicalKey.keyLabel=="Tab"){
        return KeyEventResult.ignored;
      }
      if (voyelles.contains(event.logicalKey.keyLabel) ||
          consonnes.contains(event.logicalKey.keyLabel) ||
          numerique.contains(event.logicalKey.keyLabel)) {
        setState(() => affichage ='$affichage ${event.logicalKey.keyLabel}');
      }
      return KeyEventResult.handled;
    }
    return KeyEventResult.ignored;
  }

  @override
  void dispose() {
    // The attachment will automatically be detached in dispose().
    _nodeParent.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _nodeAttachmentParent.reparent();
    return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
            children: [
      Text(presentation),
      Text(affichage),
          Expanded(
            child: GridView.count(
              childAspectRatio:3,
              crossAxisCount: 2,
              children: [
        const Center(child:Text("Filtre voyelles" )), Focus(parentNode: _nodeParent, child: ChildButton(alphanumerique: voyelles, focusParent: _nodeParent)),
        const Center(child: Text("Filtre consonnes" )), Focus(parentNode: _nodeParent, child: ChildButton(alphanumerique: consonnes, focusParent: _nodeParent)),
        const Center(child: Text("Filtre chiffres" )), Focus(parentNode: _nodeParent, child: ChildButton(alphanumerique: numerique, focusParent: _nodeParent)),
      ],),
          )

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
