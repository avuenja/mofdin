import 'package:flutter/services.dart';
import 'package:mofdin/enums.dart';

class GameKeyboardEvents {
  static Direction? walk(RawKeyEvent event) {
    Direction? keyDirection;

    if (event.logicalKey == LogicalKeyboardKey.keyA ||
        event.logicalKey == LogicalKeyboardKey.arrowLeft) {
      keyDirection = Direction.left;
    } else if (event.logicalKey == LogicalKeyboardKey.keyD ||
        event.logicalKey == LogicalKeyboardKey.arrowRight) {
      keyDirection = Direction.right;
    } else if (event.logicalKey == LogicalKeyboardKey.keyW ||
        event.logicalKey == LogicalKeyboardKey.arrowUp) {
      keyDirection = Direction.up;
    } else if (event.logicalKey == LogicalKeyboardKey.keyS ||
        event.logicalKey == LogicalKeyboardKey.arrowDown) {
      keyDirection = Direction.down;
    }

    return keyDirection;
  }
}
