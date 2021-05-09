import 'package:flutter/material.dart';
import 'package:xunlongchi/widgets/animated_scale.dart';
import 'package:xunlongchi/widgets/taiji.dart';

///中间的太极图标
class CenterTaiji extends StatefulWidget {
  const CenterTaiji({Key? key}) : super(key: key);

  @override
  _CenterTaijiState createState() => _CenterTaijiState();
}

class _CenterTaijiState extends State<CenterTaiji> {
  double _scale = 1;

  @override
  void initState() {
    super.initState();
    Future<void>.delayed(const Duration(milliseconds: 300), () {
      setState(() {
        _scale = 0.3;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      scale: _scale,
      duration: const Duration(milliseconds: 500),
      child: const Taiji(),
    );
  }
}
