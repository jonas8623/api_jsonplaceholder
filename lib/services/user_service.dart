import 'dart:convert';
import 'dart:developer';

import 'package:api_json/constant.dart';
import 'package:api_json/models/models.dart';
import 'package:http/http.dart' as http;


abstract class AbstractUserService {

  Future<List<User>> fetchUser();

}

class UserService extends AbstractUserService {

  @override
  Future<List<User>> fetchUser() async {

    final url = Uri.parse(Constant.baseUrl + Constant.path);
    final response = await http.get(url);
    if (response.statusCode == 200) {
      List users = json.decode(response.body);
      // log(response.body);
      return users.map((user) => User.fromJson(user)).toList();
    } else {
      log(response.statusCode.toString());
      throw Exception('Deu ruím');
    }
  }



}

