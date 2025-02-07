import 'package:flutter/material.dart';

import '../utils/logger.dart' show logger;
import '../utils/utilities.dart' show multiplyIfNotNull;

class TapBox extends StatelessWidget {
  final double? top;
  final double? left;
  final double? right;
  final double? bottom;

  final double? width;
  final double? height;

  final double factor;

  final Color color;

  final Color borderColor;
  final double borderWidth;
  final double borderRadius;

  final VoidCallback? onTap;
  final void Function(TapDownDetails)? onTapDown;

  final Widget? child;

  const TapBox({
    this.top,
    this.left,
    this.right,
    this.bottom,
    this.width,
    this.height,
    this.factor = 1,
    this.color = Colors.blue,
    this.borderColor = Colors.black,
    this.borderWidth = 3,
    this.borderRadius = 5,
    this.onTap,
    this.onTapDown,
    this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    logger.d('TapBox widget build');
    Widget tapBox = GestureDetector(
      onTap: onTap,
      onTapDown: onTapDown,
      child: Container(
        width: multiplyIfNotNull(width, factor),
        height: multiplyIfNotNull(height, factor),
        decoration: BoxDecoration(
          color: color,
          border: Border.all(
            color: borderColor,
            width: borderWidth * factor,
          ),
          borderRadius: BorderRadius.circular(borderRadius * factor),
        ),
        child: Center(
          child: child,
        ),
      ),
    );

    if (top != null || left != null || right != null || bottom != null) {
      return Positioned(
        top: multiplyIfNotNull(top, factor),
        left: multiplyIfNotNull(left, factor),
        right: multiplyIfNotNull(right, factor),
        bottom: multiplyIfNotNull(bottom, factor),
        child: tapBox,
      );
    }
    return tapBox;
  }
}

class TapEffectBox extends StatefulWidget {
  final double? top;
  final double? left;
  final double? right;
  final double? bottom;

  final double? width;
  final double? height;

  final double factor;

  final Color color;
  final Color? pressedColor;

  final Color borderColor;
  final double borderWidth;
  final double borderRadius;

  final VoidCallback? onTap;
  final void Function(TapDownDetails)? onTapDown;

  final Widget? child;

  const TapEffectBox({
    this.top,
    this.left,
    this.right,
    this.bottom,
    this.width,
    this.height,
    this.factor = 1,
    this.color = Colors.blue,
    this.pressedColor,
    this.borderColor = Colors.black,
    this.borderWidth = 3,
    this.borderRadius = 5,
    this.onTap,
    this.onTapDown,
    this.child,
    super.key,
  });

  @override
  State<TapEffectBox> createState() => _TapEffectBoxState();
}

class _TapEffectBoxState extends State<TapEffectBox> {
  late Color currentColor;
  late Color pressedColor;

  @override
  void initState() {
    super.initState();
    pressedColor = widget.pressedColor ?? Color(0x6674A7CF);
    currentColor = widget.color;
  }

  void _onTap() {
    setState(() {
      currentColor = pressedColor;
    });

    Future.delayed(Duration(milliseconds: 150), () {
      setState(() {
        currentColor = widget.color;
      });
    });

    widget.onTap?.call();
  }

  @override
  Widget build(BuildContext context) {
    logger.d('TapEffectBox widget build');
    Widget tapEffectBox = GestureDetector(
      onTap: _onTap,
      onTapDown: widget.onTapDown,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 150),
        width: multiplyIfNotNull(widget.width, widget.factor),
        height: multiplyIfNotNull(widget.height, widget.factor),
        decoration: BoxDecoration(
          color: currentColor,
          border: Border.all(
            color: widget.borderColor,
            width: widget.borderWidth * widget.factor,
          ),
          borderRadius: BorderRadius.circular(widget.borderRadius * widget.factor),
        ),
        child: Center(
          child: widget.child,
        ),
      ),
    );

    if (widget.top != null || widget.left != null || widget.right != null || widget.bottom != null) {
      return Positioned(
        top: multiplyIfNotNull(widget.top, widget.factor),
        left: multiplyIfNotNull(widget.left, widget.factor),
        right: multiplyIfNotNull(widget.right, widget.factor),
        bottom: multiplyIfNotNull(widget.bottom, widget.factor),
        child: tapEffectBox,
      );
    }
    return tapEffectBox;
  }
}

