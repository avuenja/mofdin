import 'package:flame/components.dart';
import 'package:flame/sprite.dart';

import 'package:mofdin/enums.dart';

class Player extends SpriteAnimationComponent with HasGameRef {
  final double _playerSpeed = 126.0;
  final double _animationSpeed = 0.15;

  late final SpriteAnimation _runDownAnimation;
  late final SpriteAnimation _runUpAnimation;
  late final SpriteAnimation _runRightAnimation;
  late final SpriteAnimation _runLeftAnimation;
  late final SpriteAnimation _standingAnimation;

  Direction direction = Direction.none;

  Player() : super(size: Vector2.all(42));

  @override
  Future<void> onLoad() async {
    super.onLoad();

    _loadSpriteSheet().then((_) => {animation = _standingAnimation});
  }

  @override
  void update(double dt) {
    super.update(dt);

    movePlayer(dt);
  }

  Future<void> _loadSpriteSheet() async {
    final spriteSheet = SpriteSheet(
      image: await gameRef.images.load('players/naruto.png'),
      srcSize: Vector2(41.0, 41.0),
    );

    _runDownAnimation =
        spriteSheet.createAnimation(row: 0, stepTime: _animationSpeed, to: 3);
    _runLeftAnimation =
        spriteSheet.createAnimation(row: 1, stepTime: _animationSpeed, to: 3);
    _runUpAnimation =
        spriteSheet.createAnimation(row: 2, stepTime: _animationSpeed, to: 3);
    _runRightAnimation =
        spriteSheet.createAnimation(row: 3, stepTime: _animationSpeed, to: 3);
    _standingAnimation =
        spriteSheet.createAnimation(row: 0, stepTime: _animationSpeed, to: 1);
  }

  void movePlayer(double dt) {
    switch (direction) {
      case Direction.up:
        animation = _runUpAnimation;
        position.add(Vector2(0, dt * -_playerSpeed));
        break;
      case Direction.down:
        animation = _runDownAnimation;
        position.add(Vector2(0, dt * _playerSpeed));
        break;
      case Direction.left:
        animation = _runLeftAnimation;
        position.add(Vector2(dt * -_playerSpeed, 0));
        break;
      case Direction.right:
        animation = _runRightAnimation;
        position.add(Vector2(dt * _playerSpeed, 0));
        break;
      case Direction.none:
        animation = _standingAnimation;
        break;
    }
  }
}
