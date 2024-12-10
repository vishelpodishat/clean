import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final int? id;
  final String? firstName;
  final String? lastName;
  final int? age;

  const UserEntity({this.id, this.firstName, this.lastName, this.age});

  @override
  List<Object?> get props => [id, firstName, lastName, age];
}
