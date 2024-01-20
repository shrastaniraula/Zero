import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:zero/Repository/Auth/auth_repository.dart';

import 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;

  AuthBloc(this.authRepository) : super(UnAuthenticated()) {
    on<SignUpEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        bool res = await authRepository.register(
          event.name,
          event.email,
          event.password,
        );
        if (res != false) {
          emit(Authenticated());
        } else {
          emit(AuthError());
          emit(UnAuthenticated());
        }
      } catch (e) {
        emit(AuthError());
        emit(UnAuthenticated());
      }
    });
    on<SignInEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        var res = await authRepository.login(
          event.email,
          event.password,
        );
        if (res != false) {
          AuthUser? authUser = await authRepository.getAuthUser();

          if (authUser != null) {
            // If user information is found, emit AlreadyAuthenticated with user info
            emit(AlreadyAuthenticated(authUser: authUser));
          }
          emit(Authenticated());
        } else {
          emit(AuthError());
        }
      } catch (e) {
        emit(AuthError());
        emit(UnAuthenticated());
      }
    });

    on<SignOutRequested>((event, emit) async {
      emit(AuthLoading());
      await authRepository.signOut();
      emit(UnAuthenticated());
    });

    on<CheckAuthStatus>((event, emit) async {
      emit(AuthLoading());
      try {
        AuthUser? authUser = await authRepository.getAuthUser();

        if (authUser != null) {
          // If user information is found, emit AlreadyAuthenticated with user info
          emit(AlreadyAuthenticated(authUser: authUser));
        } else {
          // If user information is not found, emit UnAuthenticated
          emit(UnAuthenticated());
        }
      } catch (e) {
        emit(AuthError());
        emit(UnAuthenticated());
      }
    });
  }
}
