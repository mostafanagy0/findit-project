import 'package:dartz/dartz.dart';
import 'package:findit/core/errors/app_failure.dart';
import 'package:findit/core/errors/error_maper.dart';
import 'package:findit/core/services/firebase_auth_service.dart';
import 'package:findit/feature/auth/domain/repos/auth_repo.dart';
import 'package:findit/feature/auth/domain/entity/user_entity.dart';

class AuthRepoImpl implements AuthRepo {
  final FirebaseAuthService firebaseAuthService;

  AuthRepoImpl({required this.firebaseAuthService});
  @override
  Future<Either<AppFailure, UserEntity>> createUserWithEmailAndPassword(
    String email,
    String password,
    String name,
  ) async {
    try {
      final user = await firebaseAuthService.createUserWithEmailAndPassword(
        emailAddress: email,
        password: password,
        name: name,
      );
      return Right(user);
    } catch (e) {
      return Left(ErrorMapper.map(e));
    }
  }
}
