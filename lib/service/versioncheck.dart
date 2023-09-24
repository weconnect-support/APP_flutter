import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as htmlParser;

Future<String?> fetchServerAppVersion() async {
  final url = Uri.parse('https://api.weconnect.support/getVersion');
  final response = await http.get(url); // 서버 엔드포인트를 여기에 입력하세요.
  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    final appVersion = data['AppVersion'] as String;
    return appVersion;
  } else {
    throw Exception('parsing error');
  }
}
