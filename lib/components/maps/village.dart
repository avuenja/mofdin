import 'package:flame/components.dart';

class VillageMap extends SpriteComponent with HasGameRef {
  @override
  Future<void>? onLoad() async {
    sprite = await gameRef.loadSprite('maps/konoha-village.gif');
    size = sprite!.originalSize;

    return super.onLoad();
  }
}
