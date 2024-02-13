
import '../../../utils/error/failure.dart';

class AuthFailure extends Failure {}

class InvalidEmailFailure extends AuthFailure {}

class WrongPasswordFailure extends AuthFailure {}

class UserNotFoundFailure extends AuthFailure {}

class UserDisabledFailure extends AuthFailure {}

class TooManyRequestFailure extends AuthFailure {}

class EmailAlreadyInUseFailure extends AuthFailure {}

class WeakPasswordFailure extends AuthFailure {}
class UnexpectedFailure extends Failure implements AuthFailure {}