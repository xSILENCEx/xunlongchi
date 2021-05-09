import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';

///工具类
class XL {
  ///滚动物理封装
  static const BouncingScrollPhysics LcPhysics = BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics());

  ///隐藏状态栏
  static void hideStatusBar() {
    SystemChrome.setEnabledSystemUIOverlays(<SystemUiOverlay>[]);
  }

  ///显示状态栏
  static void showStatusBar({bool dark = true}) {
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    SystemChrome.setSystemUIOverlayStyle(dark ? SystemUiOverlayStyle.dark : SystemUiOverlayStyle.light);
  }

  ///权限检查与请求
  static Future<bool> checkPermission(Permission permission) async {
    try {
      final PermissionStatus _status = await permission.status;
      bool _state = false;

      if (_status.isGranted) {
        return true;
      } else {
        await permission.request().then(
          (PermissionStatus s) async {
            if (s == PermissionStatus.granted) {
              _state = true;
            } else {
              await openAppSettings().then(
                (bool b) {
                  if (b) {
                    _state = true;
                  }
                },
              );
            }
          },
        );
      }

      return _state;
    } catch (e) {
      return true;
    }
  }
}

///扩展`int`类型
extension IntFit on int {
  double px(BuildContext context, {double scale = 0.01}) {
    return _min(context) * scale;
  }

  double sp(BuildContext context, {double scale = 0.01}) {
    return _min(context) * scale;
  }

  double _min(BuildContext context) {
    final Size _s = MediaQuery.of(context).size;
    return min(_s.width, _s.height);
  }
}

///扩展`double`类型
extension DoubleFit on double {
  double px(BuildContext context, {double scale = 0.01}) {
    return _min(context) * scale;
  }

  double sp(BuildContext context, {double scale = 0.01}) {
    return _min(context) * scale;
  }

  double _min(BuildContext context) {
    final Size _s = MediaQuery.of(context).size;
    return min(_s.width, _s.height);
  }
}
