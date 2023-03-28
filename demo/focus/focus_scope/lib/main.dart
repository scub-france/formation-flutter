import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: Scaffold(body: FocusApp())));

class FocusApp extends StatefulWidget {
  const FocusApp({super.key});

  @override
  State<FocusApp> createState() => _FocusAppState();
}

class _FocusAppState extends State<FocusApp> {
  bool isScope1canRequestFocus= true;
  bool isScope2canRequestFocus= false;
  @override
  build(_) {
    final checkbox1= Checkbox(
        checkColor: Colors.white,
    value: isScope1canRequestFocus,
    onChanged: (bool? value) {
    setState(() {
    isScope1canRequestFocus = value!;
    });});
    final checkbox2= Checkbox(
        checkColor: Colors.white,
        value: isScope2canRequestFocus,
        onChanged: (value) {
          setState(() {
            isScope2canRequestFocus = value!;
          });});
    final scope1=FocusScope(canRequestFocus:isScope1canRequestFocus , child:const GroupeButtonWidget());
    final scope2=FocusScope(canRequestFocus:isScope2canRequestFocus , child:const GroupeButtonWidget());
    return Center(
      child: Column(
        children: [checkbox1,Expanded(child:scope1), checkbox2, Expanded(child:scope2)]
      ),
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
    body: Center(child:Row(
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
  final FocusNode _node= FocusNode();
  bool _focused = false;
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

  void _handleFocusChange() {
    if (_node.hasFocus != _focused) {
      setState(() {
        _focused = _node.hasFocus;
      });
    }
  }

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
      onTap: () {
        if (_focused) {
          _node.unfocus();
        } else {
          _node.requestFocus();
        }
      },
      child: Center(
        child: Container(
          width: 200,
          height: 70,
          color: _focused ? Colors.green : Colors.red,
          alignment: Alignment.center,
          child:
          Text(_focused ? "Selectionné" : 'Non Selectionné'),
        ),
      ),
    );
  }
}