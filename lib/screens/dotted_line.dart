import 'dart:ui';

import 'package:flutter/material.dart';

class DottedMiddlePath extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color.fromRGBO(117, 97, 83, 1)
      ..strokeWidth = 1;

    void drawDashedLine({
      required Canvas canvas,
      required Offset p1,
      required Offset p2,
      required List<double> pattern,
      required Paint paint,
    }) {
      final double distance = (p2 - p1).distance;
      final List<double> fullPattern =
          pattern.map((width) => width / distance).toList();
      final points = <Offset>[];
      double t = 0;
      int i = 0;
      while (t < 1) {
        points.add(Offset.lerp(p1, p2, t)!);
        t += fullPattern[i++];
        points.add(Offset.lerp(p1, p2, t.clamp(0, 1))!);
        t += fullPattern[i++];
        i %= fullPattern.length;
      }
      canvas.drawPoints(PointMode.lines, points, paint);
    }

    drawDashedLine(
        canvas: canvas,
        p1: Offset(0, size.height * 0.6),
        p2: Offset(size.width, size.height * 0.6),
        pattern: [10, 5],
        paint: paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
