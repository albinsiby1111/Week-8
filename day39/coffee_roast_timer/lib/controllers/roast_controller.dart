import 'dart:async';
import 'package:flutter/material.dart';

class RoastController extends ChangeNotifier {
  int seconds = 0;

  Timer? timer;

  String roastStage = "Green";

  Color roastColor = Colors.green;

  void startRoasting() {
    timer?.cancel();

    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (seconds < 50) {
        seconds++;
        updateRoastStage();
      } else {
        timer.cancel();
      }
    });
  }

  void updateRoastStage() {
    if (seconds <= 20) {
      roastStage = "Green";
      roastColor = Colors.green;
    } else if (seconds <= 30) {
      roastStage = "Light Brown";
      roastColor = Colors.brown.shade300;
    } else if (seconds <= 40) {
      roastStage = "Brown";
      roastColor = Colors.brown;
    } else {
      roastStage = "Dark Brown";
      roastColor = Colors.brown.shade900;
    }

    notifyListeners();
  }

  void forward() {
    if (seconds < 50) {
      seconds += 10;

      if (seconds > 50) {
        seconds = 50;
      }

      updateRoastStage();
    }
  }

  void back() {
    if (seconds > 0) {
      seconds -= 10;

      if (seconds < 0) {
        seconds = 0;
      }

      updateRoastStage();
    }
  }

  void reset() {
    timer?.cancel();

    seconds = 0;

    roastStage = "Green";

    roastColor = Colors.green;

    notifyListeners();
  }
}