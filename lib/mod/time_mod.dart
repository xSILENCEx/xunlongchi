import 'dart:async';

import 'package:flutter/foundation.dart';

class TimeMod extends ChangeNotifier {
  TimeMod() {
    start();
  }

  ///计时器
  Timer? _timer;

  ///当前时间
  DateTime now = DateTime.now();

  ///对象是否存在
  bool _mounted = true;

  ///开始捕捉系统时间
  void start() {
    now = DateTime.now();
    _timer = Timer.periodic(const Duration(milliseconds: 50), (_) {
      now = DateTime.now();
      notifyListeners();
    });
  }

  ///停止计时
  void _stop() {
    _mounted = false;
    _timer!.cancel();
    _timer = null;
  }

  @override
  void notifyListeners() {
    if (_mounted) {
      super.notifyListeners();
    }
  }

  @override
  void dispose() {
    _stop();
    super.dispose();
  }
}
