import 'package:flutter/material.dart';
import 'package:test_project/widgets/bottom_sheet/cash_input_style.dart';

class CashInput extends StatelessWidget {
  final String textFirst;
  final String textSecond;

  const CashInput({Key? key, required this.textFirst, required this.textSecond})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CashInputStyle(text: textFirst),
        CashInputStyle(text: textSecond)
      ],
    );
  }
}
