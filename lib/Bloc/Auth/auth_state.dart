part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object?> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class Authenticated extends AuthState {}

class UnAuthenticated extends AuthState {}

class AuthError extends AuthState {}

class AlreadyAuthenticated extends AuthState {
  final AuthUser authUser;
  const AlreadyAuthenticated({required this.authUser});
}
