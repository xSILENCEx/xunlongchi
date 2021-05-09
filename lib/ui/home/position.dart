import 'package:flutter/material.dart';
import 'package:xunlongchi/util/app_util.dart';

import 'package:xunlongchi/util/data_util.dart';

import 'calibration/draw_cali.dart';

///方位
class Position extends StatelessWidget {
  const Position({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 0.5,
      child: CustomPaint(
        size: Size.infinite,
        painter: DrawCali(
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12.sp(context, scale: 0.06)),
          caliList: DataUtil.dir,
        ),
      ),
    );
  }
}
