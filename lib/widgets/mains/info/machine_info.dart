import 'package:flutter/material.dart';
import 'package:test_project/values/machine_info.dart';
import 'package:test_project/values/constants.dart';

class MachineInfo extends StatelessWidget {
  const MachineInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(5), topRight: Radius.circular(5))),
      margin: const EdgeInsets.only(top: 25),
      width: MediaQuery.of(context).size.width * 0.85,
      height: 110,
      child: Stack(
        children: [
          const Positioned(
              top: 10,
              right: 10,
              child: Text(
                machineType,
                style: TextStyle(color: Colors.grey),
              )),
          Container(
            padding: const EdgeInsets.only(left: 20, top: 15, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  machineNumber,
                  style: TextStyle(fontSize: 25, color: textColor),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: Row(
                    children: const [
                      Icon(
                        Icons.circle,
                        size: 10,
                        color: Color.fromARGB(255, 249, 120, 121),
                      ),
                      Text(
                        '  Не работает',
                        style: TextStyle(
                          color: textColor,
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: const Text(
                    'ТЦ Мега, Химки',
                    style: TextStyle(color: Colors.grey, fontSize: 13),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
