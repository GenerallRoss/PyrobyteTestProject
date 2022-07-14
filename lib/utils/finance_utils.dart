import 'package:test_project/classes/finance.dart';

class FinanceUtils {
  static List<Finance> getFinance() {
    return [
      Finance(money: 5700, changeType: 'Деньги в ТА'),
      Finance(money: 1255, changeType: 'Сдача'),
      Finance(money: 1000, changeType: 'Деньги в ТА')
    ];
  }
}
