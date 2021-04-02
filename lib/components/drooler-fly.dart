import 'dart:ui';
import 'package:flame/sprite.dart';
import 'package:flutter_game_langaw/langaw-game.dart';
import 'package:flutter_game_langaw/components/fly.dart';

class DroolerFly extends Fly {
  double get speed => game.tileSize * 1.5;
  DroolerFly(LangawGame game, double x, double y) : super(game) {
    flyRect = Rect.fromLTWH(x, y, game.tileSize * 1.5, game.tileSize * 1.5);
    flyingSprite = List<Sprite>();
    flyingSprite.add(Sprite('flies/drooler-fly-1.png'));
    flyingSprite.add(Sprite('flies/drooler-fly-2.png'));
    deadSprite = Sprite('flies/drooler-fly-dead.png');
  }
}
