import 'dart:ui';

import 'package:flame/game.dart';
import 'package:flutter/material.dart';

import 'package:mofdin/components/maps/village.dart';
import 'package:mofdin/components/player.dart';
import 'package:mofdin/enums.dart';

class GameController extends FlameGame {
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

  void onJoypadDirectionChanged(Direction direction) {
    _player.direction = direction;
  }
}
