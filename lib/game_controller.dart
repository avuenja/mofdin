import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:mofdin/components/maps/village.dart';
import 'package:mofdin/components/player.dart';
import 'package:mofdin/enums.dart';
import 'package:mofdin/keyboard_events.dart';

class GameController extends FlameGame with KeyboardEvents {
  final _world = VillageMap();
  final _player = Player();

  @override
  Color backgroundColor() => const Color(0xFF330000);

  @override
  Future<void> onLoad() async {
    await add(_world);
    add(_player);

    _player.position = _world.size / 2;

    camera.followComponent(
      _player,
      worldBounds: Rect.fromLTRB(
        0,
        0,
        _world.size.x,
        _world.size.y,
      ),
    );
  }

  @override
  KeyEventResult onKeyEvent(
      RawKeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    final isKeyDown = event is RawKeyDownEvent;

    Direction? keyDirection;

    keyDirection = GameKeyboardEvents.walk(event);

    if (isKeyDown && keyDirection != null) {
      _player.direction = keyDirection;
    } else if (_player.direction == keyDirection) {
      _player.direction = Direction.none;
    }

    // MARK: Test of other events and keys, in the future, add Hotkeys for spells and expressions
    if (isKeyDown && keysPressed.contains(LogicalKeyboardKey.space)) {
      _player.isArgh = true;
    } else {
      _player.isArgh = false;
    }

    return super.onKeyEvent(event, keysPressed);
  }

  void onJoypadDirectionChanged(Direction direction) {
    _player.direction = direction;
  }
}
