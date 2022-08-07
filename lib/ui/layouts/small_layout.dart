import 'package:flame/game.dart';
import 'package:flutter/material.dart';

import 'package:mofdin/enums.dart';
import 'package:mofdin/game_controller.dart';
import 'package:mofdin/components/joypad.dart';

class SmallLayout extends StatelessWidget {
  final game = GameController();

  SmallLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      GameWidget(game: game),
      Align(
        alignment: Alignment.bottomRight,
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Joypad(onDirectionChanged: onJoypadDirectionChanged),
        ),
      ),
    ]);
  }

  void onJoypadDirectionChanged(Direction direction) {
    game.onJoypadDirectionChanged(direction);
  }
}
