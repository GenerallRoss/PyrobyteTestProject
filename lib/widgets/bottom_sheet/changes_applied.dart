import 'package:flutter/material.dart';
import 'package:test_project/values/constants.dart';

class ChangesApplied extends StatelessWidget {
  const ChangesApplied({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      margin: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
          color: const Color.fromARGB(64, 68, 204, 73),
          borderRadius: BorderRadius.circular(5)),
      height: 85,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          Icon(
            Icons.done,
            color: Color.fromARGB(255, 1, 155, 26),
            size: 30,
          ),
          Text(
            'Изменения от 12.07.2021, 12:30\nприменены успешно',
            style: TextStyle(color: textColor, fontSize: 17, height: 1.5),
          )
        ],
      ),
    );
  }
}
