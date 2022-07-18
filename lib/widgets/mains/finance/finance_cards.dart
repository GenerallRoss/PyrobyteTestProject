import 'package:flutter/material.dart';
import 'package:test_project/classes/finance.dart';
import 'package:test_project/utils/finance_utils.dart';
import 'package:test_project/values/constants.dart';

class FinanceCards extends StatelessWidget {
  const FinanceCards({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    List<Finance> finance = FinanceUtils.getFinance();
    return Container(
      margin: const EdgeInsets.only(top: 20),
      width: width,
      height: 65,
      padding: EdgeInsets.only(left: width * 0.05),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: finance.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(5)),
              margin: const EdgeInsets.only(right: 10),
              padding: const EdgeInsets.all(15),
              child: Row(
                children: [
                  CircleAvatar(
                      backgroundColor: backColor,
                      radius: 17,
                      child: (finance[index].changeType == 'Деньги в ТА')
                          ? const Icon(Icons.money)
                          : const Icon(Icons.attach_money)),
                  const SizedBox(
                    width: 15,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${finance[index].money} ₽',
                        style: const TextStyle(
                            color: textColor, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        finance[index].changeType,
                        style: const TextStyle(color: textColor),
                      )
                    ],
                  )
                ],
              ),
            );
          }),
    );
  }
}
