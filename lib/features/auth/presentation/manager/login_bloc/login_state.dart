part of 'login_bloc.dart';

@immutable

abstract class LoginState {}

class LoginInitState extends LoginState {}

class GetCachLangState extends LoginState {}

class ChangLangState extends LoginState {}

class changShowPasswordState extends LoginState {}

// Login State
class LoginLoadingState extends LoginState {}

class LoginFiledState extends LoginState {}

class LoginCloseAlertError extends LoginState {}

class LoginSuccessState extends LoginState {}

class LoginErorrState extends LoginState {}

// Validate Sate
class ValidateSuccessState extends LoginState {}

class ValidateErorrState extends LoginState {}

class ChangListViewGropState extends LoginState {}

class SuccessGetUserProfileState extends LoginState {}

class ErrorGetUserProfileState extends LoginState {}

class SuccessChangePasswordState extends LoginState {}

class ErrorChangePasswordState extends LoginState {}

class ShowChangePasswordForm extends LoginState {}

class ShowPasswordText extends LoginState {}

class RememberText extends LoginState {}

class UploadImageProfileState extends LoginState {}
class ReturnToLoginState extends LoginState {}


// class LoginState {
//   final EmailAddress email;
//   final Password password;
//   final Option<Either<AuthFailure, UserEntity>> authFailureOrSuccessOption;
//
//   const LoginState(
//       {required this.email,
//       required this.authFailureOrSuccessOption,
//       required this.password});
//
//   factory LoginState.initial() => LoginState(
//         email: EmailAddress(''),
//         authFailureOrSuccessOption: none(),
//         password: Password(''),
//       );
//
//   //copy with
//   LoginState copyWith({
//     EmailAddress? email,
//     Password? password,
//     Option<Either<AuthFailure, UserEntity>>? authFailureOrSuccessOption,
//   }) {
//     return LoginState(
//       email: email ?? this.email,
//       password: password ?? this.password,
//       authFailureOrSuccessOption:
//           authFailureOrSuccessOption ?? this.authFailureOrSuccessOption,
//     );
//   }
// }
