import 'package:flutter/material.dart';
import 'package:test_project/classes/finance.dart';
import 'package:test_project/utils/price_utils.dart';
import 'package:test_project/values/constants.dart';
import 'package:test_project/classes/events.dart';
import 'package:test_project/values/machine_info.dart';
import 'package:test_project/utils/events_utils.dart';
import 'package:test_project/utils/finance_utils.dart';
import 'classes/price.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Finance> finance = FinanceUtils.getFinance();
  List<Events> events = EventsUtils.getEvents();
  List<Price> price = PriceUtils.getPrice();
  int _loadingValue = 0;
  bool _isChecked = false;
  bool _isUsed = true;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: backColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 30, left: 15, right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.arrow_back),
                    iconSize: 30,
                  ),
                  IconButton(
                    onPressed: () {
                      _bottomSheetOpen();
                    },
                    icon: const Icon(Icons.settings),
                    iconSize: 30,
                  )
                ],
              ),
            ),
////////////////// Главная колонка с контейнерами /////////////////////
            Column(
              children: [
                Container(
                  width: width * 0.85,
                  margin: const EdgeInsets.only(top: 10),
                  child: const Text(
                    'Торговые автоматы',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: textColor),
                  ),
                ),
//////////////////// Информация об автомате ////////////////////////
                Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5),
                          topRight: Radius.circular(5))),
                  margin: const EdgeInsets.only(top: 25),
                  width: width * 0.85,
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
                        padding:
                            const EdgeInsets.only(left: 20, top: 15, right: 20),
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
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 13),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
/////////////////////// Контейнер с технической информацией ///////////////////////
                Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(5),
                          bottomRight: Radius.circular(5))),
                  margin: const EdgeInsets.only(top: 1),
                  padding: const EdgeInsets.all(15),
                  width: width * 0.85,
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
                ),
/////////////////// Контейней уровня загрузки и кнопок загрузки /////////////////////
                Container(
                  margin: const EdgeInsets.only(top: 25),
                  width: width * 0.85,
                  height: 150,
                  child: LayoutBuilder(builder: (context, constraints) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
///////////////////////// Контейнер показателя загрузки ////////////////////////
                        Container(
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  stops: [
                                    _loadingValue / 100,
                                    _loadingValue / 100
                                  ],
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                  tileMode: TileMode.mirror,
                                  colors: const [
                                    Color.fromARGB(255, 134, 176, 248),
                                    Colors.white
                                  ]),
                              borderRadius: BorderRadius.circular(5)),
                          width: constraints.maxWidth * 0.45,
                          height: constraints.maxHeight,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '$_loadingValue %',
                                style: const TextStyle(
                                    fontSize: 35,
                                    fontWeight: FontWeight.bold,
                                    color: textColor),
                              ),
                              const Text(
                                'Текущий уровень загрузки',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: textColor),
                              )
                            ],
                          ),
                        ),
/////////////////////////// Кнопки "Загрузка" и "Инвентаризация" /////////////////////////////
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              autofocus: false,
                              onPressed: () {},
                              // ignore: sort_child_properties_last
                              child: Container(
                                  alignment: Alignment.center,
                                  width: width * 0.37,
                                  height: 30,
                                  child: const Text(
                                    'Загрузка',
                                    style: TextStyle(
                                        color: buttonColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  )),
                              style: TextButton.styleFrom(
                                  //minimumSize: Size.fromWidth(width),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      side: const BorderSide(
                                          color: buttonColor, width: 2))),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            TextButton(
                              autofocus: false,
                              onPressed: () {},
                              // ignore: sort_child_properties_last
                              child: Container(
                                  alignment: Alignment.center,
                                  width: width * 0.37,
                                  height: 30,
                                  child: const Text(
                                    'Инвентаризация',
                                    style: TextStyle(
                                        color: buttonColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  )),
                              style: TextButton.styleFrom(
                                  //minimumSize: Size.fromWidth(width),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      side: const BorderSide(
                                          color: buttonColor, width: 2))),
                            )
                          ],
                        )
                      ],
                    );
                  }),
                ),
