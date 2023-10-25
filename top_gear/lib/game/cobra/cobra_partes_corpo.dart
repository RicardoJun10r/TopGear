import 'dart:collection';

import 'package:mario_game/game/widgets/cell.dart';

class CobraParteCorpo extends LinkedListEntry<CobraParteCorpo> {
  Cell cell;

  CobraParteCorpo(this.cell);

  factory CobraParteCorpo.fromCell(Cell cell) {
    cell.cellType = CellType.snakeBody;
    return CobraParteCorpo(cell);
  }
}
