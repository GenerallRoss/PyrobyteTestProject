import 'package:flutter/material.dart';
import 'package:test_project/values/constants.dart';

class UseOrNot extends StatefulWidget {
  const UseOrNot({Key? key}) : super(key: key);

  @override
  State<UseOrNot> createState() => _UseOrNotState();
}

class _UseOrNotState extends State<UseOrNot> {
  bool _isUsed = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      height: 80,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Режим мастер',
            style: TextStyle(
                color: textColor, fontWeight: FontWeight.bold, fontSize: 20),
          ),
          SizedBox(
            height: 40,
            child: Row(
              children: [
                Material(
                  color: _isUsed ? buttonColor : Colors.white,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10)),
                      side: BorderSide(color: buttonColor, width: 1)),
                  child: MaterialButton(
                    onPressed: () {
                      setState((() => _isUsed = true));
                    },
                    minWidth: MediaQuery.of(context).size.width * 0.45,
                    child: Text(
                      'Используется',
                      style: TextStyle(
                          color: _isUsed ? Colors.white : buttonColor),
                    ),
                  ),
                ),
                Material(
                  color: _isUsed ? Colors.white : buttonColor,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10),
                          bottomRight: Radius.circular(10)),
                      side: BorderSide(color: buttonColor, width: 1)),
                  child: MaterialButton(
                    onPressed: () {
                      setState((() => _isUsed = false));
                    },
                    minWidth: MediaQuery.of(context).size.width * 0.45,
                    child: Text('Не используется',
                        style: TextStyle(
                            color: _isUsed ? buttonColor : Colors.white)),
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
