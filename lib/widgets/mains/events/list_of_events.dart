import 'package:flutter/material.dart';
import 'package:test_project/classes/events.dart';
import 'package:test_project/utils/events_utils.dart';
import 'package:test_project/values/constants.dart';

class ListOfEvents extends StatelessWidget {
  const ListOfEvents({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    List<Events> events = EventsUtils.getEvents();
    return ListView.builder(
      primary: false,
      shrinkWrap: true,
      itemCount: events.length,
      itemBuilder: (context, index) {
        return Card(
          elevation: 1,
          color: Colors.white,
          margin: EdgeInsets.only(
              left: width * 0.05, right: width * 0.05, bottom: 10),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
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
                              color: Color.fromARGB(255, 214, 213, 213),
                              fontWeight: FontWeight.bold),
                        )),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          events[index].title,
                          style: const TextStyle(
                              color: textColor, fontWeight: FontWeight.bold),
                        ),
                        (events[index].description == '')
                            ? Row()
                            : Text(
                                events[index].description,
                                style: const TextStyle(
                                  color: Color.fromARGB(255, 214, 213, 213),
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
    );
  }
}
