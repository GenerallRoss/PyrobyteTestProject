import 'package:flutter/material.dart';
import 'package:test_project/values/constants.dart';

class LoadingAnimation extends StatefulWidget {
  final BoxConstraints constraints;

  const LoadingAnimation({Key? key, required this.constraints})
      : super(key: key);

  @override
  State<LoadingAnimation> createState() => _LoadingAnimationState();
}

class _LoadingAnimationState extends State<LoadingAnimation>
    with SingleTickerProviderStateMixin {
  late Animation _animation;
  late AnimationController _animationController;
  int loadingValue = 50;
  bool _startAnimation = false;

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1500));
    _animation = IntTween(begin: 0, end: loadingValue).animate(CurvedAnimation(
        parent: _animationController, curve: Curves.easeInOutCirc));
    startAnim();
    super.initState();
  }

  Future startAnim() async {
    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      _animationController.forward();
      _startAnimation = !_startAnimation;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = widget.constraints.maxWidth * 0.45;
    double height = widget.constraints.maxHeight;
    return Stack(
      children: [
        AnimatedPositioned(
            curve: Curves.easeInOutCirc,
            width: width,
            height: height,
            top: _startAnimation
                ? height - (height * 0.01 * loadingValue)
                : height,
            duration: const Duration(milliseconds: 1500),
            child: Container(
              decoration: BoxDecoration(
                color: buttonColor,
                borderRadius: BorderRadius.circular(5),
              ),
              width: width,
              height: height,
            )),
        Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(5)),
          width: width,
          height: height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AnimatedBuilder(
                animation: _animation,
                builder: (BuildContext context, Widget? child) {
                  return Text(
                    '${_animation.value} %',
                    style: const TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: textColor),
                  );
                },
              ),
              const Text(
                'Текущий уровень загрузки',
                style: TextStyle(fontWeight: FontWeight.bold, color: textColor),
              )
            ],
          ),
        ),
      ],
    );
  }
}
