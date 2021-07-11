import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:xunlongchi/ui/home/home_page.dart';
import 'package:xunlongchi/util/app_util.dart';
import 'package:xunlongchi/widgets/animated_scale.dart';
import 'package:xunlongchi/widgets/fade_route.dart';
import 'package:xunlongchi/widgets/taiji.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  ///是否旋转
  final ValueNotifier<double> _scale = ValueNotifier<double>(0);

  @override
  void initState() {
    super.initState();

    Future<void>.delayed(
        const Duration(seconds: 0), () async => await _ready());
  }

  ///准备
  Future<void> _ready() async {
    bool _permission = true;

    _scale.value = 1;

    ///请求定位权限
    _permission =
        _permission && await XL.checkPermission(Permission.locationWhenInUse);

    if (_permission) {
      Future<void>.delayed(const Duration(seconds: 1), () async {
        await Navigator.of(context).pushAndRemoveUntil(
            FadeRoute<void>(builder: (_) => const HomePage()), (_) => false);
      });
    } else {
      SystemNavigator.pop();
    }
  }

  @override
  void dispose() {
    _scale.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return Future<bool>.value(false);
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: ValueListenableBuilder<double>(
            valueListenable: _scale,
            child: const Taiji(),
            builder: (_, double s, Widget? child) {
              return AnimatedScale(
                scale: s,
                duration: const Duration(seconds: 1),
                child: child!,
              );
            },
          ),
        ),
      ),
    );
  }
}
