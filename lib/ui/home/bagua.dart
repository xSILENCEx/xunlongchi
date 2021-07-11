import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:xunlongchi/util/app_util.dart';
import 'package:xunlongchi/widgets/xl_icons.dart';

///八卦
class BaGua extends StatelessWidget {
  const BaGua({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ///八卦图标
    const List<IconData> _position = <IconData>[
      XLIcons.bagua5,
      XLIcons.bagua7,
      XLIcons.bagua3,
      XLIcons.bagua2,
      XLIcons.bagua6,
      XLIcons.bagua1,
      XLIcons.bagua4,
      XLIcons.bagua8,
    ];

    final List<Widget> _item = Iterable<int>.generate(8)
        .map(
          (int i) => Transform.rotate(
            angle: -0.25 * i * math.pi,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Transform.rotate(
                  angle: -0.5 * math.pi,
                  child: SizedBox(
                    width: 80.px(context, scale: 0.2),
                    height: 80.px(context, scale: 0.2),
                    child: Icon(_position[i]),
                  ),
                ),
              ],
            ),
          ),
        )
        .toList();

    return IconTheme(
      data:
          IconThemeData(color: Colors.white, size: 80.px(context, scale: 0.12)),
      child: Transform.scale(
        scale: 0.28,
        child: Stack(
          alignment: Alignment.center,
          children: _item,
        ),
      ),
    );
  }
}
