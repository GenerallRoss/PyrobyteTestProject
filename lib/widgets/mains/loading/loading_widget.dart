import 'package:flutter/material.dart';
import 'package:test_project/widgets/mains/loading/load_button_style.dart';
import 'package:test_project/widgets/mains/loading/loading_animation.dart';

class LoadingWidget extends StatefulWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  State<LoadingWidget> createState() => _LoadingWidgetState();
}

class _LoadingWidgetState extends State<LoadingWidget> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      margin: const EdgeInsets.only(top: 25),
      width: width * 0.85,
      height: 150,
      child: LayoutBuilder(builder: (context, constraints) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            LoadingAnimation(constraints: constraints),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                LoadingButtonStyle(buttonText: 'Загрузка'),
                SizedBox(
                  height: 15,
                ),
                LoadingButtonStyle(buttonText: 'Инвентаризация')
              ],
            )
          ],
        );
      }),
    );
  }
}
