import 'package:dartz/dartz.dart';
import 'package:findit/core/errors/app_failure.dart';
import 'package:findit/feature/auth/domain/entity/user_entity.dart';

abstract class AuthRepo {
  Future<Either<AppFailure, UserEntity>> createUserWithEmailAndPassword(
    String email,
    String password,
    String name,
  );
}
