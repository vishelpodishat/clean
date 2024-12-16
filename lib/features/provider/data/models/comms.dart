import 'package:clean/features/provider/domain/entity/comms_entity.dart';

class CommentsModel extends CommentEntity {
  const CommentsModel({
    int? postId,
    int? id,
    String? name,
    String? email,
    String? body,
  }) : super(
          postId: postId,
          id: id,
          name: name,
          email: email,
          body: body,
        );

  factory CommentsModel.fromJson(Map<String, dynamic> map) => CommentsModel(
        postId: map['postId'],
        id: map['id'],
        name: map['name'],
        email: map['email'],
        body: map['body'],
      );

  factory CommentsModel.fromEntity(CommentEntity entity) => CommentsModel(
        postId: entity.postId,
        id: entity.id,
        name: entity.name,
        email: entity.email,
        body: entity.body,
      );
}
