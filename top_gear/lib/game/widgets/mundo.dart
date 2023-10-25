import 'package:flame/components.dart';
import 'package:flame/input.dart';
import 'package:flame/extensions.dart';
import 'package:mario_game/game/cobra/cobra.dart';
import 'package:mario_game/game/cobra/comandos.dart';
import 'package:mario_game/game/cobra/grid.dart';
import 'package:mario_game/game/cobrinha.dart';
import 'package:mario_game/game/config/configuracoes.dart';
import 'package:mario_game/game/config/styles.dart';
import 'package:mario_game/game/widgets/cell.dart';

class Mundo extends FpsComponent with HasGameRef<Cobrinha> {
  final Grid _grid;
  final Cobra _snake = Cobra();
  final Comandos _commandQueue = Comandos();

  bool gameOver = false;

  Mundo(this._grid) : super() {
    _initializeSnake();
  }

  @override
  void updateDynamic(double dt) {
    if (!gameOver) {
      _commandQueue.evaluateNextInput(_snake);

      var nextCell = _getNextCell();

      if (nextCell != Grid.border) {
        if (_snake.checkCrash(nextCell)) {
          gameOver = true;
        } else {
          if (nextCell.cellType == CellType.food) {
            _snake.grow(nextCell);
            _grid.generateFood();
          } else {
            _snake.move(nextCell);
          }
        }
      } else {
        gameOver = true;
      }
    }
  }

  @override
  void render(Canvas canvas) {
    if (gameOver) {
      canvas.drawRect(
          Rect.fromLTRB(
              2, 2, gameRef.canvasSize.x - 2, gameRef.canvasSize.y - 2),
          Styles.gameOver);
    }
  }

  void onTapUp(TapUpInfo info) {
    final touchPoint = info.eventPosition.game;
    _commandQueue.add(touchPoint);
  }

  void _initializeSnake() {
    var headIndex = Configuracoes.headIndex;
    var snakeLength = Configuracoes.initialSnakeLength;

    for (int i = 0; i < snakeLength; i++) {
      var snakePart =
          _grid.findCell(headIndex.x.toInt() - i, headIndex.y.toInt());
      _snake.addCell(snakePart);
      if (i == 0) {
        _snake.setHead(snakePart);
      }
    }
  }

  //TODO use vector addition instead of a switch
  Cell _getNextCell() {
    var row = _snake.head.row;
    var column = _snake.head.column;

    switch (_snake.direction) {
      case Direction.up:
        row--;
        break;
      case Direction.right:
        column++;
        break;
      case Direction.down:
        row++;
        break;
      case Direction.left:
        column--;
        break;
    }
    return _grid.findCell(column, row);
  }
}
