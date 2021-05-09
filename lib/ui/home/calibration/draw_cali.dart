import 'dart:math';

import 'package:flutter/material.dart';

///绘制刻度
class DrawCali extends CustomPainter {
  DrawCali({
    required this.style,
    required this.caliList,
  });

  ///字体大小
  final TextStyle style;

  ///刻度内容
  final List<String> caliList;

  @override
  void paint(Canvas canvas, Size size) {
    final double _w = size.shortestSide;

    ///准备画笔
    final Paint _paint = Paint();
    _paint.color = Colors.deepPurple;

    final TextPainter _textPainter = TextPainter(
      textDirection: TextDirection.rtl,
      textAlign: TextAlign.center,
    );

    final double _angle = 2 * pi / caliList.length;

    for (int i = 0; i < caliList.length; i++) {
      canvas.save();

      canvas.translate(_w / 2, _w / 2);
      canvas.rotate(-i * _angle);

      _textPainter.text = TextSpan(text: caliList[i], style: style);
      _textPainter.layout();
      final Size _fontSize = _textPainter.size;
      _textPainter.paint(canvas, Offset(-_fontSize.width / 2, -_w / 2));

      canvas.restore();
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
