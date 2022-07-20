class Price {
  int? priceID;
  int? priceCount;

  Price({required this.priceID, required this.priceCount});
  Price.nullPrice() {
    priceID = null;
    priceCount = null;
  }
}
