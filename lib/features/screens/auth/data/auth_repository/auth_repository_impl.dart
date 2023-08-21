import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:food_app/features/api_helpers/helper_class.dart';
import 'package:food_app/features/core/response.dart';
import 'package:food_app/features/screens/auth/data/model/login_response.dart';
import 'package:food_app/features/screens/auth/data/model/register_payload.dart';
import 'package:food_app/features/screens/auth/data/model/register_response.dart';
import 'package:food_app/features/screens/auth/domain/repository/auth_repository.dart';

class AuthRepositoryIMPL extends AuthRepository{
  ApiUrl apiUrl=ApiUrl();
  @override
  Future<ApiResponse> login(String email, String password)async {
    try {
      var response = await apiUrl.post({'email': email, 'password': password},'/auth/login');
      return ApiResponse(
          error: null, data: LoginResponse.fromJson(response.data));
    } on DioException catch (e) {

      log(e.response.toString());
      return ApiResponse(error: e.message);
    } on Exception catch (e) {

      return ApiResponse(error: e.toString());
    }



  }

  // Future<ApiResponse> login(String email, String password) async{
  //
  //
  //     try {
  //       var response=await apiUrl.post({email, password},'authaccount/login');
  //     } on DioException catch (e) {
  //
  //     }
  //
  //     return ApiResponse(error: null,data:LoginResponse.fromJson(response.data));
  //
  // }

  @override

  Future<ApiResponse> signup(RegisterPayload payload) async {
    try {
      log(payload.toJson().toString());
      var response = await apiUrl.post(payload.toJson(), '/auth/register');
      log(response.data.toString());

      return ApiResponse(
          error: null, data: RegisterResponse.fromJson(response.data));
    }
    on DioException catch (e) {
      log(e.response.toString());
      return ApiResponse(error: e.message, data: null);
    } on Exception catch (e) {
      return ApiResponse(error: e.toString(), data: null);
    }
  }
  // Future<ApiResponse> signup(RegisterPayload payload)async {
  //   try {
  //     var response =await apiUrl.post(payload.toJson(), 'authaccount/registration');
  //   }
  //   on Exception catch (e) {
  //
  //   }
  //
  //
  //   return ApiResponse(error: null,data: response.data);
  //
  // }

}