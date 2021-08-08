part of "service.dart";

class AuthService {
  /*
   * Login 
   */
  static Future<ApiReturnValue> login(String username, String password) async {
    await Future.delayed(Duration(milliseconds: 500));

    try {
      Response response = await dio().post('/login',
          data: {'username': username, 'password': password});
      return ApiReturnValue(value: response.data["data"]);
    } on DioError catch (e) {
      return ApiReturnValue(message: e.response!.data["message"]);
    }
  }

  /*
   * Logout 
   */
  static Future<ApiReturnValue> logout() async {
    await Future.delayed(Duration(milliseconds: 500));

    try {
      Response response = await dio().post('/logout');
      return ApiReturnValue(value: response.data["message"]);
    } on DioError catch (e) {
      return ApiReturnValue(message: e.response!.data["message"]);
    }
  }
}
