import 'package:flutter/material.dart';
import 'package:potatooloader/paint_arc.dart';

class PotatooLoader extends StatefulWidget {
  const PotatooLoader({Key? key}) : super(key: key);

  @override
  State<PotatooLoader> createState() => _PotatooLoaderState();
}

class _PotatooLoaderState extends State<PotatooLoader>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation_rotation;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _animation_rotation = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: _controller,
            curve: const Interval(0.0, 1.0, curve: Curves.easeInOutSine)));
    _controller.repeat(reverse: false);

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 200,
      child: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              width: 60,
              height: 60,
              child: Image.asset(
                'assets/me2.png',
              ),
            ),
            RotationTransition(
              turns: _animation_rotation,
              child: buildRing(),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildRing() {
    return Stack(
      children: [
        CustomPaint(
          painter: PaintArc(start: 2, sweep: 5, color: Colors.blueAccent),
        ),
        CustomPaint(
          painter: PaintArc(start: 18, sweep: 5, color: Colors.blueAccent),
        ),
      ],
    );
  }
}
