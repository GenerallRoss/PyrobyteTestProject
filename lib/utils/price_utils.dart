import '../classes/price.dart';

class PriceUtils {
  static List<Price> price = [
    Price(priceID: 1, priceCount: 50),
    Price(priceID: 2, priceCount: 150),
  ];

  static List<Price> getPrice() {
    return PriceUtils.price;
  }

  void addPrice(Price newPrice) {
    price.add(newPrice);
  }

  void removePrice(int position) {
    price.removeAt(position);
  }
}
