import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:mario_game/game/cobra/grid.dart';
import 'package:mario_game/game/cobra/offsets.dart';
import 'package:mario_game/game/config/configuracoes.dart';
import 'package:mario_game/game/widgets/background.dart';
import 'package:mario_game/game/widgets/mundo.dart';

class Cobrinha extends FlameGame with TapDetector {
  Grid grid =
      Grid(Configuracoes.rows, Configuracoes.columns, Configuracoes.cellSize);
  Mundo? mundo;
  OffSets offSets = OffSets(Vector2.zero());

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    offSets = OffSets(canvasSize);

    add(Background(Configuracoes.cellSize));

    // ignore: avoid_function_literals_in_foreach_calls
    grid.cells.forEach((rows) => rows.forEach((cell) => add(cell)));
    grid.generateFood();

    mundo = Mundo(grid);
    add(mundo!);
  }

  @override
  void onTapUp(TapUpInfo info) {
    mundo!.onTapUp(info);
  }
}
