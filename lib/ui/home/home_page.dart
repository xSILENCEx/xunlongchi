import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xunlongchi/mod/time_mod.dart';
import 'package:xunlongchi/widgets/round_widget.dart';

import 'center_taiji.dart';
import 'compass/compass.dart';
import 'organ.dart';
import 'point_line.dart';
import 'round_hour.dart';
import 'round_sed.dart';
import 'shichen.dart';

///首页
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: <Widget>[
          //指针
          const PointLine(),

          Center(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: AspectRatio(
                aspectRatio: 1,
                child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    //罗盘
                    const Compass(),

                    //中心太极图标
                    Selector<TimeMod, int>(
                      builder: (_, int hour, __) => _buildTj(hour % 12),
                      selector: (_, TimeMod tm) => tm.now.hour % 12,
                    ),

                    //时辰
                    Selector<TimeMod, int>(
                      builder: (_, int hour, __) => _buildShi((hour + 1) ~/ 2),
                      selector: (_, TimeMod tm) => tm.now.hour,
                    ),

                    //小时
                    Selector<TimeMod, int>(
                      builder: (_, int hour, __) => _buildHour(hour),
                      selector: (_, TimeMod tm) => tm.now.hour,
                    ),

                    //分
                    Transform.scale(
                      scale: 0.92,
                      child: Selector<TimeMod, int>(
                        builder: (_, int minute, __) => _buildSed(minute),
                        selector: (_, TimeMod tm) => tm.now.minute,
                      ),
                    ),

                    //秒
                    Selector<TimeMod, int>(
                      builder: (_, int second, __) => _buildSed(second),
                      selector: (_, TimeMod tm) => tm.now.second,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  ///构建阴阳
  Widget _buildTj(int time) {
    return RoundWidget(
      total: 2,
      init: time,
      current: time,
      duration: 800,
      child: const CenterTaiji(),
    );
  }

  ///构建分秒
  Widget _buildSed(int time) {
    return RoundWidget(
      total: 60,
      current: time,
      init: time,
      child: const RoundSed(),
    );
  }

  ///构建时
  Widget _buildHour(int time) {
    return RoundWidget(
      total: 24,
      current: time,
      init: time,
      child: const RoundHour(),
    );
  }

  ///构建时辰
  Widget _buildShi(int time) {
    return RoundWidget(
      total: 12,
      init: time,
      current: time,
      child: Stack(
        alignment: Alignment.center,
        children: const <Widget>[Shichen(), Organ()],
      ),
    );
  }
}
