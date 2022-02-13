import 'package:custom_animations_playground/background_painter.dart';
import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2290));
  }

  @override
  Widget build(BuildContext context) {
    print('rebuilt');
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('custom paint1'),
      // ),
      body: SafeArea(
        child: Stack(
          children: [
            SizedBox.expand(
              child: CustomPaint(
                painter: TestPainter(animation: _animationController.view),
                child: Container(
                  height: 100,
                  width: 100,
                ),
              ),
            ),
            Center(
              child: ElevatedButton(
                child: Text('Animate'),
                onPressed: () => _animationController.forward(from: 0),
              ),
            )
          ],
        ),
      ),
    );
  }
}
