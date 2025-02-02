import 'package:flutter/material.dart';
import 'dart:math' as math;

import '../utils/utilities.dart' show multiplyIfNotNull, addIfNotNull;
import '../utils/logger.dart' show logger;


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
  double? left;
  double? right;
  final double? bottom;

  double sideLength = 0;

  final double factor;

  final Color color;

  final Color borderColor;
  double borderWidth;

  final double rotate;

  double _height = 0;
  Offset _apex = Offset.zero;
  Offset _baseStart = Offset.zero;
  Offset _baseEnd = Offset.zero;

  final void Function(TapDownDetails)? onTapDown;

  TriangleWidget({
    required this.sideLength,
    this.top,
    this.left,
    this.right,
    this.bottom,
    this.factor = 1,
    this.color = Colors.blue,
    this.borderColor = Colors.black,
    this.borderWidth = 3,
    this.rotate = 0,
    this.onTapDown,
    super.key,
  }) {
    left = addIfNotNull(left, -sideLength / 2);
    right = addIfNotNull(right, sideLength / 2);
    borderWidth *= factor;
    sideLength *= factor;
    _height = sideLength * math.sqrt(3) / 2;
    _apex = Offset(sideLength / 2, 0);
    _baseStart = Offset(0, _height);
    _baseEnd = Offset(sideLength, _height);
  }

  bool _isPointInsideTriangle(Offset p, Offset a, Offset b, Offset c) {
    double sign(Offset p1, Offset p2, Offset p3) {
      return (p1.dx - p3.dx) * (p2.dy - p3.dy) -
          (p2.dx - p3.dx) * (p1.dy - p3.dy);
    }

    bool b1 = sign(p, a, b) < 0.0;
    bool b2 = sign(p, b, c) < 0.0;
    bool b3 = sign(p, c, a) < 0.0;

    return (b1 == b2) && (b2 == b3);
  }

  @override
  Widget build(BuildContext context) {
    logger.d('Triangle widget build');
    Widget triangleWidget = GestureDetector(
      onTapDown: (details) {
        bool isInsideTriangle = _isPointInsideTriangle(
          details.localPosition,
          _apex,
          _baseStart,
          _baseEnd,
        );
        if (isInsideTriangle) {
          onTapDown?.call(details);
        }
      },
      child: CustomPaint(
          size: Size(sideLength, sideLength),
          painter: TrianglePainter(
            apex: _apex,
            baseStart: _baseStart,
            baseEnd: _baseEnd,
            color: color,
            borderColor: borderColor,
            borderWidth: borderWidth,
          )),
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
        // left: addIfNotNull(multiplyIfNotNull(left, factor), -sideLength / 2),
        right: multiplyIfNotNull(right, factor),
        // right: addIfNotNull(multiplyIfNotNull(right, factor), sideLength / 2),
        bottom: multiplyIfNotNull(bottom, factor),
        child: triangleWidget,
      );
    }

    return triangleWidget;
  }
}
