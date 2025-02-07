import 'package:flutter/material.dart';
import 'dart:math' as math;

class CoralImage extends StatelessWidget {
  final double sideLength;

  const CoralImage({this.sideLength = 70, super.key});

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: math.pi / 2,
      child: Image.asset(
        'assets/images/coral.png',
        width: sideLength ,
        height: sideLength,
      ),
    );
  }
}


class AlgaeImage extends StatelessWidget {
  final double sideLength;

  const AlgaeImage({this.sideLength = 70, super.key});

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: math.pi / 2,
      child: Image.asset(
        'assets/images/algae.png',
        width: sideLength ,
        height: sideLength,
      ),
    );
  }
}