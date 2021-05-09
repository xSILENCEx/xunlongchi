import 'package:flutter/material.dart';
import 'package:xunlongchi/util/app_util.dart';
import 'package:xunlongchi/widgets/xl_icons.dart';

///太极图标
class Taiji extends StatelessWidget {
  const Taiji({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.px(context, scale: 0.04)),
      child: Icon(
        XLIcons.taiji,
        size: 120.px(context, scale: 0.4),
        color: Colors.white,
      ),
    );
  }
}
