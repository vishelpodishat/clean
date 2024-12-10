import 'dart:convert';

import 'package:clean/features/users/data/models/user.dart';
import 'package:http/http.dart' as http;

abstract class UsersRemoteDataSources {
  Future<List<UserModel>> getUsers();
}

class UsersRemoteDataSourceImlp extends UsersRemoteDataSources {
  @override
  Future<List<UserModel>> getUsers() async {
    var url = Uri.parse('xxx/getUsers');
    Map<String, String> header = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
    var response = await http.get(url, headers: header);
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      List<UserModel> result =
          data['users'].map<UserModel>((dynamic i) => UserModel.fromJson(i as Map<String, dynamic>)).toList();
      return result;
    } else {
      throw Error();
    }
  }
}
