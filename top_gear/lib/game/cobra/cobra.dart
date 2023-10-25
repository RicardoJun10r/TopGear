import 'dart:collection';

import 'package:flame/game.dart';
import 'package:mario_game/game/cobra/cobra_partes_corpo.dart';
import 'package:mario_game/game/widgets/cell.dart';

enum Direction { up, right, down, left }

class Cobra {
  final LinkedList<CobraParteCorpo> snakeBody = LinkedList();

  Direction direction = Direction.right;
  Cell head = Cell.zero;

  void move(Cell nextCell) {
    _removeLast();
    head = nextCell;
    _addFirst(head);
  }

  void grow(Cell nextCell) {
    head = nextCell;
    _addFirst(head);
  }

  bool checkCrash(Cell nextCell) {
    for (var part in snakeBody) {
      if (part.cell == nextCell) {
        return true;
      }
    }

    return false;
  }

  void setHead(Cell cell) {
    head = cell;
  }

  bool isHorizontal() {
    return direction == Direction.left || direction == Direction.right;
  }

  Vector2 displacementToHead(Vector2 reference) {
    return reference - head.location;
  }

  void addCell(Cell cell) {
    _add(CobraParteCorpo.fromCell(cell));
  }

  void _add(CobraParteCorpo part) {
    snakeBody.add(part);
  }

  void _addFirst(Cell cell) {
    snakeBody.addFirst(CobraParteCorpo.fromCell(cell));
  }

  void _removeLast() {
    snakeBody.last.cell.cellType = CellType.empty;
    snakeBody.remove(snakeBody.last);
  }
}
