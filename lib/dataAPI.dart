import 'dart:convert';

import 'dataclass.dart';
import 'package:http/http.dart' as http;

class Service {
  Future<List<cData>> getAllData() async {
    final response = await http.get(
        Uri.parse('https://api-berita-indonesia.vercel.app/cnbc/terbaru/'));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body)['data']['posts'];
      return jsonResponse.map((data) => cData.fromJson(data)).toList();
    } else {
      throw Exception('Failed to Load Data');
    }
  }

  Future<cData> getSingleData(String title) async {
    final response = await http.delete(
      Uri.parse(
          'https://6283762138279cef71d77f41.mockapi.io/api/v1/Data/$title'),
    );

    if (response.statusCode == 200) {
      cData jsonResponse = cData.fromJson(jsonDecode(response.body));
      return jsonResponse;
    } else {
      throw Exception('Failed to get data');
    }
  }
}
