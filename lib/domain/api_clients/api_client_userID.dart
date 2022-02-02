import 'dart:convert';
import 'package:auth/domain/userID.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

Future<List<UserID>> fetchUserID() async {
  final response = await http
      .get(Uri.parse('https://jsonplaceholder.typicode.com/todos?userId=1'));

  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((userID) => UserID.fromJson(userID)).toList();
  } else {
    throw Exception('Failed to load users from API');
  }
}


