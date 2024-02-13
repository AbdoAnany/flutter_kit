import 'package:dartz/dartz.dart';


import '../../helper/UserEntity.dart';
import '../../helper/value_objects/email_value_object.dart';
import '../../helper/value_objects/password_value_object.dart';
import '../failures.dart';
import '../use_cases/register_use_case.dart';

abstract class AuthRepo {
  UserEntity getLoggedUser();

  Future<UserEntity> getUserById(String id);

  Future<void> logout();

  Future<Either<AuthFailure, UserEntity>> login(
      EmailAddress emailAddress, Password password);

  Future<Either<AuthFailure, Unit>> register(
    RegisterParams registerParams,
  );
}
