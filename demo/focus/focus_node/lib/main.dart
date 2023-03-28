import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: Scaffold(body: FocusApp())));

class FocusApp extends StatelessWidget {
  FocusApp({Key? key}) : super(key: key);

  final children = List.generate(
      6,
      (index) => const Padding(
            padding: EdgeInsets.all(2.0),
            child: FocusButton(),
          ));

  @override
  build(context) => Center(
          child: GridView.count(
        crossAxisCount: 3,
        children: children,
      ));
}

class FocusButton extends StatefulWidget {
  const FocusButton({super.key});

  @override
  State<FocusButton> createState() => _FocusButtonState();
}

class _FocusButtonState extends State<FocusButton> {
  final FocusNode _node = FocusNode();
  late FocusAttachment _nodeAttachment;

  bool get isFocused => _node.hasFocus;


  //Définissez le nœud de focus. Pour gérer le cycle de vie, créez le FocusNode dans
  //la méthode initState et nettoyez-le dans la méthode dispose.
  @override
  void initState() {
    super.initState();
    //Si vous souhaitez être averti chaque fois que Focus change, enregistrez un écouteur avec addListener
    _node.addListener(_handleFocusChange);
    _nodeAttachment = _node.attach(context);
  }

  void _handleFocusChange() => setState(() => print("Focus updated to $isFocused"));


  //nettoyez le nœud de focus lorsque le formulaire est éliminé
  @override
  void dispose() {
    //Vous devez vous désinscrire avec removeListener pour éviter les fuites de mémoire
    _node.removeListener(_handleFocusChange);
    
    // Libéré le noeud de focus
    _node.dispose();
    super.dispose();
  }

  @override
  build(_) {
    //Garantit que le FocusNode attaché à ce point d'attachement a le bon nœud parent, en le modifiant si nécessaire.
    _nodeAttachment.reparent();
    return GestureDetector(
      //permet d'avoir la main sur le focus grace au clics souris
      onTap: () => isFocused ? _node.unfocus() : _node.requestFocus(),
      child: Center(
        child: DecoratedBox(
          decoration: BoxDecoration(color: isFocused ? Colors.green : Colors.orangeAccent),
          child: SizedBox(
            width: 300,
            height: 300,
            child: Center(
              child: isFocused ? const Text("Focus") : const SizedBox(),
            ),
          ),

        ),
      ),
    );
  }
}

