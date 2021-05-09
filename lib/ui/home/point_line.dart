import 'package:flutter/material.dart';
import 'package:xunlongchi/util/app_util.dart';

///指针
class PointLine extends StatefulWidget {
  const PointLine({Key? key}) : super(key: key);

  @override
  _PointLineState createState() => _PointLineState();
}

class _PointLineState extends State<PointLine> {
  bool _ready = false;

  @override
  void initState() {
    super.initState();

    () async {
      await Future<void>.delayed(const Duration(milliseconds: 1600), () {
        setState(() {
          _ready = true;
        });
      });
    }();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        width: 1,
        height: _ready ? MediaQuery.of(context).size.height / 2 - 1.px(context, scale: 0.4) : 0,
        color: Colors.red,
      ),
    );
  }
}
