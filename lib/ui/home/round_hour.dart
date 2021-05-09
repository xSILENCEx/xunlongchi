import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:xunlongchi/util/app_util.dart';

import 'package:xunlongchi/widgets/animated_scale.dart';

import 'calibration/draw_cali.dart';

///构建国际小时
class RoundHour extends StatefulWidget {
  const RoundHour({Key? key}) : super(key: key);

  @override
  _RoundHourState createState() => _RoundHourState();
}

class _RoundHourState extends State<RoundHour> {
  bool _ready = false;

  @override
  void initState() {
    super.initState();

    () async {
      await Future<void>.delayed(const Duration(milliseconds: 1400), () {
        setState(() {
          _ready = true;
        });
      });
    }();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: _ready ? 1 : 0,
      duration: const Duration(milliseconds: 500),
      child: AnimatedScale(
        scale: _ready ? 1 : 1.1,
        duration: const Duration(milliseconds: 500),
        child: const HourBody(),
      ),
    );
  }
}

///小时体
class HourBody extends StatelessWidget {
  const HourBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 0.85,
      child: CustomPaint(
        size: Size.infinite,
        painter: DrawCali(
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 12.sp(context, scale: 0.04),
            fontFamily: kIsWeb ? null : 'OS',
          ),
          caliList: List<String>.generate(24, (int i) => i.toString()),
        ),
      ),
    );
  }
}
