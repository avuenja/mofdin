import 'package:flame/game.dart';
import 'package:flutter/material.dart';

import 'package:mofdin/game_controller.dart';

class LargeLayout extends StatelessWidget {
  const LargeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final game = GameController();

    return Stack(children: [
      GameWidget(game: game),
      Container(
        color: Colors.blue,
        child: const Text('HUD'),
      ),
    ]);
  }
}
