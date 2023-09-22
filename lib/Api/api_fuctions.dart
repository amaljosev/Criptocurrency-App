import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:criptoapp/models/crpto_models.dart';

class Api {
  static const bitcoinsUrl =
      'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false&locale=en';

      static  Future<List<CryptoCoins>> getBitCoin() async {
    final response = await http.get(Uri.parse(bitcoinsUrl));
    if (response.statusCode == 200) {
      final decodedData = jsonDecode(response.body) as List;
      return decodedData.map((coin) => CryptoCoins.fromJson(coin)).toList();
    } else {
      throw Exception('Something Happend'); 
    }
  }
}