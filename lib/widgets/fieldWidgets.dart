import 'package:flutter/material.dart';
import 'dart:math' as math;

class InkwellContainer extends StatelessWidget {
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

  InkwellContainer({
    super.key,
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
  });
  // }) : super(key: key);

  double? _multiplyIfNotNull(double? value, double factor) {
    return value != null ? value * factor : null;
  }

  @override
  Widget build(BuildContext context) {
    Widget inkwellContainer = InkWell(
      onTap: onTap,
      onTapDown: onTapDown,
      child: Container(
        width: _multiplyIfNotNull(width, factor),
        height: _multiplyIfNotNull(height, factor),
        decoration: BoxDecoration(
          color: color,
          border: Border.all(
            color: borderColor,
            width: borderWidth,
          ),
          borderRadius: BorderRadius.circular(borderRadius * factor),
        ),
      ),
    );

    if (top != null || left != null || right != null || bottom != null) {
      return Positioned(
        top: _multiplyIfNotNull(top, factor),
        left: _multiplyIfNotNull(left, factor),
        right: _multiplyIfNotNull(right, factor),
        bottom: _multiplyIfNotNull(bottom, factor),
        child: inkwellContainer,
      );
    }
    return inkwellContainer;
  }
}
