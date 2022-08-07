import 'package:flutter/material.dart';

import 'package:mofdin/ui/layouts/large_layout.dart';
import 'package:mofdin/ui/layouts/medium_layout.dart';
import 'package:mofdin/ui/layouts/small_layout.dart';

class GameLayout extends StatelessWidget {
  const GameLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth >= 1200) {
        return const LargeLayout();
      } else if (constraints.maxWidth >= 600) {
        return const MediumLayout();
      } else {
        return SmallLayout();
      }
    });
  }
}
