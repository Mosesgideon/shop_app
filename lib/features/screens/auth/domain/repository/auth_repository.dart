import 'package:food_app/features/core/response.dart';
import 'package:food_app/features/screens/auth/data/model/register_payload.dart';

abstract class AuthRepository{
  Future<ApiResponse>signup(RegisterPayload payload);

  Future<ApiResponse>login(String email ,String password);

}


















