import 'package:flutter/material.dart';

class AnimatedRotation extends ImplicitlyAnimatedWidget {
  const AnimatedRotation({
    Key? key,
    required this.child,
    required this.turn,
    Curve curve = Curves.ease,
    required Duration duration,
    VoidCallback? onEnd,
    this.alignment = Alignment.center,
  }) : super(key: key, curve: curve, duration: duration, onEnd: onEnd);

  ///缩放倍率
  final double turn;

  ///子控件
  final Widget child;

  ///对齐方式
  final Alignment alignment;

  @override
  ImplicitlyAnimatedWidgetState<ImplicitlyAnimatedWidget> createState() => _AnimatedRotationState();
}

class _AnimatedRotationState extends ImplicitlyAnimatedWidgetState<AnimatedRotation> {
  Tween<double>? _turn;
  late Animation<double>? _rotationAnimation;

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    _turn = visitor(_turn, widget.turn, (dynamic value) => Tween<double>(begin: value as double)) as Tween<double>?;
  }

  @override
  void didUpdateTweens() {
    _rotationAnimation = animation.drive(_turn!);
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _rotationAnimation!,
      child: widget.child,
      alignment: widget.alignment,
    );
  }
}
