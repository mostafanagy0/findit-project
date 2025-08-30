import 'package:findit/core/services/firebase_auth_service.dart';
import 'package:findit/feature/auth/data/repos/auth_repo_impl.dart';
import 'package:findit/feature/auth/domain/repos/auth_repo.dart';
import 'package:findit/feature/auth/presentation/cubit/cubit/signin_cubit.dart';
import 'package:findit/feature/auth/presentation/cubit/cubit/signup_cubit_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
  getIt.registerLazySingleton<FirebaseAuthService>(
    () => FirebaseAuthService(firebaseAuth: getIt()),
  );
  getIt.registerLazySingleton<AuthRepo>(
    () => AuthRepoImpl(firebaseAuthService: getIt()),
  );
  getIt.registerFactory<SignupCubit>(() => SignupCubit(getIt()));
  getIt.registerFactory<SigninCubit>(() => SigninCubit(getIt()));
}
