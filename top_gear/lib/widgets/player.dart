import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/sprite.dart';
import 'package:top_gear/game.dart';
import 'package:top_gear/widgets/car.dart';

class Player extends SpriteAnimationComponent
    with
        KeyboardHandler,
        HasGameRef<TopGear>,
        HasCollisionDetection,
        CollisionCallbacks {
  double xv = 0;
  late SpriteSheet carSpriteSheet, hitSpriteSheet;
  late SpriteAnimation carAnimation, hitAnimation;

  bool gameOver = false;

  @override
  FutureOr<void> onLoad() async {
    // TODO: implement onLoad
    position = gameRef.size / 2;
    size = Vector2(64.0, 64.0);
    anchor = Anchor.bottomCenter;
    carSpriteSheet = SpriteSheet(
        image: await gameRef.images.load(''), srcSize: Vector2.all(32.0));
    carAnimation = carSpriteSheet.createAnimation(
        row: 0, stepTime: 0.2, from: 0, to: 6, loop: true);

    animation = carAnimation;

    return super.onLoad();
  }

  @override
  void onCollision(Set<Vector2> points, PositionComponent other) {
    // TODO: implement onCollision
    if (other is Car) {
      removeFromParent();
    }
    super.onCollision(points, other);
  }
}
