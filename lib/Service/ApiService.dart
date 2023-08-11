import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mep/Data/Model/Question.dart';

class ApiServiceProvider {
  Future<List?> fetchQuestion() async {
    final response = await http.get(
      Uri.parse(
          'https://642b0a1db11efeb759a930cb.mockapi.io/api/supermarket/questions'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      return Question.questionList(json.decode(response.body));
    } else {
      throw Exception('Failed to load');
    }
  }
}
