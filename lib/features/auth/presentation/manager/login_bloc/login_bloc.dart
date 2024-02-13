import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:meta/meta.dart';

import '../../../../../di.dart';
import '../../../domain/failures.dart';
import '../../../domain/use_cases/login_use_case.dart';
import '../../../helper/UserEntity.dart';
import '../../../helper/value_objects/email_value_object.dart';
import '../../../helper/value_objects/password_value_object.dart';
import '../LoginControl.dart';

part 'login_event.dart';

part 'login_state.dart';


class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitState());
  static LoginCubit get(context) => BlocProvider.of(context);
  update({LoginState? state}) => sl<LoginCubit>().emit(state ?? LoginInitState());

 Future<void> login() async {
   print(sl<LoginControl>().email);
   print(sl<LoginControl>().password);

 }




}




// class LoginBloc extends Bloc<LoginEvent, LoginState> {
//   final LoginUseCase loginUseCase;
//
//   LoginBloc(this.loginUseCase) : super(LoginState.initial()) {
//     on<LoginEvent>((event, emit) async {
//       if (event is EmailChanged) {
//         emit(state.copyWith(
//             email: event.email, authFailureOrSuccessOption: none()));
//       } else if (event is PasswordChanged) {
//         emit(state.copyWith(
//             password: event.password, authFailureOrSuccessOption: none()));
//       } else if (event is LoginSubmitted) {
//         final params = LoginParams(
//           emailAddress: state.email,
//           password: state.password,
//         );
//         print(params.emailAddress);
//         print(params.password);
//         final result = await loginUseCase.call(params);
//         emit(state.copyWith(authFailureOrSuccessOption: some(result)));
//       }
//     });
//   }
//
//
//
//
// }
