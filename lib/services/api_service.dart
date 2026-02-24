import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/quote_model.dart';

class ApiService {
  static const String url =
      "https://dummyjson.com/quotes/random";

  static Future<Quote> fetchQuote() async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data =
      jsonDecode(response.body);

      return Quote.fromJson(data);
    } else {
      throw Exception("Failed to load quote");
    }
  }
}