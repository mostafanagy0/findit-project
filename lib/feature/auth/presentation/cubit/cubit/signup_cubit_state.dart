part of 'signup_cubit_cubit.dart';

@immutable
sealed class SignupState {}

final class SignupCubitInitial extends SignupState {}

final class SignupLoading extends SignupState {}

final class SignupSuccess extends SignupState {
  final UserEntity user;

  SignupSuccess({required this.user});
}

final class SignupFailure extends SignupState {
  final String errMessage;

  SignupFailure({required this.errMessage});
}
