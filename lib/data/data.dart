import 'dart:convert';

import 'package:http/http.dart' as http;

class DataProvider {
  Future<dynamic> getData() async {
    try {
      final res = await http.get(
        Uri.parse('https://fakestoreapi.com/products'),
      );
      final data = jsonDecode(res.body);
      return data;
    } catch (e) {
      throw e.toString();
    }
  }
}
