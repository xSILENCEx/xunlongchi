import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:xunlongchi/util/app_util.dart';

import 'calibration/draw_cali.dart';

///构建分秒
class RoundSed extends StatefulWidget {
  const RoundSed({Key? key}) : super(key: key);

  @override
  _RoundSedState createState() => _RoundSedState();
}

class _RoundSedState extends State<RoundSed> {
  bool _ready = false;

  @override
  void initState() {
    super.initState();
    Future<void>.delayed(const Duration(milliseconds: 1600), () {
      setState(() {
        _ready = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: _ready ? 1 : 0,
      duration: const Duration(milliseconds: 500),
      child: const _SedBody(),
    );
  }
}

class _SedBody extends StatelessWidget {
  const _SedBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size.infinite,
      painter: DrawCali(
        style: TextStyle(
          color: Colors.deepPurple,
          fontWeight: FontWeight.bold,
          fontSize: 10.sp(context, scale: 0.026),
          fontFamily: kIsWeb ? null : 'OS',
        ),
        caliList: List<String>.generate(60, (int i) => i.toString()),
      ),
    );
  }
}