///////////////// Список событий ////////////////////////////////
                Container(
                  margin: const EdgeInsets.only(top: 25),
                  width: width * 0.85,
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'События',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                        color: textColor),
                  ),
                ),
                ListView.builder(
                  primary: false,
                  shrinkWrap: true,
                  itemCount: events.length,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 1,
                      color: Colors.white,
                      margin: EdgeInsets.only(
                          left: width * 0.05, right: width * 0.05, bottom: 10),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3)),
                      child: Container(
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                bottomLeft: Radius.circular(10))),
                        alignment: Alignment.centerLeft,
                        height: 50,
                        child: Stack(
                          children: [
                            Container(
                              height: 50,
                              padding: const EdgeInsets.only(right: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: const [
                                  Icon(
                                    Icons.keyboard_arrow_right,
                                    color: Color.fromARGB(255, 214, 213, 213),
                                  )
                                ],
                              ),
                            ),
////////////////////////////// Дизайн карточки события /////////////////////////
                            Row(
                              children: [
                                Container(
                                  width: 3,
                                  height: 50,
                                  decoration: const BoxDecoration(
                                      color: Color.fromARGB(255, 252, 110, 110),
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(3),
                                          bottomLeft: Radius.circular(3))),
                                ),
                                Container(
                                    alignment: Alignment.center,
                                    width: 60,
                                    child: Text(
                                      events[index].time,
                                      style: const TextStyle(
                                          color: Color.fromARGB(
                                              255, 214, 213, 213),
                                          fontWeight: FontWeight.bold),
                                    )),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      events[index].title,
                                      style: const TextStyle(
                                          color: textColor,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    (events[index].description == '')
                                        ? Row()
                                        : Text(
                                            events[index].description,
                                            style: const TextStyle(
                                              color: Color.fromARGB(
                                                  255, 214, 213, 213),
                                            ),
                                          )
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
///////////////////// Кнока "Смотреть ещё" ////////////////////////
                TextButton(
                    onPressed: () {},
                    autofocus: false,
                    style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: const BorderSide(
                                width: 1.5, color: buttonColor))),
                    child: Container(
                      alignment: Alignment.center,
                      width: width * 0.85,
                      height: 20,
                      child: const Text('Смотреть ещё'),
                    )),
///////////////// Карточки финансов ////////////////////////////////
                Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.only(top: 20),
                  width: width * 0.85,
                  child: const Text(
                    'Финансы',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                        color: textColor),
                  ),
                ),
                Container(
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
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5)),
                          margin: const EdgeInsets.only(right: 10),
                          padding: const EdgeInsets.all(15),
                          child: Row(
                            children: [
                              CircleAvatar(
                                  backgroundColor: backColor,
                                  radius: 17,
                                  child: (finance[index].changeType ==
                                          'Деньги в ТА')
                                      ? const Icon(Icons.money)
                                      : const Icon(Icons.attach_money)),
                              const SizedBox(
                                width: 15,
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${finance[index].money} ₽',
                                    style: const TextStyle(
                                        color: textColor,
                                        fontWeight: FontWeight.bold),
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
                ),
                const SizedBox(height: 25)
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _loadingProcess();
  }

  void _loadingProcess() async {
    while (_loadingValue < 85) {
      await Future.delayed(const Duration(milliseconds: 10));
      setState(() {
        _loadingValue++;
      });
    }
  }

/////////////////////////////// Ботом шит ////////////////////////////////
  void _bottomSheetOpen() {
    showModalBottomSheet(
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
////////////////////////////// Поле "Изменения применены" //////////////////////////////
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              margin: const EdgeInsets.only(top: 10),
                              decoration: BoxDecoration(
                                  color: const Color.fromARGB(64, 68, 204, 73),
                                  borderRadius: BorderRadius.circular(5)),
                              height: 85,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: const [
                                  Icon(
                                    Icons.done,
                                    color: Color.fromARGB(255, 1, 155, 26),
                                    size: 30,
                                  ),
                                  Text(
                                    'Изменения от 12.07.2021, 12:30\nприменены успешно',
                                    style: TextStyle(
                                        color: textColor,
                                        fontSize: 17,
                                        height: 1.5),
                                  )
                                ],
                              ),
                            ),
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
//////////////////////////////Блок пройс-листов//////////////////////////////////////
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
                                                        initialValue: (price[
                                                                        index]
                                                                    .priceID !=
                                                                -1)
                                                            ? price[index]
                                                                .priceID
                                                                .toString()
                                                            : null,
                                                        autofocus: false,
                                                        textInputAction:
                                                            TextInputAction
                                                                .next,
                                                        decoration:
                                                            InputDecoration(
                                                                enabledBorder:
                                                                    OutlineInputBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(
                                                                                10),
                                                                        borderSide:
                                                                            const BorderSide(
                                                                          color: Color.fromARGB(
                                                                              204,
                                                                              199,
                                                                              199,
                                                                              199),
                                                                        ))),
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      width: 15,
                                                    ),
                                                    SizedBox(
                                                      height: 45,
                                                      width: 100,
                                                      child: TextFormField(
                                                        initialValue: (price[
                                                                        index]
                                                                    .priceID !=
                                                                -1)
                                                            ? price[index]
                                                                .priceCount
                                                                .toString()
                                                            : null,
                                                        autofocus: false,
                                                        textInputAction:
                                                            TextInputAction
                                                                .next,
                                                        decoration:
                                                            InputDecoration(
                                                                enabledBorder:
                                                                    OutlineInputBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(
                                                                                10),
                                                                        borderSide:
                                                                            const BorderSide(
                                                                          color: Color.fromARGB(
                                                                              204,
                                                                              199,
                                                                              199,
                                                                              199),
                                                                        )),
                                                                border: OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10))),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.35,
                                                    ),
                                                    IconButton(
                                                      icon: const Icon(Icons
                                                          .cancel_outlined),
                                                      color: Colors.redAccent,
                                                      onPressed: () {
                                                        setState(() => price
                                                            .removeAt(index));
                                                      },
                                                    ),
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
