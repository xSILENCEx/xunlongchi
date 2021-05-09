import 'dart:io';

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'package:xunlongchi/ui/home/compass/com_center.dart';

import 'package:xunlongchi/widgets/animated_roate.dart';

///罗盘
class Compass extends StatelessWidget {
  const Compass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildCompass();
  }

  Widget _buildCompass() {
    if (kIsWeb) {
      return const ComCenter();
    }

    if (Platform.isAndroid || Platform.isIOS) {
      return StreamBuilder<CompassEvent>(
        stream: FlutterCompass.events,
        builder: (_, AsyncSnapshot<CompassEvent> snapshot) {
          if (snapshot.hasError) {
            return const ComCenter();
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const ComCenter();
          }

          final double? direction = snapshot.data!.heading;

          if (direction == null) {
            return const ComCenter();
          }

          return AnimatedRotation(
            duration: const Duration(milliseconds: 200),
            turn: 1 - (direction / 360),
            child: const ComCenter(),
          );
        },
      );
    }

    return const ComCenter();
  }
}
