import 'package:blog_app/core/error/failures.dart';
import 'package:blog_app/core/usescase/usecase.dart';
import 'package:blog_app/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class UserSignUp implements UseCase<String, UserSingUpParams> {
  final AuthRepository authRepository;
  const UserSignUp(this.authRepository);

  @override
  Future<Either<Failure, String>> call(UserSingUpParams params) async {
    return await authRepository.signUpWithEmailPassword(
      name: params.name,
      email: params.email,
      password: params.password,
    );
  }
}

class UserSingUpParams {
  final String email;
  final String password;
  final String name;

  UserSingUpParams({
    required this.email,
    required this.password,
    required this.name,
  });
}
