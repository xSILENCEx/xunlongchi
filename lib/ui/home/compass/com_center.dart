import 'package:flutter/material.dart';
import 'package:xunlongchi/ui/home/bagua.dart';
import 'package:xunlongchi/ui/home/position.dart';
import 'package:xunlongchi/widgets/animated_scale.dart';

///指南针内容
class ComCenter extends StatefulWidget {
  const ComCenter({Key? key}) : super(key: key);

  @override
  _ComCenterState createState() => _ComCenterState();
}

class _ComCenterState extends State<ComCenter> {
  bool _ready = false;

  @override
  void setState(Function() fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  void initState() {
    super.initState();

    () async {
      await Future<void>.delayed(const Duration(milliseconds: 500), () {
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
        scale: _ready ? 1 : 1.5,
        duration: const Duration(milliseconds: 500),
        child: const CBody(),
      ),
    );
  }
}

///中心控件
class CBody extends StatelessWidget {
  const CBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: const <Widget>[BaGua(), Position()],
    );
  }
}
