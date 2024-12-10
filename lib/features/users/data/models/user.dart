import 'package:clean/features/users/domain/entities/user.dart';

class UserModel extends UserEntity {
  const UserModel({
    int? id,
    String? firstName,
    String? lastName,
    int? age,
  }) : super(
          id: id,
          firstName: firstName,
          lastName: lastName,
          age: age,
        );

  factory UserModel.fromJson(Map<String, dynamic> map) => UserModel(
        firstName: map['firstName'],
        lastName: map['lastName'],
        age: map['age'],
      );

  factory UserModel.fromEntity(UserEntity entity) => UserModel(
        id: entity.id,
        firstName: entity.firstName,
        lastName: entity.lastName,
        age: entity.age,
      );
}
