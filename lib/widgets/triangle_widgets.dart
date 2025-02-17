import 'package:flutter/material.dart';
import 'dart:math' as math;

import '../utils/utilities.dart' show multiplyIfNotNull, addIfNotNull;
import '../utils/logger.dart' show logger;

class TriangleClipper extends CustomClipper<Path> {
  final Offset apex;
  final Offset baseStart;
  final Offset baseEnd;

  TriangleClipper({
    required this.apex,
    required this.baseStart,
    required this.baseEnd,
  });

  @override
  Path getClip(Size size) {
    final path = Path()
      ..moveTo(apex.dx, apex.dy)
      ..lineTo(baseStart.dx, baseStart.dy)
      ..lineTo(baseEnd.dx, baseEnd.dy)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

class TrianglePainter extends CustomPainter {
  final Offset apex;
  final Offset baseStart;
  final Offset baseEnd;
  final Color color;
  final Color borderColor;
  final double borderWidth;

  TrianglePainter(
      {required this.apex,
      required this.baseStart,
      required this.baseEnd,
      this.color = const Color.fromARGB(40, 48, 62, 155),
      this.borderColor = const Color.fromARGB(90, 48, 62, 155),
      this.borderWidth = 1.0});

  @override
  void paint(Canvas canvas, Size size) {
    final fillPaint = Paint()
      ..color = color
      ..style = PaintingStyle.fill; // 填充樣式

    final borderPaint = Paint()
      ..color = borderColor
      ..style = PaintingStyle.stroke // 邊框樣式
      ..strokeWidth = borderWidth; // 邊框寬度

    // 繪製正三角形的頂點
    final fillPath = Path()
      ..moveTo(apex.dx, apex.dy + 2 * borderWidth) // 頂點
      ..lineTo(baseStart.dx + (3 / math.sqrt(3)) * borderWidth,
          baseStart.dy - borderWidth) // 左下角
      ..lineTo(baseEnd.dx - (3 / math.sqrt(3)) * borderWidth,
          baseEnd.dy - borderWidth) // 右下角
      ..close();
    logger.t(apex);
    logger.t(baseStart);
    // 繪製正三角形的頂點
    final borderPath = Path()
      ..moveTo(apex.dx, apex.dy + borderWidth) // 頂點
      ..lineTo(baseStart.dx + (3 / math.sqrt(12)) * borderWidth,
          baseStart.dy - 0.5 * borderWidth) // 左下角
      ..lineTo(baseEnd.dx - (3 / math.sqrt(12)) * borderWidth,
          baseEnd.dy - 0.5 * borderWidth) // 右下角
      ..close();

    // 繪製填充
    canvas.drawPath(fillPath, fillPaint);

    // 繪製邊框
    canvas.drawPath(borderPath, borderPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false; // 靜態繪圖時可以設置為 false
  }
}

class TriangleWidget extends StatelessWidget {
  final double? top;
  final double? left;
  final double? right;
  final double? bottom;

  final double sideLength;
  final double factor;
  final Color color;
  final Color borderColor;
  final double borderWidth;

  late final double _height;
  late final Offset _apex;
  late final Offset _baseStart;
  late final Offset _baseEnd;

  final double rotate;
  final void Function(TapDownDetails)? onTapDown;

  TriangleWidget({
    required double sideLength,
    this.top,
    left,
    right,
    this.bottom,
    this.factor = 1,
    this.color = Colors.blue,
    this.borderColor = Colors.black,
    double borderWidth = 3,
    this.rotate = 0,
    this.onTapDown,
    super.key,
  })  : left = addIfNotNull(left, -sideLength / 2),
        right = addIfNotNull(right, sideLength / 2),
        sideLength = sideLength * factor,
        borderWidth = borderWidth * factor {
    _height = this.sideLength * math.sqrt(3) / 2;
    _apex = Offset(this.sideLength / 2, 0);
    _baseStart = Offset(0, _height);
    _baseEnd = Offset(this.sideLength, _height);
  }

  @override
  Widget build(BuildContext context) {
    logger.d('Triangle widget build, key: $key');
    Widget triangleWidget = ClipPath(
      clipper: TriangleClipper(
        apex: _apex,
        baseStart: _baseStart,
        baseEnd: _baseEnd,
      ),
      child: GestureDetector(
        onTapDown: onTapDown,
        child: CustomPaint(
          painter: TrianglePainter(
            apex: _apex,
            baseStart: _baseStart,
            baseEnd: _baseEnd,
            color: color,
            borderColor: borderColor,
            borderWidth: borderWidth,
          ),
          size: Size(sideLength, _height),
        ),
      ),
    );

    if (rotate != 0) {
      triangleWidget = Transform.rotate(
        angle: rotate,
        alignment: Alignment.topCenter,
        child: triangleWidget,
      );
    }

    if (top != null || left != null || right != null || bottom != null) {
      return Positioned(
        top: multiplyIfNotNull(top, factor),
        left: multiplyIfNotNull(left, factor),
        right: multiplyIfNotNull(right, factor),
        bottom: multiplyIfNotNull(bottom, factor),
        child: triangleWidget,
      );
    }

    return triangleWidget;
  }
}
