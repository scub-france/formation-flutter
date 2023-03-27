import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'Flutter Code pour FocusNode';

  @override
  build(context)=> const MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
    );

}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  List<Widget> children = <Widget>[];

  @override
  void initState() {
    super.initState();
    for(int i=0; i<6; i++) {
      _addChild();
    }
  }

  void _addChild() {
    children.add(const Padding(
      padding: EdgeInsets.all(2.0),
      child: ColorfulButton(),
    ));
  }

  @override
  build(_) => Scaffold(
      body: Center(
        child: GridView.count(
          crossAxisCount: 3,
          children: children,
        ),
      ),
    );
}

class ColorfulButton extends StatefulWidget {
  const ColorfulButton({super.key});

  @override
  State<ColorfulButton> createState() => _ColorfulButtonState();
}

class _ColorfulButtonState extends State<ColorfulButton> {
  final FocusNode _node= FocusNode();
  bool _focused = false;
  late FocusAttachment _nodeAttachment;

  //Définissez le nœud de focus. Pour gérer le cycle de vie, créez le FocusNode dans
  //la méthode initState et nettoyez-le dans la méthode dispose.
  @override
  void initState() {
    super.initState();
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
    _node.removeListener(_handleFocusChange);
    // attachment sera detaché sur appel de dispose().
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
          height: 100,
          color: _focused ? Colors.green : Colors.red,
          alignment: Alignment.center,
          child:
          Text(_focused ? "Selectionné" : 'Non Selectionné'),
        ),
      ),
    );
  }
}
