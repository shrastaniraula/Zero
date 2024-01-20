import 'package:equatable/equatable.dart';
import 'package:zero/Repository/Auth/auth_repository.dart';

// Define abstract AuthEvent class with relevant events
abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

// Define a SignUpEvent, which can carry user registration data
class SignUpEvent extends AuthEvent {
  final String name;
  final String email;
  final String password;

  SignUpEvent({
    required this.name,
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [name, email, password];
}

// Define a SignInEvent, which can carry user login data
class SignInEvent extends AuthEvent {
  final String email;
  final String password;

  const SignInEvent({
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [email, password];
}

// Define a SignOutRequested event for user sign-out
class SignOutRequested extends AuthEvent {}

// Define a CheckAuthStatus event to check the user's authentication status
class CheckAuthStatus extends AuthEvent {}

class AlreadyAuthenticatedEvent extends AuthEvent {
  final AuthUser authUser;

  const AlreadyAuthenticatedEvent({required this.authUser});

  @override
  List<Object?> get props => [authUser];
}
