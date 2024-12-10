import 'dart:convert';

import 'package:clean/features/mobx/data/models/comments.dart';
import 'package:http/http.dart' as http;

abstract class MobxRemoteDataSource {
  Future<List<CommentsModel>> getComments();
}

class MobxRemoteDataSourceImpl extends MobxRemoteDataSource {
  @override
  Future<List<CommentsModel>> getComments() async {
    var url = Uri.parse('https://jsonplaceholder.typicode.com/comments');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      List<CommentsModel> result =
          data.map<CommentsModel>((dynamic i) => CommentsModel.fromJson(i as Map<String, dynamic>)).toList();
      return result;
    } else {
      throw Exception('Failed to load posts');
    }
  }
}
