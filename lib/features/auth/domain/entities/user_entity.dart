import 'package:business_app/features/auth/data/models/user_model.dart';

class UserEntity {
  final UserModel user;
  final String jwt;

  UserEntity({required this.user, required this.jwt});
}
