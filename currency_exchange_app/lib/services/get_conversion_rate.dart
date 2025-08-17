import 'dart:convert';

import 'package:currency_exchange/services/exchange_model.dart';
import 'package:http/http.dart' as http;

class GetConversionRate {
  final String baseUrl = 'v6.exchangerate-api.com/v6';
  final String apiKey = '';
  Future<ExchangeModel> getConversionRate(String from, String to) async {
    try {
      final url = Uri.parse('https://$baseUrl/$apiKey/pair/$from/$to');
      final response = await http.get(url);
      final data = jsonDecode(response.body);
      ExchangeModel exchangeModel = ExchangeModel.fromJson(data);
      return exchangeModel;
    } catch (e) {
      print('error');
    }
    return ExchangeModel(conversionRate: 12, baseCode: '55', targetCode: 'tt');
  }
}
