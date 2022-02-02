import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:auth/domain/user.dart';

Future<List<User>> fetchUser() async {
  final response = await http
      .get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((user) => User.fromJson(user)).toList();
  } else {
    throw Exception('Failed to load users from API');
  }
}
