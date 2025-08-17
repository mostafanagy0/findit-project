import 'package:bloc/bloc.dart';
import 'package:findit/feature/auth/domain/entity/user_entity.dart';
import 'package:findit/feature/auth/domain/repos/auth_repo.dart';
import 'package:meta/meta.dart';

part 'signup_cubit_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit(this.authRepo) : super(SignupCubitInitial());

  final AuthRepo authRepo;

  Future<void> createUserWithEmailAndPassword(
    String email,
    String password,
    String name,
  ) async {
    emit(SignupLoading());
    try {
      final result = await authRepo.createUserWithEmailAndPassword(
        email,
        password,
        name,
      );
      result.fold(
        (failure) => emit(SignupFailure(errMessage: failure.message)),
        (user) => emit(SignupSuccess(user: user)),
      );
    } catch (e) {
      emit(SignupFailure(errMessage: e.toString()));
    }
  }
}
