import 'package:blog_app/features/auth/domain/usescases/user_sign_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserSignUp _userSignUp;
  AuthBloc({
    required UserSignUp userSignUp,
  })  : _userSignUp = userSignUp,
        super(AuthInitial()) {
    on<AuthSignUp>((event, emit) async {
      final response = await _userSignUp(UserSingUpParams(
        email: event.email,
        password: event.password,
        name: event.name,
      ));

      response.fold(
        (failure) => emit(AuthFailure(failure.message)),
        (uid) => emit(
          AuthSuccess(uid),
        ),
      );
    });
  }
}
