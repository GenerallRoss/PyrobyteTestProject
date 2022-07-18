import 'package:flutter/material.dart';
import 'package:test_project/values/constants.dart';
import 'package:test_project/widgets/mains/events/list_of_events.dart';
import 'package:test_project/widgets/mains/finance/finance_cards.dart';
import 'package:test_project/widgets/mains/loading/loading_widget.dart';
import 'package:test_project/widgets/mains/info/machine_info.dart';
import 'package:test_project/widgets/mains/info/tech_info.dart';
import 'package:test_project/widgets/bottom_sheet/main_bottom_sheet.dart';

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
  //List<Price> price = PriceUtils.getPrice();

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
                      MyBottomSheet btm = MyBottomSheet();
                      btm.showMyBottomSheet(context);
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
                const MachineInfo(),
                const TechInfo(),
                const LoadingWidget(),

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

                const ListOfEvents(),
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

                const FinanceCards(),
                const SizedBox(height: 25)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
