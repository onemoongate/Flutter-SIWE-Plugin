import 'dart:convert';
import 'package:http/http.dart' as http;
import 'global.dart';

Future verifyMessage(url) async {
  final response = await http.post(Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        "message": payload,
        "signature": signature,
      }));

  if (response.statusCode == 200) {
    // If the server returns a 200 OK response, parse the data
    var data = response.body;
    // Do something with the data
  } else {
    // If the server returns an error response, throw an exception
    throw Exception('Failed to load data from backend');
  }
}
