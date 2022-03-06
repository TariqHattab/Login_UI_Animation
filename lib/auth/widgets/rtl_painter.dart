import 'dart:math';
import 'dart:ui';

import 'package:custom_animations_playground/utils/pallet.dart';
import 'package:flutter/material.dart';

class RTLPainter extends CustomPainter {
  RTLPainter({required Animation<double> animation})
      : tempAnim = animation,
        bluePaint = Paint()
          ..color = Pallet.lightBlue
          ..style = PaintingStyle.fill,
        greyPaint = Paint()
          ..color = Pallet.darkBlue
          ..style = PaintingStyle.fill,
        orangePaint = Paint()
          ..color = Pallet.orange
          ..style = PaintingStyle.fill,
        liquidAnim = CurvedAnimation(
            parent: animation,
            curve: Curves.elasticOut,
            reverseCurve: Curves.easeInBack),
        blueAnim = CurvedAnimation(
            parent: animation,
            curve: const SpringCurve(),
            reverseCurve: Curves.easeInCirc),
        orangeAnim = CurvedAnimation(
            parent: animation,
            curve: const Interval(0, .7,
                curve: Interval(0, .8, curve: SpringCurve())),
            reverseCurve: Curves.linear),
        greyAnim = CurvedAnimation(
            parent: animation,
            curve: const Interval(0, .8,
                curve: Interval(0, .9, curve: SpringCurve())),
            reverseCurve: Curves.easeInCirc)

        //passing the animation view of the cotroller
        // so the custom repaint can rebuild on each update
        // ;
        ,
        super(repaint: animation);
  final Animation<double> tempAnim;
  final Animation<double> liquidAnim;
  final Animation<double> blueAnim;
  final Animation<double> greyAnim;
  final Animation<double> orangeAnim;

  final Paint bluePaint;
  final Paint greyPaint;
  final Paint orangePaint;

  @override
  void paint(Canvas canvas, Size size) {
    // canvas.drawPaint(Paint()..color = Colors.red);
    _paintBlue(size, canvas);
    _paintGrey(size, canvas);
    _paintOrange(size, canvas);
  }

  _paintBlue(Size size, Canvas canvas) {
    var path = Path();
    path.moveTo(0, size.height / 2);
    path.lineTo(0, 0);
    path.lineTo(size.width, 0);
    path.lineTo(
      size.width,
      // 0,
      lerpDouble(0, size.height, blueAnim.value) ?? 0,
    );
    _addPointsToPath(path, [
      Point(
        lerpDouble(size.width, size.width * 2 / 3, blueAnim.value) ?? 0,
        lerpDouble(0, size.height, blueAnim.value) ?? 0,
      ),
      Point(
        lerpDouble(size.width / 2, size.width * 1 / 4, liquidAnim.value) ?? 0,
        lerpDouble(size.height / 2, size.height * 3 / 4, liquidAnim.value) ?? 0,
      ),
      Point(
        0,
        lerpDouble(size.height / 2, size.height * 3 / 4, liquidAnim.value) ?? 0,
      ),
    ]);

    canvas.drawPath(path, bluePaint);
  }

  void _paintGrey(Size size, Canvas canvas) {
    final path = Path();
    path.moveTo(0, 300);
    path.lineTo(0, 0);
    path.lineTo(size.width, 0);
    path.lineTo(
      size.width,
      lerpDouble(
            size.height / 4,
            size.height / 2,
            greyAnim.value,
          ) ??
          0,
    );
    _addPointsToPath(
      path,
      [
        Point(
          size.width * 3 / 4,
          lerpDouble(size.height / 2, size.height * 3 / 4, liquidAnim.value) ??
              0,
        ),
        Point(
          size.width * 2 / 5,
          lerpDouble(size.height / 4, size.height / 2, liquidAnim.value) ?? 0,
        ),
        Point(
          size.width * 1 / 5,
          lerpDouble(size.height / 6, size.height / 3, greyAnim.value) ?? 0,
        ),
        Point(
          0,
          lerpDouble(size.height / 5, size.height / 4, greyAnim.value) ?? 0,
        ),
      ],
    );

    canvas.drawPath(path, greyPaint);
  }

  void _paintOrange(Size size, Canvas canvas) {
    if (orangeAnim.value > 0) {
      final path = Path();

      path.moveTo(size.width * 1 / 4, 0);
      path.lineTo(size.width, 0);
      path.lineTo(
        size.width,
        lerpDouble(0, size.height / 12, orangeAnim.value) ?? 0,
      );

      _addPointsToPath(path, [
        Point(
          size.width * 6 / 7,
          lerpDouble(0, size.height / 6, liquidAnim.value) ?? 0,
        ),
        Point(
          size.width * 2 / 3,
          lerpDouble(0, size.height / 10, liquidAnim.value) ?? 0,
        ),
        Point(
          size.width * 1 / 3,
          lerpDouble(0, size.height / 8, liquidAnim.value) ?? 0,
        ),
        Point(
          size.width * 1 / 4,
          0,
        ),
      ]);

      canvas.drawPath(path, orangePaint);
    }
  }

  void _addPointsToPath(Path path, List<Point> points) {
    if (points.length < 3) {
      throw UnsupportedError('Need three or more points to create a path.');
    }

    for (var i = 0; i < points.length - 2; i++) {
      final xc = (points[i].x + points[i + 1].x) / 2;
      final yc = (points[i].y + points[i + 1].y) / 2;
      path.quadraticBezierTo(points[i].x, points[i].y, xc, yc);
    }

    // connect the last two points
    path.quadraticBezierTo(
        points[points.length - 2].x,
        points[points.length - 2].y,
        points[points.length - 1].x,
        points[points.length - 1].y);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class Point {
  final double x;
  final double y;

  Point(this.x, this.y);
}

//for how to make this watch this video
//  https://www.youtube.com/watch?v=qnnlGcZ8vaQ&ab_channel=FunwithFlutter
/// Custom curve to give gooey spring effect
class SpringCurve extends Curve {
  const SpringCurve({
    this.a = 0.15,
    this.w = 19.4,
  });
  final double a;
  final double w;

  @override
  double transformInternal(double t) {
    return (-(pow(e, -t / a) * cos(t * w)) + 1).toDouble();
  }
}
