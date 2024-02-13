import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:logger/logger.dart';

import 'package:meta/meta.dart';

import '../../../../auth/domain/use_cases/logout_use_case.dart';
import '../../../../auth/helper/FailureUseCase.dart';


part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {

  final LogoutUseCase logoutUseCase;




  HomeBloc( this.logoutUseCase) : super(HomeState.initial()) {
    on<HomeEvent>((event, emit) async {
      if (event is CountChanged) {
        print('CountChanged event>>>>${event.count}');
        state.count=event.count;
print('count >>>>  ${state.count}');
        emit(state);
      }
    });
  }

  Future<void> logout() async {
    await logoutUseCase.call(NoParams());
  }

  // HomeBloc(this.login_bloc) : super(LoginState.initial()) {
  //   on<LoginEvent>((event, emit) async {
  //     if (event is EmailChanged) {
  //       emit(state.copyWith(
  //           email: event.email, authFailureOrSuccessOption: none()));
  //     } else if (event is PasswordChanged) {
  //       emit(state.copyWith(
  //           password: event.password, authFailureOrSuccessOption: none()));
  //     } else if (event is LoginSubmitted) {
  //       final params = LoginParams(
  //         emailAddress: state.email,
  //         password: state.password,
  //       );
  //       print(params.emailAddress);
  //       print(params.password);
  //       final result = await loginUseCase.call(params);
  //       emit(state.copyWith(authFailureOrSuccessOption: some(result)));
  //     }
  //   });
  // }
}
