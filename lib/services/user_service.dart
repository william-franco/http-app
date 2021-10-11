import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http_app/models/user_model.dart';

class HttpService {
  static const String baseUrl = 'https://jsonplaceholder.typicode.com';
  static const String users = baseUrl + '/users';

  // get all from jsonplaceholder (users)
  static Future<List<UserModel>> getAllUsers() async {
    final res = await http.get(
      Uri.parse(users),
      headers: {"Accept": "application/json"},
    );
    if (res.statusCode == 200) {
      var body = jsonDecode(res.body);
      print(body);
      return UserModel.jsonToList(body);
    } else {
      throw Exception(
        'Unable to retrieve users.' + res.statusCode.toString(),
      );
    }
  }

  // get from jsonplaceholder (users)
  static Future<UserModel> getUser(int id) async {
    final res = await http.get(
      Uri.parse('$users/$id'),
      headers: {"Accept": "application/json"},
    );
    if (res.statusCode == 200) {
      var body = jsonDecode(res.body);
      print(body);
      return UserModel.fromJson(body);
    } else {
      throw Exception(
        'Unable to retrieve users.' + res.statusCode.toString(),
      );
    }
  }

  // delete from jsonplaceholder (users)
  static Future<void> deleteUser(int id) async {
    final res = await http.delete(
      Uri.parse('$users/$id'),
      headers: {"Accept": "application/json"},
    );
    if (res.statusCode == 200) {
      print('User deleted.');
    } else {
      throw Exception('Unable to delete user.' + res.statusCode.toString());
    }
  }
}
