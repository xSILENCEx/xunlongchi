import 'package:flutter/material.dart';
import 'package:xunlongchi/util/app_util.dart';
import 'package:xunlongchi/util/data_util.dart';
import 'package:xunlongchi/widgets/animated_scale.dart';

import 'calibration/draw_cali.dart';

///时辰
class Shichen extends StatefulWidget {
  const Shichen({Key? key}) : super(key: key);

  @override
  _ShichenState createState() => _ShichenState();
}

class _ShichenState extends State<Shichen> {
  bool _ready = false;

  @override
  void initState() {
    super.initState();

    () async {
      await Future<void>.delayed(const Duration(milliseconds: 1100), () {
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
        scale: _ready ? 1 : 1.2,
        duration: const Duration(milliseconds: 500),
        child: const ShichenBody(),
      ),
    );
  }
}

class ShichenBody extends StatelessWidget {
  const ShichenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 0.74,
      child: CustomPaint(
        size: Size.infinite,
        painter: DrawCali(
          style: TextStyle(
            color: Colors.amber,
            fontSize: 12.sp(context, scale: 0.04),
            fontWeight: FontWeight.bold,
          ),
          caliList: DataUtil.sc,
        ),
      ),
    );
  }
}
