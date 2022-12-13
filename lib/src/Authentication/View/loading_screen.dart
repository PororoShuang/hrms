import 'package:flutter/material.dart';

import '../../navBar.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreen();
}

class _LoadingScreen extends State<LoadingScreen> {
  double loadingBallSize = 1;
  AlignmentGeometry _alignment = Alignment.center;
  bool stopScaleAnimtion = false;
  bool showMessages = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 3000), () {
      setState(() {
        _alignment = Alignment.topRight;
        stopScaleAnimtion = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedAlign(
          duration: Duration(milliseconds: 300),
          alignment: _alignment,
          child: TweenAnimationBuilder<double>(
            duration: Duration(milliseconds: 500),
            tween: Tween(begin: 0, end: loadingBallSize),
            onEnd: () {
              if (!stopScaleAnimtion) {
                setState(() {
                  if (loadingBallSize == 1) {
                    loadingBallSize = 1.5;
                  } else {
                    loadingBallSize = 1;
                  }
                });
              } else {
                Future.delayed(Duration(milliseconds: 300), () {
                  setState(() {
                    //showMessages = true;
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const BottomNavigation()));
                  });
                });
              }
            },
            builder: (_, value, __) => Transform.scale(
              scale: value,
              child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: !stopScaleAnimtion
                        ? Colors.black.withOpacity(0.8)
                        : null,
                    shape: BoxShape.circle,
                  ),
            ),
          ),
        ),
        ),
      ],
    );
  }
}