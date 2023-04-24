
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: Scaffold(body: FocusApp())));

// Cet exemple montre une gridView dont tout les membre
// peuvent demander le focus.
class FocusApp extends StatelessWidget {
  FocusApp({Key? key}) : super(key: key);
  // Le gridView se constitue de 6 widget FocusButton
  final children = List.generate(
      6,
      (index) => Padding(
            padding: const EdgeInsets.all(2.0),
            child: FocusButton(index: index),
          ));

  @override
  build(context) => Center(
          child: GridView.count(
        crossAxisCount: 3,
        children: children,
      ));
}

class FocusButton extends StatefulWidget {
  const FocusButton({super.key, required this.index});
  final int index;
  @override
  State<FocusButton> createState() => _FocusButtonState();
}

class _FocusButtonState extends State<FocusButton> {

  // Chaque FocusButton possède son propre noeud de focus
  final FocusNode _node = FocusNode();


  late FocusAttachment _nodeAttachment;

  // FocusNode().hasFocus renvoie true si le noeud a le focus
  bool get isFocused => _node.hasFocus;


  /// Définissez le nœud de focus. Pour gérer le cycle de vie, créez le FocusNode dans
  /// la méthode initState et nettoyez-le dans la méthode dispose.
  @override
  void initState() {
    super.initState();
    // Si vous souhaitez être averti chaque fois que Focus change, enregistrez
    // un écouteur avec addListener
    _node.addListener(_handleFocusChange);

    // Une fois créé, un FocusNode doit être attaché à l'arborescence du widget par
    // son hôte StatefulWidget via un objet FocusAttachment
    _nodeAttachment = _node.attach(context);
  }

  // Enregistré comme listener de FocusNode, elle sera appelée si le widget
  // récupère ou perd le Focus et affichera son état dans la console
  void _handleFocusChange() => setState(() => print("Focus${widget.index+1} updated to $isFocused"));


  /// nettoyez le nœud de focus lorsque le formulaire est éliminé
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
    // Garantit que le FocusNode attaché à ce point d'attachement a le bon nœud
    // parent, en le modifiant si nécessaire.
    _nodeAttachment.reparent();
    return GestureDetector(
      // Permet d'avoir la main sur le focus grace au clics souris.
      // On peut toujours parcourir les noeuds grace a la touche TAB si
      // on ne fait aucun appel a requestFocus()
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

