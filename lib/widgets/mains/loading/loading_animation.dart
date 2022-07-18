import 'package:flutter/material.dart';
import 'package:test_project/values/constants.dart';

class LoadingAnimation extends StatefulWidget {
  final BoxConstraints constraints;

  const LoadingAnimation({Key? key, required this.constraints})
      : super(key: key);

  @override
  State<LoadingAnimation> createState() => _LoadingAnimationState();
}

class _LoadingAnimationState extends State<LoadingAnimation> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          gradient: const LinearGradient(
              //stops: [_loadingValue / 100, _loadingValue / 100],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              tileMode: TileMode.mirror,
              colors: [Color.fromARGB(255, 134, 176, 248), Colors.white]),
          borderRadius: BorderRadius.circular(5)),
      width: widget.constraints.maxWidth * 0.45,
      height: widget.constraints.maxHeight,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            '50 %',
            style: TextStyle(
                fontSize: 35, fontWeight: FontWeight.bold, color: textColor),
          ),
          Text(
            'Текущий уровень загрузки',
            style: TextStyle(fontWeight: FontWeight.bold, color: textColor),
          )
        ],
      ),
    );
  }
}
