import '../classes/price.dart';

class PriceUtils {
  static List<Price> getPrice() {
    return [
      Price(priceID: 1, priceCount: 50),
      Price(priceID: 2, priceCount: 150),
    ];
  }
}
