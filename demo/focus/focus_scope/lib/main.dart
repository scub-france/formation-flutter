import 'package:flutter/material.dart';

///L'exemple suivant comporte deux Groupe de bouton
///chaque groupe a son focusScope
///On peut activer ou désactiver le focus sur chaque groupe grace aux cases a cocher

void main() => runApp(const MaterialApp(home: Scaffold(body: FocusApp())));

class FocusApp extends StatefulWidget {
  const FocusApp({super.key});

  @override
  State<FocusApp> createState() => _FocusAppState();
}

class _FocusAppState extends State<FocusApp> {

  // la case a cocher du premier groupe est cochée par défaut
  bool isScope1canRequestFocus = true;

  // la case a cocher du deuxième groupe est décochée par défaut
  bool isScope2canRequestFocus = false;

  @override
  build(_) {
    final checkbox1 = Row(children: [
      const Text('Demander le focus'),
      // la valeur de isScope1canRequestFocus permet de savoir si
      // l'utilisateur veut permettre le focus sur le groupe
      Checkbox(
          checkColor: Colors.white,
          value: isScope1canRequestFocus,
          onChanged: (value) {
            setState(() {
              isScope1canRequestFocus = value!;
            });
          })
    ]);

    final checkbox2 = Row(children: [
      const Text('Demander le focus'),
      Checkbox(
          checkColor: Colors.white,
          value: isScope2canRequestFocus,
          onChanged: (value) {
            setState(() {
              isScope2canRequestFocus = value!;
            });
          })
    ]);
    const sizeBox = SizedBox(width: 2, height: 50);

    /// tout se joue ici ! on crée ainsi deux FocusScope...
    final scope1 = FocusScope(canRequestFocus: isScope1canRequestFocus, child: const GroupeButtonWidget());
    final scope2 = FocusScope(canRequestFocus: isScope2canRequestFocus, child: const GroupeButtonWidget());
    return Center(
      child: Column(children: [
        checkbox1,
        Expanded(child: scope1),
        sizeBox,
        checkbox2,
        Expanded(child: scope2)
      ]),
    );
  }
}

class GroupeButtonWidget extends StatefulWidget {
  const GroupeButtonWidget({super.key});

  @override
  State<GroupeButtonWidget> createState() => _GroupeButtonWidget();
}

class _GroupeButtonWidget extends State<GroupeButtonWidget> {
  final children = List.generate(
      3,
      (index) => const Expanded(
        child: Padding(
              padding: EdgeInsets.all(2.0),
              child: FocusButton(),
            ),
      ));

  @override
  build(_) => Row(
    children: children,
  );
}

class FocusButton extends StatefulWidget {
  const FocusButton({super.key});

  @override
  State<FocusButton> createState() => _FocusButton();
}

class _FocusButton extends State<FocusButton> {
  final FocusNode _node = FocusNode();

  bool get isFocused => _node.hasFocus;
  late FocusAttachment _nodeAttachment;

  /// Définissez le nœud de focus. Pour gérer le cycle de vie, créez le FocusNode dans
  /// la méthode initState et nettoyez-le dans la méthode dispose.
  @override
  void initState() {
    super.initState();

    // Si vous souhaitez être averti chaque fois que Focus change, enregistrez un écouteur avec addListener
    _node.addListener(_handleFocusChange);

    // Une fois créé, un FocusNode doit être attaché à l'arborescence du widget par
    // son hôte StatefulWidget via un objet FocusAttachment
    _nodeAttachment = _node.attach(context);
  }

  void _handleFocusChange() => setState(() => print("Focus updated to $isFocused"));

  /// nettoyez le nœud de focus lorsque le formulaire est éliminé
  @override
  void dispose() {
    // Vous devez vous désinscrire avec removeListener pour éviter les fuites de mémoire
    _node.removeListener(_handleFocusChange);

    // attachment sera detaché sur appel de dispose().
    _node.dispose();
    super.dispose();
  }

  @override
  build(_) {
    // Garantit que le FocusNode attaché à ce point d'attachement a le bon nœud parent, en le modifiant si nécessaire.
    _nodeAttachment.reparent();
    return GestureDetector(
      /// permet d'avoir la main sur le focus grace au clics souris
      onTap: () => isFocused ? _node.unfocus() : _node.requestFocus(),
      child: DecoratedBox(
        decoration: BoxDecoration(color: isFocused ? Colors.green : Colors.orangeAccent),
        child: Center(child: isFocused ? const Text("Focus") : const Text("Click Me")),
      ),
    );
  }
}
