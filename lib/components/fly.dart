import 'dart:ui';
import 'package:flutter_game_langaw/langaw-game.dart';

class Fly {
  Rect flyRect;
  final LangawGame game;
  Paint flyPaint;
  bool isDead = false;
  bool isOffScreen = false;

  Fly(this.game, double x, double y) {
    flyRect = Rect.fromLTWH(x, y, game.tileSize, game.tileSize);
    flyPaint = Paint();
    flyPaint.color = Color(0xff6ab04c);
  }

  void onTapDown() {
    flyPaint.color = Color(0xffff4757);
    isDead = true;
    game.spawnFly();
  }

  void render(Canvas c) {
    c.drawRect(flyRect, flyPaint);
  }

  void update(double t) {
    if (isDead) {
      flyRect = flyRect.translate(0, game.tileSize * 12 * t);
      if (flyRect.top > game.screenSize.height) {
        isOffScreen = true;
      }
    }
  }
}
