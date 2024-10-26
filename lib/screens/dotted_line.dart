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
      required Offset offset1,
      required Offset offset2,
      required List<double> pattern,
      required Paint paint,
    }) {
      final double distance = (offset2 - offset1).distance;
      final List<double> patternList =
          pattern.map((width) => width / distance).toList();
      final List<Offset> points = <Offset>[];
      double t = 0;
      int i = 0;
      while (t < 1) {
        points.add(Offset.lerp(offset1, offset2, t)!);
        t += patternList[i++];
        points.add(Offset.lerp(offset1, offset2, t.clamp(0, 1))!);
        t += patternList[i++];
        i %= patternList.length;
      }
      canvas.drawPoints(PointMode.lines, points, paint);
    }

    drawDashedLine(
        canvas: canvas,
        offset1: Offset(0, size.height * 0.6),
        offset2: Offset(size.width, size.height * 0.6),
        pattern: [10, 5],
        paint: paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
