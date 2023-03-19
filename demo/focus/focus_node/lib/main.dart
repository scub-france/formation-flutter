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
  List<FocusNode> childFocusNodes = <FocusNode>[];

  @override
  void initState() {
    super.initState();
    for(int i=0; i<6; i++) {
      _addChild();
    }
  }

  @override
  void dispose() {
    for (final FocusNode node in childFocusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  void _addChild() {
    childFocusNodes
        .add(FocusNode()..requestFocus());

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

  @override
  void dispose() {
    _node.removeListener(_handleFocusChange);
    // The attachment will automatically be detached in dispose().
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
