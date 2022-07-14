import 'package:test_project/classes/events.dart';

class EventsUtils {
  static List<Events> getEvents() {
    return [
      Events(time: '14:00', title: 'Сейф переполнен', description: ''),
      Events(
          time: '11:20',
          title: 'Сломался купюроприёмник',
          description: '2341245'),
      Events(
          time: '11:00',
          title: 'Закончилась наличка',
          description: 'Toshiba снековый'),
    ];
  }
}
