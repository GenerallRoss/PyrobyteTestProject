import 'package:flutter/material.dart';
import 'package:test_project/classes/price.dart';
import 'package:test_project/utils/price_utils.dart';
import 'package:test_project/values/constants.dart';
import 'package:test_project/values/machine_info.dart';
import 'package:test_project/widgets/bottom_sheet/changes_applied.dart';

class MyBottomSheet {
  bool _isChecked = false;
  bool _isUsed = true;
  List<Price> price = PriceUtils.getPrice();
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
                                children: [
                                  const Text(
                                    'Decimal position',
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
                                    children: [
                                      SizedBox(
                                        height: 45,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.44,
                                        child: TextFormField(
                                          autofocus: false,
                                          textInputAction: TextInputAction.next,
                                          decoration: InputDecoration(
                                              enabledBorder:
                                                  const OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Color.fromARGB(
                                                              132,
                                                              172,
                                                              172,
                                                              172))),
                                              labelText: 'Cash',
                                              labelStyle: const TextStyle(
                                                  color: Color.fromARGB(
                                                      132, 172, 172, 172)),
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          5))),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 45,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.44,
                                        child: TextFormField(
                                          autofocus: false,
                                          textInputAction: TextInputAction.next,
                                          decoration: InputDecoration(
                                              enabledBorder:
                                                  const OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Color.fromARGB(
                                                              132,
                                                              172,
                                                              172,
                                                              172))),
                                              labelStyle: const TextStyle(
                                                  color: Color.fromARGB(
                                                      132, 172, 172, 172)),
                                              labelText: 'Cashless',
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          5))),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
////////////////////////////// Поля "Scale Factor" ///////////////////////////////////////
                            Container(
                              margin: const EdgeInsets.only(top: 25),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Scale factor',
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
                                    children: [
                                      SizedBox(
                                        height: 45,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.44,
                                        child: TextFormField(
                                          autofocus: false,
                                          textInputAction: TextInputAction.next,
                                          decoration: InputDecoration(
                                              enabledBorder:
                                                  const OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Color.fromARGB(
                                                              132,
                                                              172,
                                                              172,
                                                              172))),
                                              labelText: 'Cash',
                                              labelStyle: const TextStyle(
                                                  color: Color.fromARGB(
                                                      132, 172, 172, 172)),
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          5))),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 45,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.44,
                                        child: TextFormField(
                                          autofocus: false,
                                          textInputAction: TextInputAction.next,
                                          decoration: InputDecoration(
                                              enabledBorder:
                                                  const OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Color.fromARGB(
                                                              132,
                                                              172,
                                                              172,
                                                              172))),
                                              labelStyle: const TextStyle(
                                                  color: Color.fromARGB(
                                                      132, 172, 172, 172)),
                                              labelText: 'Cashless',
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          5))),
                                        ),
                                      )
                                    ],
                                  )
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
////////////////////////////// Кнопки "Используется / Не используется" ///////////////////////////
                            Container(
                              margin: const EdgeInsets.only(top: 15),
                              height: 80,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Режим мастер',
                                    style: TextStyle(
                                        color: textColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                  SizedBox(
                                    height: 40,
                                    child: Row(
                                      children: [
                                        Material(
                                          color: _isUsed
                                              ? buttonColor
                                              : Colors.white,
                                          shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(10),
                                                  bottomLeft:
                                                      Radius.circular(10)),
                                              side: BorderSide(
                                                  color: buttonColor,
                                                  width: 1)),
                                          child: MaterialButton(
                                            onPressed: () {
                                              setState((() => _isUsed = true));
                                            },
                                            minWidth: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.45,
                                            child: Text(
                                              'Используется',
                                              style: TextStyle(
                                                  color: _isUsed
                                                      ? Colors.white
                                                      : buttonColor),
                                            ),
                                          ),
                                        ),
                                        Material(
                                          color: _isUsed
                                              ? Colors.white
                                              : buttonColor,
                                          shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.only(
                                                  topRight: Radius.circular(10),
                                                  bottomRight:
                                                      Radius.circular(10)),
                                              side: BorderSide(
                                                  color: buttonColor,
                                                  width: 1)),
                                          child: MaterialButton(
                                            onPressed: () {
                                              setState((() => _isUsed = false));
                                            },
                                            minWidth: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.45,
                                            child: Text('Не используется',
                                                style: TextStyle(
                                                    color: _isUsed
                                                        ? buttonColor
                                                        : Colors.white)),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
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
/////////////////////////////// Контейнер со значениями прайса /////////////////////////
                                  Container(
                                    margin: const EdgeInsets.only(top: 10),
                                    height: price.length * 55,
                                    width: MediaQuery.of(context).size.width,
                                    child: ListView.builder(
                                        primary: false,
                                        itemCount: price.length,
                                        itemBuilder: ((context, index) {
//////////////////////////////////////////////////// Поля ввода данных //////////////////////////////////////
                                          return Column(
                                            children: [
                                              SizedBox(
                                                height: 50,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    SizedBox(
                                                        height: 45,
                                                        width: 60,
                                                        child: TextFormField(
                                                            initialValue:
                                                                (price[index].priceID != -1)
                                                                    ? price[index]
                                                                        .priceID
                                                                        .toString()
                                                                    : null,
                                                            textInputAction:
                                                                TextInputAction
                                                                    .next,
                                                            decoration: InputDecoration(
                                                                enabledBorder: OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10),
                                                                    borderSide: const BorderSide(
                                                                        color: Color.fromARGB(
                                                                            204,
                                                                            199,
                                                                            199,
                                                                            199))),
                                                                border: OutlineInputBorder(
                                                                    borderRadius: BorderRadius.circular(10))))),
                                                    const SizedBox(width: 15),
                                                    SizedBox(
                                                        height: 45,
                                                        width: 100,
                                                        child: TextFormField(
                                                            initialValue:
                                                                (price[index].priceID != -1)
                                                                    ? price[index]
                                                                        .priceCount
                                                                        .toString()
                                                                    : null,
                                                            textInputAction:
                                                                TextInputAction
                                                                    .done,
                                                            decoration: InputDecoration(
                                                                enabledBorder: OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10),
                                                                    borderSide: const BorderSide(
                                                                        color: Color.fromARGB(
                                                                            204,
                                                                            199,
                                                                            199,
                                                                            199))),
                                                                border: OutlineInputBorder(
                                                                    borderRadius: BorderRadius.circular(10))))),
                                                    SizedBox(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.35),
                                                    GestureDetector(
                                                      onTap: () {},
                                                      child: IconButton(
                                                        icon: const Icon(Icons
                                                            .cancel_outlined),
                                                        color: Colors.redAccent,
                                                        onPressed: () {
                                                          setState(() {
                                                            price.removeAt(
                                                                index);
                                                          });
                                                        },
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              )
                                            ],
                                          );
                                        })),
                                  )
                                ],
                              ),
                            ),
///////////////////////////// Кнопка "Добавить строку" ////////////////////////////////
                            Container(
                              margin: const EdgeInsets.only(top: 10),
                              width: MediaQuery.of(context).size.width,
                              height: 35,
                              child: Material(
                                shape: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                      color: buttonColor,
                                    )),
                                child: MaterialButton(
                                  onPressed: () {
                                    setState(() => price.add(
                                        Price(priceID: -1, priceCount: 0)));
                                  },
                                  child: const Text(
                                    'Добавить строку',
                                    style: TextStyle(color: buttonColor),
                                  ),
                                ),
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
