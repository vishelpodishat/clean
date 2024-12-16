import 'dart:convert';

import 'package:clean/features/provider/data/models/comms.dart';
import 'package:http/http.dart' as http;

abstract class CommsRemoteDataSource {
  Future<List<CommentsModel>> getComms();
}

class CommsRemoteDataSourceImpl with CommsRemoteDataSource {
  @override
  Future<List<CommentsModel>> getComms() async {
    var url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => CommentsModel.fromJson(json)).toList();
    } else {
      throw Exception();
    }
  }
}
