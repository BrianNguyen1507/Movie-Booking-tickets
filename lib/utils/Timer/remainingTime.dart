import 'dart:async';
import 'package:flutter/material.dart';

class RemainingTimeManager {
  int get remainingTimeInSeconds => _secondsRemaining;
  late Timer _timer;
  late int _secondsRemaining;
  final BuildContext context;
  final Function onTimerEnd;

  late StreamController<int> _remainingTimeController;
  Stream<int> get remainingTimeStream => _remainingTimeController.stream;

  RemainingTimeManager({
    required this.context,
    required int setMinutes,
    required int setSeconds,
    required this.onTimerEnd,
  }) {
    _secondsRemaining = setMinutes * 60 + setSeconds;
    _remainingTimeController = StreamController<int>();
    _remainingTimeController.add(_secondsRemaining);
    _startTimer();
  }

  void _startTimer() {
    const oneSecond = Duration(seconds: 1);
    _timer = Timer.periodic(oneSecond, (Timer timer) {
      if (_secondsRemaining == 0) {
        timer.cancel();
        onTimerEnd();
      } else {
        _secondsRemaining--;
        _remainingTimeController.add(_secondsRemaining);
      }
    });
  }

  void stopTimer() {
    _timer.cancel();
    _remainingTimeController.close();
  }

  static Text? displayTimer(dynamic snapshot) {
    if (snapshot.hasData) {
      int minutes = snapshot.data! ~/ 60;
      int seconds = snapshot.data! % 60;
      String minutesStr = (minutes < 10 ? '0' : '') + minutes.toString();
      String secondsStr = (seconds < 10 ? '0' : '') + seconds.toString();
      return Text(
        '$minutesStr:$secondsStr',
        style: const TextStyle(
            color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 17.0),
      );
    } else {
      return null;
    }
  }
}
