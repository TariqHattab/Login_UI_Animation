// import 'package:custom_animations_playground/auth/decoration_functions.dart';
import 'package:animations/animations.dart';
import 'package:custom_animations_playground/auth/widgets/background_painter.dart';
import 'package:custom_animations_playground/auth/widgets/sign_bar.dart';
import 'package:custom_animations_playground/auth/widgets/sign_in.dart';
import 'package:custom_animations_playground/auth/widgets/sign_up.dart';
import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  ValueNotifier<bool> isOpened = ValueNotifier<bool>(false);
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2290));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            ValueListenableBuilder<bool>(
                valueListenable: isOpened,
                builder: (context, isOpenedValue, ch) {
                  return Center(
                    child: PageTransitionSwitcher(
                        reverse: isOpenedValue,
                        // switchInCurve: SpringCurve(),
                        // switchOutCurve: Curves.easeInExpo, // Curves.easeInOut,
                        transitionBuilder:
                            (child, animation, seconderyAnimation) {
                          return SharedAxisTransition(
                            animation: animation,
                            secondaryAnimation: seconderyAnimation,
                            fillColor: Colors.transparent,
                            transitionType: SharedAxisTransitionType.vertical,
                            child: child,
                          );
                        },
                        duration: Duration(milliseconds: 500),
                        child: isOpenedValue
                            ? SignUp(onSignInClicked: () {
                                isOpened.value = false;
                                _animationController.reverse(from: 1);
                              })
                            : SignIn(onSignUpClicked: () {
                                isOpened.value = true;
                                _animationController.forward(from: 0);
                              })),
                  );
                }),
            // Center(
            //   child: ElevatedButton(
            //     child: Text('Animate'),
            //     onPressed: () => toggleAnimation(),
            //   ),
            // )
          ],
        ),
      ),
    );
  }

  TickerFuture toggleAnimation() {
    if (isOpened.value) {
      isOpened.value = false;

      return _animationController.reverse();
    } else {
      isOpened.value = true;

      return _animationController.forward();
    }
  }
}