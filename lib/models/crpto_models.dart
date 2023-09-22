class CryptoCoins {
  final num marketCapRank;
  final String image;
  final String name;
  final num currentPrice;

  CryptoCoins(
      {required this.marketCapRank,
      required this.image,
      required this.name,
      required this.currentPrice});
  factory CryptoCoins.fromJson(Map<String, dynamic> json) {
    return CryptoCoins(
        marketCapRank: json["market_cap_rank"],
        image: json["image"],
        name: json["name"],
        currentPrice: json["current_price"]);
  }
}
