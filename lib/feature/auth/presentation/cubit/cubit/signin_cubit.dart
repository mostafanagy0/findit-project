import 'package:bloc/bloc.dart';
import 'package:findit/feature/auth/domain/entity/user_entity.dart';
import 'package:findit/feature/auth/domain/repos/auth_repo.dart';
import 'package:meta/meta.dart';

part 'signin_state.dart';

class SigninCubit extends Cubit<SigninState> {
  SigninCubit(this.authRepo) : super(SigninInitial());

  final AuthRepo authRepo;
  Future<void> signInWithEmailAndPassword(String email, String password) async {
    emit(SigninLoading());
    try {
      final result = await authRepo.signInWithEmailAndPassword(email, password);
      result.fold(
        (failure) => emit(SigninFailure(errMessage: failure.message)),
        (user) => emit(SigninSuccess(user: user)),
      );
    } catch (e) {
      emit(SigninFailure(errMessage: e.toString()));
    }
  }
}
