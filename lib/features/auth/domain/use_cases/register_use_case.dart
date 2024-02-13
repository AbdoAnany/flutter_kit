import 'package:dartz/dartz.dart';


import '../../helper/FailureUseCase.dart';
import '../../helper/value_objects/email_value_object.dart';
import '../../helper/value_objects/name_value_object.dart';
import '../../helper/value_objects/password_value_object.dart';
import '../failures.dart';
import '../repositories/auth_repo.dart';

class RegisterUseCase implements FailureUseCase<Unit, RegisterParams> {
  final AuthRepo authRepo;

  RegisterUseCase(this.authRepo);

  @override
  Future<Either<AuthFailure, Unit>> call(RegisterParams params) {
    return authRepo.register(params);
  }
}

class RegisterParams {
  final EmailAddress emailAddress;
  final Password password;
  final Name firstName, lastName;

  String get fullName => '${firstName.getOrCrash()} ${lastName.getOrCrash()}';

  RegisterParams(
      {required this.emailAddress,
      required this.firstName,
      required this.lastName,
      required this.password});
}
