import 'package:flutter/material.dart';
import 'package:test_project/classes/price.dart';
import 'package:test_project/utils/price_utils.dart';
import 'package:test_project/values/constants.dart';

class PriceList extends StatefulWidget {
  const PriceList({Key? key}) : super(key: key);

  @override
  State<PriceList> createState() => _PriceListState();
  static void checkInt() {
    _PriceListState().checkInt();
  }
}

class _PriceListState extends State<PriceList> {
  List<Price> price = PriceUtils.getPrice();
  final List<bool> _firstCheck = [];
  final List<bool> _secondCheck = [];
  final List<TextEditingController> _firstController = [];
  final List<TextEditingController> _secondController = [];

  void checkInt() {
    initState();
    for (int index = 0; index < price.length; index++) {
      if (int.tryParse(_firstController[index].text) == null) {
        setState(() {
          _firstCheck[index] = false;
        });
      }
      if (int.tryParse(_secondController[index].text) == null) {
        setState(() {
          _secondCheck[index] = false;
        });
      }
    }
  }

  @override
  void initState() {
    for (int index = 0; index < price.length; index++) {
      _firstCheck.add(true);
      _secondCheck.add(true);
      _firstController.add(TextEditingController());
      _secondController.add(TextEditingController());
      if (price[index].priceID.toString() != 'null') {
        _firstController[index].text = price[index].priceID.toString();
      } else {
        _firstController[index].text = "";
      }
      if (price[index].priceCount.toString() != 'null') {
        _secondController[index].text = price[index].priceCount.toString();
      } else {
        _secondController[index].text = "";
      }
    }
    super.initState();
  }

  @override
  Widget build(context) {
    GlobalKey<_PriceListState> _PriceListKey = GlobalKey();
    return Column(
      children: [
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
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                                height: 45,
                                width: 60,
                                child: TextFormField(
                                    controller: _firstController[index],
                                    textInputAction: TextInputAction.next,
                                    decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: BorderSide(
                                                color: _firstCheck[index]
                                                    ? const Color.fromARGB(
                                                        204, 199, 199, 199)
                                                    : Colors.redAccent)),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10))))),
                            const SizedBox(width: 15),
                            SizedBox(
                                height: 45,
                                width: 100,
                                child: TextFormField(
                                    controller: _secondController[index],
                                    textInputAction: TextInputAction.done,
                                    decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: BorderSide(
                                                color: _secondCheck[index]
                                                    ? const Color.fromARGB(
                                                        204, 199, 199, 199)
                                                    : Colors.redAccent)),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10))))),
                            SizedBox(
                                width:
                                    MediaQuery.of(context).size.width * 0.35),
                            IconButton(
                              icon: const Icon(Icons.cancel_outlined),
                              color: Colors.redAccent,
                              onPressed: () {
                                setState(() {
                                  _firstCheck.removeAt(index);
                                  _secondCheck.removeAt(index);
                                  _firstController.removeAt(index);
                                  _secondController.removeAt(index);
                                  price.removeAt(index);
                                });
                              },
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      )
                    ],
                  );
                }))),
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
                setState(() {
                  _firstCheck.add(true);
                  _secondCheck.add(true);
                  _firstController.add(TextEditingController());
                  _secondController.add(TextEditingController());
                  price.add(Price.nullPrice());
                  _firstController[price.length - 1].text = "";
                  _secondController[price.length - 1].text = "";
                });
              },
              child: const Text(
                'Добавить строку',
                style: TextStyle(color: buttonColor),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
