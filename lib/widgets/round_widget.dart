import 'dart:math' as math;

import 'package:flutter/material.dart';

///旋转控件
class RoundWidget extends StatefulWidget {
  const RoundWidget({
    Key? key,
    required this.child,
    required this.total,
    required this.current,
    this.init = 0,
    this.duration = 500,
  }) : super(key: key);

  final Widget child;

  final int total;
  final int current;

  final int init;

  final int duration;

  @override
  _RoundWidgetState createState() => _RoundWidgetState();
}

class _RoundWidgetState extends State<RoundWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: Duration(milliseconds: widget.duration), vsync: this);
    _controller.value = widget.init / widget.total;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant RoundWidget oldWidget) {
    _run(oldWidget);
    super.didUpdateWidget(oldWidget);
  }

  Future<void> _run(covariant RoundWidget oldWidget) async {
    if (oldWidget.current != widget.current) {
      if (oldWidget.current == widget.total - 1) {
        await _controller.animateTo(
          (widget.total + 1) / widget.total,
          duration: Duration(milliseconds: widget.duration),
          curve: Curves.ease,
        );

        _controller.value = 0.0;
      } else {
        await _controller.animateTo(
          widget.current / widget.total,
          duration: Duration(milliseconds: widget.duration),
          curve: Curves.ease,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      child: widget.child,
      builder: (_, Widget? child) => Transform.rotate(
        angle: 2 * math.pi * _controller.value,
        child: child,
      ),
    );
  }
}
