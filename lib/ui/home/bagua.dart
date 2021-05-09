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
        .map((int i) => RotationTransition(
              turns: AlwaysStoppedAnimation<double>(-45 * i / 360 - 0.5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const SizedBox.shrink(),
                  RotationTransition(
                    turns: const AlwaysStoppedAnimation<double>(90 / 360),
                    child: SizedBox(
                      width: 80.px(context, scale: 0.2),
                      height: 80.px(context, scale: 0.2),
                      child: Icon(_position[i]),
                    ),
                  ),
                ],
              ),
            ))
        .toList();

    return IconTheme(
      data: IconThemeData(color: Colors.white, size: 80.px(context, scale: 0.12)),
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
