import 'package:flutter/material.dart';
import 'package:test_project/values/machine_info.dart';
import 'package:test_project/values/constants.dart';

class TechInfo extends StatelessWidget {
  const TechInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(5), bottomRight: Radius.circular(5))),
      margin: const EdgeInsets.only(top: 1),
      padding: const EdgeInsets.all(15),
      width: MediaQuery.of(context).size.width * 0.85,
      height: 125,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Тип шины',
                style: TextStyle(color: textColor),
              ),
              Text(
                tireType,
                style: TextStyle(color: textColor),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Уровень сигнала',
                style: TextStyle(color: textColor),
              ),
              Text(
                signalLevel,
                style: TextStyle(color: textColor),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Идентификатор',
                style: TextStyle(color: textColor),
              ),
              Text(
                machineID,
                style: TextStyle(color: textColor),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Модем',
                style: TextStyle(color: textColor),
              ),
              Text(
                modem,
                style: TextStyle(color: textColor),
              )
            ],
          )
        ],
      ),
    );
  }
}
