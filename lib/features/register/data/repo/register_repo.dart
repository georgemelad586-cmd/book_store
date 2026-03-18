import 'package:dio/dio.dart';

class RegisterRepo {
  static Dio dio = Dio();

  static Future<bool> register({
    required String email,
    required String name,
    required String password,
    required String passwordConfirmation,
  }) async {
    try {
      final response = await dio.post(
        'https://codingarabic.online/api/register',
        data: {
          "email": email,
          "name": name,
          "password": password,
          "password_confirmation": passwordConfirmation,
        },
      );
      return response.statusCode == 200 || response.statusCode == 201;
    } catch (e) {
      return false;
    }
  }
}
