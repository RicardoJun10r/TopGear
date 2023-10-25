import 'package:flame/game.dart';
import 'package:mario_game/game/cobra/cobra.dart';

class Comandos {
  final List<Vector2> touches = [];

  add(Vector2 touchPoint) {
    if (touches.length != 3) {
      touches.add(touchPoint);
    }
  }

  void evaluateNextInput(Cobra snake) {
    if (touches.isNotEmpty) {
      var touchPoint = touches[0];
      touches.remove(touchPoint);

      var delta = snake.displacementToHead(touchPoint);

      snake.direction = snake.isHorizontal()
          ? delta.y < 0
              ? Direction.up
              : Direction.down
          : delta.x < 0
              ? Direction.left
              : Direction.right;
    }
  }
}
