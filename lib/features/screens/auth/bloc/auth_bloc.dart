import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/features/screens/auth/data/model/login_response.dart';
import 'package:food_app/features/screens/auth/data/model/register_payload.dart';
import 'package:food_app/features/screens/auth/data/model/register_response.dart';
import 'package:food_app/features/screens/auth/domain/repository/auth_repository.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  late final AuthRepository authRepository;

  AuthBloc(this.authRepository) : super(AuthLoadingState()) {
    on<AuthEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<RegisterEvent>(_mapAuthEventToState);
    on<LoginEvent>(_mapLoginEventToState);

  }


  Future<void>_mapLoginEventToState(
      LoginEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoadingState());
    try {
      var apiResponse =
      await authRepository.login(event.email, event.password, );

      if(apiResponse.error == null){

        emit(AuthLoginSuccessState(apiResponse.data));
      }else{
        emit(AuthFailureState(apiResponse.error!));
      }

    } on Exception catch (e) {

      emit(AuthFailureState(e.toString()));

    }
  }


  FutureOr<void> _mapAuthEventToState(
      RegisterEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoadingState());
    try {
      var apiResponse = await authRepository.signup(event.payload);

      if(apiResponse.error == null){

        emit(AuthRegisterSuccessState(apiResponse.data));
      }else{
        emit(AuthFailureState(apiResponse.error!));
      }

    } on Exception catch (e) {

      emit(AuthFailureState(e.toString()));

    }
  }

}

