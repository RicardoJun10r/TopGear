import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:top_gear/game.dart';

class Car extends SpriteAnimationComponent
    with
        KeyboardHandler,
        HasGameRef<TopGear>,
        HasCollisionDetection,
        CollisionCallbacks {}
