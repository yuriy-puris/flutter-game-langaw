import 'dart:ui';
import 'package:flame/game.dart';
import 'package:flame/flame.dart';
import 'dart:math';
import 'package:flutter/gestures.dart';

import 'package:flutter_game_langaw/components/fly.dart';
import 'package:flutter_game_langaw/components/house-fly.dart';
import 'package:flutter_game_langaw/components/agile-fly.dart';
import 'package:flutter_game_langaw/components/drooler-fly.dart';
import 'package:flutter_game_langaw/components/hungry-fly.dart';
import 'package:flutter_game_langaw/components/macho-fly.dart';
import 'package:flutter_game_langaw/components/backyard.dart';

class LangawGame extends Game {
  Size screenSize;
  double tileSize;
  List<Fly> flies;
  Random rnd;
  Backyard background;

  LangawGame() {
    initialize();
  }

  void initialize() async {
    flies = List<Fly>();
    rnd = Random();
    resize(await Flame.util.initialDimensions());

    background = Backyard(this);

    spawnFly();
  }

  void spawnFly() {
    double x = rnd.nextDouble() * (screenSize.width - (tileSize * 2.025));
    double y = rnd.nextDouble() * (screenSize.height - (tileSize * 2.025));
    switch (rnd.nextInt(5)) {
      case 0:
        flies.add(HouseFly(this, x, y));
        break;
      case 1:
        flies.add(DroolerFly(this, x, y));
        break;
      case 2:
        flies.add(HungryFly(this, x, y));
        break;
      case 3:
        flies.add(AgileFly(this, x, y));
        break;
      case 4:
        flies.add(MachoFly(this, x, y));
        break;
    }
  }

  void onTapDown(TapDownDetails t) {
    flies.forEach((Fly fly) {
      if (fly.flyRect.contains(t.globalPosition)) {
        fly.onTapDown();
      }
    });
  }

  void render(Canvas canvas) {
    background.render(canvas);

    flies.forEach((Fly fly) => fly.render(canvas));
  }

  void update(double t) {
    flies.forEach((Fly fly) => fly.update(t));
    flies.removeWhere((Fly fly) => fly.isOffScreen);
  }

  void resize(Size size) {
    screenSize = size;
    tileSize = screenSize.width / 9;
  }
}
