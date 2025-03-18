import 'dart:async';

import 'package:flame/components.dart';
import 'package:tap_game/my_game.dart';

class Player extends SpriteComponent with HasGameReference<MyGame> {
  @override
  FutureOr<void> onLoad() async {
    sprite = await game.loadSprite('personagem.png');

    size *= 0.3;

    return super.onLoad();
  }

  @override
  void update(double dt) {
    super.update(dt);

    position += game.joystick.relativeDelta.normalized() * 200 * dt;
  }
}
