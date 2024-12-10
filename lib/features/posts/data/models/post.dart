import 'package:clean/features/posts/domain/entities/post.dart';

class PostModel extends PostEntity {
  const PostModel({
    int? userId,
    int? id,
    String? title,
    String? body,
  }) : super(
          userId: userId,
          id: id,
          title: title,
          body: body,
        );

  factory PostModel.fromJson(Map<String, dynamic> map) => PostModel(
        userId: map['userId'],
        id: map['id'],
        title: map['title'],
        body: map['body'],
      );

  factory PostModel.fromEntity(PostEntity entity) => PostModel(
        userId: entity.userId,
        id: entity.id,
        title: entity.title,
        body: entity.body,
      );
}
