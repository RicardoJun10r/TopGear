import 'dart:ui';

import 'package:flame/game.dart';
import 'package:mario_game/game/config/configuracoes.dart';
import 'package:mario_game/game/config/styles.dart';

class CorpoCobra {
  static void render(Canvas canvas, Vector2 location, int cellSize) {
    canvas.drawRect(
        Rect.fromPoints(
            findStart(location, cellSize), findEnd(location, cellSize)),
        Styles.snakeBody);
  }

  static Offset findStart(Vector2 location, int cellSize) {
    return Offset(location.x + Configuracoes.snakeLineThickness / 2,
        location.y + Configuracoes.snakeLineThickness / 2);
  }

  static Offset findEnd(Vector2 location, int cellSize) {
    return Offset(location.x + cellSize - Configuracoes.snakeLineThickness / 2,
        location.y + cellSize - Configuracoes.snakeLineThickness / 2);
  }
}
