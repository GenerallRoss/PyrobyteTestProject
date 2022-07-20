import 'package:flutter/material.dart';
import 'package:test_project/values/constants.dart';
import 'package:test_project/values/machine_info.dart';
import 'package:test_project/widgets/bottom_sheet/cash_input.dart';
import 'package:test_project/widgets/bottom_sheet/changes_applied.dart';
import 'package:test_project/widgets/bottom_sheet/price_list.dart';
import 'package:test_project/widgets/bottom_sheet/price_list.dart' as PL;
import 'package:test_project/widgets/bottom_sheet/use_or_dont.dart';

class MyBottomSheet {
  bool _isChecked = false;
  Future showMyBottomSheet(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (context) => StatefulBuilder(
                builder: (BuildContext context, StateSetter setState) {
              return Container(
                padding: const EdgeInsets.only(left: 15, right: 10, top: 5),
                height: MediaQuery.of(context).size.height * 0.9,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10))),
                child: Stack(
                  children: [
                    Container(
                      padding:
                          const EdgeInsets.only(top: 55, bottom: 100, right: 5),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            const ChangesApplied(),

////////////////////////////// Поля "Decimal position" ////////////////////////////////
                            Container(
                              margin: const EdgeInsets.only(top: 25),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    'Decimal position',
                                    style: TextStyle(
                                        color: textColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  CashInput(
                                      textFirst: 'Cash', textSecond: 'Cashless')
                                ],
                              ),
                            ),
////////////////////////////// Поля "Scale Factor" ///////////////////////////////////////
                            Container(
                              margin: const EdgeInsets.only(top: 25),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    'Scale factor',
                                    style: TextStyle(
                                        color: textColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  CashInput(
                                      textFirst: 'Cash', textSecond: 'Cashless')
                                ],
                              ),
                            ),
//////////////////////////// Чекбокс звука /////////////////////////////////
                            Row(
                              children: [
                                Checkbox(
                                  value: _isChecked,
                                  onChanged: (bool? newValue) {
                                    setState(() => _isChecked = newValue!);
                                  },
                                  autofocus: false,
                                ),
                                const Text(
                                  'Включить звук',
                                  style:
                                      TextStyle(color: textColor, fontSize: 17),
                                )
                              ],
                            ),

                            const UseOrNot(),

//////////////////////////////Блок прайс-листов//////////////////////////////////////
                            Container(
                              margin: const EdgeInsets.only(top: 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Прайс листы',
                                    style: TextStyle(
                                        color: textColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: const [
                                      Text(
                                        'Последняя синхронизация с модемом',
                                        style: TextStyle(color: textColor),
                                      ),
                                      Text(
                                        modemSyncTime,
                                        style: TextStyle(color: textColor),
                                      )
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: const [
                                      Text(
                                        '  #',
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                      SizedBox(width: 60),
                                      Text(
                                        'Цена',
                                        style: TextStyle(color: Colors.grey),
                                      )
                                    ],
                                  ),
                                  const PriceList(),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            )
                          ],
                        ),
                      ),
                    ),

///////////////////// Кнопка снизу и панель сверху /////////////////////////////////////
                    Positioned(
                      bottom: 20,
                      left: 0,
                      right: 0,
                      child: Material(
                        borderRadius: BorderRadius.circular(10),
                        color: buttonColor,
                        child: MaterialButton(
                          onPressed: () {},
                          minWidth: MediaQuery.of(context).size.width * 0.85,
                          height: 60,
                          child: const Text(
                            'Сохранить изменения',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Загрузка',
                            style: TextStyle(
                                color: textColor,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                          IconButton(
                              iconSize: 35,
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(Icons.close))
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }));
  }
}
