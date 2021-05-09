import 'package:flutter/material.dart';

///官方没有提供Scale的无状态动画控件
///在原生的AnimatedWidget中不包含缩放动画控件
///阅读源码后通过继承ImplicitlyAnimatedWidget定义动画缩放控件
///使用无状态的控件能提升APP性能，减少状态混乱
class AnimatedScale extends ImplicitlyAnimatedWidget {
  const AnimatedScale({
    Key? key,
    required this.child,
    required this.scale,
    Curve curve = Curves.ease,
    required Duration duration,
    VoidCallback? onEnd,
    this.alignment = Alignment.center,
  })  : assert(scale >= 0.0),
        super(key: key, curve: curve, duration: duration, onEnd: onEnd);

  ///缩放倍率
  final double scale;

  ///子控件
  final Widget child;

  ///对齐方式
  final Alignment alignment;

  @override
  ImplicitlyAnimatedWidgetState<ImplicitlyAnimatedWidget> createState() => _AnimatedScaleState();
}

class _AnimatedScaleState extends ImplicitlyAnimatedWidgetState<AnimatedScale> {
  Tween<double>? _scale;
  late Animation<double>? _scaleAnimation;

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    _scale = visitor(_scale, widget.scale, (dynamic value) => Tween<double>(begin: value as double)) as Tween<double>?;
  }

  @override
  void didUpdateTweens() {
    _scaleAnimation = animation.drive(_scale!);
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _scaleAnimation!,
      child: widget.child,
      alignment: widget.alignment,
    );
  }
}
