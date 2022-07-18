import 'package:flutter/material.dart';

class CashInputStyle extends StatelessWidget {
  final String text;

  const CashInputStyle({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      width: MediaQuery.of(context).size.width * 0.44,
      child: TextFormField(
        autofocus: false,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(
                borderSide:
                    BorderSide(color: Color.fromARGB(132, 172, 172, 172))),
            labelText: text,
            labelStyle:
                const TextStyle(color: Color.fromARGB(132, 172, 172, 172)),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))),
      ),
    );
  }
}
