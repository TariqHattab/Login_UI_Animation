import 'dart:math';
import 'dart:ui';

import 'package:custom_animations_playground/pallet.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class TestPainter extends CustomPainter {
  TestPainter({required Animation<double> animation})
      : tempAnim = animation,
        deepBluePaint = Paint()
          ..color = Pallet.deepBlue
          ..style = PaintingStyle.fill,
        greyPaint = Paint()
          ..color = Pallet.lightBlue
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

  final Paint deepBluePaint;
  final Paint greyPaint;
  final Paint orangePaint;

  @override
  void paint(Canvas canvas, Size size) {
    print('painting');
    // canvas.drawPaint(Paint()..color = Colors.red);
    _paintBlue(canvas, size);
  }

  _paintBlue(Canvas canvas, Size size) {
    var path = Path();
    path.moveTo(size.width, size.height / 2);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    path.lineTo(
      0,
      // 0,
      lerpDouble(0, size.height, blueAnim.value) ?? 0,
    );
    print('blueAnim.value =${blueAnim.value}');
    print('tempAnim.value =${tempAnim.value}');
    // path.quadraticBezierTo(
    //     size.width * 4.9 / 5, 0, size.width, size.height / 2);
    var a = size.width / 2;
    var b = size.width;
    var t = blueAnim.value;

    _addPointsToPath(path, [
      Point(
        lerpDouble(0, size.width / 2, blueAnim.value) ?? 0,
        lerpDouble(0, size.height, blueAnim.value) ?? 0,
      ),
      Point(size.width / 2, size.height / 2),
      Point(size.width, size.height / 2),
    ]);

    canvas.drawPath(path, greyPaint);
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
