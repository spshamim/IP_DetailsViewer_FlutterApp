import 'dart:convert';
import 'package:http/http.dart';

class IP {
  Map<String, dynamic> dataRES = {};

  Future<Map<String, dynamic>> getDetails() async {
    try {
      // Make the request to get IP
      Response response = await get(Uri.parse('https://api.ipify.org?format=json'));
      Map<String, dynamic> data = jsonDecode(response.body);

      // Use the IP to fetch more details
      Response secondResponse = await get(Uri.parse('http://ip-api.com/json/${data['ip']}'));
      dataRES = Map<String, dynamic>.from(jsonDecode(secondResponse.body));
      return dataRES;
    } catch (e) {
      print('Caught error: $e');
      return {};
    }
  }
}