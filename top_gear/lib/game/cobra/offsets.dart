import 'package:flame/game.dart';
import 'package:mario_game/game/config/configuracoes.dart';

class OffSets {
  Vector2 start = Vector2.zero();
  Vector2 end = Vector2.zero();

  OffSets(Vector2 canvasSize) {
    var gameAreaX = Configuracoes.cellSize * Configuracoes.columns;
    var gameAreaY = Configuracoes.cellSize * Configuracoes.rows;

    start =
        Vector2((canvasSize.x - gameAreaX) / 2, (canvasSize.y - gameAreaY) / 2);
    end = Vector2(canvasSize.x - start.x, canvasSize.y - start.y);
  }
}
