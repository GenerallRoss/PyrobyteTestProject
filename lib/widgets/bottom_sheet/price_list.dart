import 'package:flutter/material.dart';
import 'package:test_project/classes/price.dart';
import 'package:test_project/utils/price_utils.dart';
import 'package:test_project/values/constants.dart';

class PriceList extends StatefulWidget {
  const PriceList({Key? key}) : super(key: key);

  @override
  State<PriceList> createState() => _PriceListState();
}

class _PriceListState extends State<PriceList> {
  List<Price> price = PriceUtils.getPrice();

  @override
  Widget build(context) {
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
                                    initialValue: (price[index].priceID != -1)
                                        ? price[index].priceID.toString()
                                        : null,
                                    textInputAction: TextInputAction.next,
                                    decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: const BorderSide(
                                                color: Color.fromARGB(
                                                    204, 199, 199, 199))),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10))))),
                            const SizedBox(width: 15),
                            SizedBox(
                                height: 45,
                                width: 100,
                                child: TextFormField(
                                    initialValue: (price[index].priceID != -1)
                                        ? price[index].priceCount.toString()
                                        : null,
                                    textInputAction: TextInputAction.done,
                                    decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: const BorderSide(
                                                color: Color.fromARGB(
                                                    204, 199, 199, 199))),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10))))),
                            SizedBox(
                                width:
                                    MediaQuery.of(context).size.width * 0.35),
                            GestureDetector(
                              onTap: () {},
                              child: IconButton(
                                icon: const Icon(Icons.cancel_outlined),
                                color: Colors.redAccent,
                                onPressed: () {
                                  setState(() {
                                    price.removeAt(index);
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
                  price.add(Price(priceID: -1, priceCount: -1));
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
