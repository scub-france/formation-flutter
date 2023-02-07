import 'package:flutter/material.dart';

import '../filter/filter.widget.dart';
import 'display.widget.dart';

/// Landing Board
class Board extends StatelessWidget {
  const Board({super.key});

  @override
  build(_) => Row(
        children: const [
          Flexible(flex: 2, child: FiltersList()),
          Flexible(flex: 11, child: Display()),
        ],
      );
}
