import 'dart:convert';
import 'package:http/http.dart' as http;
import 'global.dart';

Future<void> getNonce(url) async {
  final response = await http.get(Uri.parse(url), headers: {
    'Content-Type': 'application/json',
  });

  if (response.statusCode == 200) {
    // If the server returns a 200 OK response, parse the data

    var data = response.toString();
    print("Data from get nonce: $data");
    nonce = data;
  } else {
    // If the server returns an error response, throw an exception
    throw Exception('Failed to load data from backend');
  }
}
