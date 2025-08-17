// features/auth/data/models/user_model.dart

import 'package:findit/feature/auth/domain/entity/user_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserModel extends UserEntity {
  const UserModel({required super.uid, super.email, super.name});

  factory UserModel.fromFirebaseUser(User user) {
    return UserModel(uid: user.uid, email: user.email, name: user.displayName);
  }
}
