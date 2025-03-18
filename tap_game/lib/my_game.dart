import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:tap_game/components/player.dart';

class MyGame extends FlameGame {
  late Player player;
  late JoystickComponent joystick;

  @override
  FutureOr<void> onLoad() async {
    await Flame.device.fullScreen();
    await Flame.device.setPortrait();

    startGamer();

    return super.onLoad();
  }

  void startGamer() async {
    await _createJoystick();
    _createPlayer();
  }

  void _createPlayer() {
    player =
        Player()
          ..anchor = Anchor.center
          ..position = Vector2(size.x / 2, size.y * 0.8);
    add(player);
  }

  Future<void> _createJoystick() async {
    joystick = JoystickComponent(
      knob: SpriteComponent(
        sprite: await loadSprite('joystick_knob.png'),
        size: Vector2.all(50),
      ),
      background: SpriteComponent(
        sprite: await loadSprite('joystick_background.png'),
        size: Vector2.all(100),
      ),
      anchor: Anchor.bottomLeft,
      position: Vector2(20, size.y - 20),
    );
    add(joystick);
  }
}
