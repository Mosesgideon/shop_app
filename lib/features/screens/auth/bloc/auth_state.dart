part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();
}

class AuthInitial extends AuthState {
  @override
  List<Object> get props => [];
}

class AuthLoadingState extends AuthState {
  @override
  List<Object> get props => [];
}

class AuthRegisterSuccessState extends AuthState {
  final RegisterResponse response;

  const AuthRegisterSuccessState(this.response);

  @override
  List<Object> get props => [];
}

class AuthFailureState extends AuthState {
  late String error;

  AuthFailureState(this.error);

  @override
  List<Object> get props => [];
}

class AuthLoginSuccessState extends AuthState {
  final LoginResponse response;

  AuthLoginSuccessState(this.response);

  @override
  List<Object> get props => [];
}
