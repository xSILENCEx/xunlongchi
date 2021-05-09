import 'package:flutter/material.dart';
import 'package:xunlongchi/util/app_util.dart';

import 'package:xunlongchi/util/data_util.dart';
import 'package:xunlongchi/widgets/animated_scale.dart';

import 'calibration/draw_cali.dart';

///器官
class Organ extends StatefulWidget {
  const Organ({Key? key}) : super(key: key);

  @override
  _OrganState createState() => _OrganState();
}

class _OrganState extends State<Organ> {
  bool _ready = false;

  @override
  void initState() {
    super.initState();

    () async {
      await Future<void>.delayed(const Duration(milliseconds: 800), () {
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
        scale: _ready ? 1 : 1.3,
        duration: const Duration(milliseconds: 500),
        child: const OrganBody(),
      ),
    );
  }
}

class OrganBody extends StatelessWidget {
  const OrganBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 0.65,
      child: CustomPaint(
        size: Size.infinite,
        painter: DrawCali(
          style: TextStyle(color: Colors.white, fontSize: 12.sp(context, scale: 0.038)),
          caliList: DataUtil.organ,
        ),
      ),
    );
  }
}
