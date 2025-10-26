import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:http/http.dart' as http;

class ApiClient {
  // Set to 'mock' to use local asset mock data, or set to actual API base URL.
  static const String BASE = 'mock';

  static Future<List<dynamic>?> get(String path) async {
    if (BASE == 'mock') {
      // load local mock JSON
      final raw = await rootBundle.loadString('assets/mock/mock_news.json');
      final data = json.decode(raw);
      return data['items'] ?? data;
    } else {
      final resp = await http.get(Uri.parse('$BASE$path'));
      if (resp.statusCode == 200) {
        final data = json.decode(resp.body);
        return data['items'] ?? data;
      } else {
        print('API error: ${resp.statusCode}');
        return null;
      }
    }
  }
}
