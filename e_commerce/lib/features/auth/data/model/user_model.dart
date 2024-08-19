import '../../domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel(
      {required super.name, required super.email, required super.password});

  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'],
      email: map['email'],
      password: map['password'],
    );
  }

  Map<String,dynamic>toJson(){
    return {
      'name':name,
      'email':email,
      'password':password
    };
  }
}
