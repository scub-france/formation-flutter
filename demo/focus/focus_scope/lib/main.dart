import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: Scaffold(body: FocusApp())));

class FocusApp extends StatefulWidget {
  const FocusApp({super.key});

  @override
  State<FocusApp> createState() => _FocusAppState();
}

class _FocusAppState extends State<FocusApp> {
  final intruduction =
      "Voyons comment réagira notre application avec deux focusScope (groupes de focus).\n pour chaque focusScope, on lie un checkbox pour controller le parametre canRequestFocus de notre focusScope, on peut ainsi permettre/empécher le focusScope de demander le focus.";
  bool isScope1canRequestFocus = true;
  bool isScope2canRequestFocus = false;

  @override
  build(_) {
    final checkbox1 = Row(children: [
      const Text('  Le scope ne peut demander le focus que si la case est cochée'),
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
      const Text('  Le scope ne peut demander le focus que si la case est cochée'),
      Checkbox(
          checkColor: Colors.white,
          value: isScope2canRequestFocus,
          onChanged: (value) {
            setState(() {
              isScope2canRequestFocus = value!;
            });
          })
    ]);
    const sizeBox= SizedBox(width:2, height:50);
    // tout se joue ici ! on crée ainsi deux FocusScope...
    final scope1 = FocusScope(canRequestFocus: isScope1canRequestFocus, child: const GroupeButtonWidget());
    final scope2 = FocusScope(canRequestFocus: isScope2canRequestFocus, child: const GroupeButtonWidget());
    return Center(
      child: Column(children: [Text(intruduction),sizeBox,checkbox1, Expanded(child: scope1),sizeBox, checkbox2, Expanded(child: scope2)]),

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
      (index) => const Padding(
            padding: EdgeInsets.all(2.0),
            child: FocusButton(),
          ));

  @override
  build(_) => Scaffold(
        body: Center(
          child: Row(
            children: children,
          ),
        ),
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
    // attachment sera detaché sur appel de dispose().
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
            width: 200,
            height: 200,

            child: Center(
              child: isFocused ? const Text("Focus") : const SizedBox(),
            ),
          ),
        ),
      ),
    );
  }
}

