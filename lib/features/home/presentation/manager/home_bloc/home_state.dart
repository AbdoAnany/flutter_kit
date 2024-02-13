part of 'home_bloc.dart';

@immutable
class HomeState {
   HomeState();
  factory HomeState.initial() =>  HomeState();
   // HomeState copyWith({
   //   EmailAddress? email,
   //   Password? password,
   //   Option<Either<AuthFailure, UserEntity>>? authFailureOrSuccessOption,
   // }) {
   //   return LoginState(
   //     email: email ?? this.email,
   //     password: password ?? this.password,
   //     authFailureOrSuccessOption:
   //     authFailureOrSuccessOption ?? this.authFailureOrSuccessOption,
   //   );
   // }
 int count=0;



// final Password password;
 // final Option<Either<AuthFailure, UserEntity>> authFailureOrSuccessOption;



  // const LoginState(
  //     {required this.email,
  //     required this.authFailureOrSuccessOption,
  //     required this.password});
  //
  // factory LoginState.initial() => LoginState(
  //       email: EmailAddress(''),
  //       authFailureOrSuccessOption: none(),
  //       password: Password(''),
  //     );
  //
  // //copy with
  // LoginState copyWith({
  //   EmailAddress? email,
  //   Password? password,
  //   Option<Either<AuthFailure, UserEntity>>? authFailureOrSuccessOption,
  // }) {
  //   return LoginState(
  //     email: email ?? this.email,
  //     password: password ?? this.password,
  //     authFailureOrSuccessOption:
  //         authFailureOrSuccessOption ?? this.authFailureOrSuccessOption,
  //   );
  // }


}
