part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();
}

class RegisterEvent extends AuthEvent {
  final RegisterPayload payload;

  const RegisterEvent(this.payload);

  @override
  List<Object?> get props => [payload];
}


class LoginEvent extends AuthEvent {
  final String email, password;

  LoginEvent(this.password, this.email);

  @override
  List<Object?> get props => [email, password];
}
