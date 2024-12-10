import 'dart:convert';

import 'package:clean/features/posts/data/models/post.dart';
import 'package:http/http.dart' as http;

abstract class PostsRemoteDataSources {
  Future<List<PostModel>> getPosts();
}

class PostsRemoteDataSourcesImpl extends PostsRemoteDataSources {
  @override
  Future<List<PostModel>> getPosts() async {
    var url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      List<PostModel> result = data.map<PostModel>((dynamic i) => PostModel.fromJson(i as Map<String, dynamic>)).toList();
      return result;
    } else {
      throw Exception('Failed to load posts');
    }
  }
}
