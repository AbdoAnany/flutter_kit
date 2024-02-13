

import '../../helper/FailureUseCase.dart';
import '../repositories/auth_repo.dart';

class LogoutUseCase implements UseCase<void, NoParams> {
  final AuthRepo authRepo;

  LogoutUseCase(this.authRepo);

  @override
  Future<void> call(NoParams) {
    return authRepo.logout();
  }
}
