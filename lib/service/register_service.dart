part of "service.dart";

class RegisterService {
  /* 
    Register user consult
  */
  static Future<ApiReturnValue> registrasion(ktpNumber, name, birthday, gender,
      address, phone, username, password, repeatPassword) async {
    await Future.delayed(Duration(milliseconds: 500));

    try {
      Response response = await dio().post('/register', data: {
        "ktp_number": ktpNumber,
        "name": name,
        "birthday": birthday,
        "gender": gender,
        "address": address,
        "phone": phone,
        "username": username,
        "password": password,
        "repeat_password": repeatPassword
      });

      var data = response.data['data'];

      return ApiReturnValue(value: data);
    } on DioError catch (e) {
      print(e.response!.statusCode);
      return ApiReturnValue(message: e.response!.data["message"]);
    }
  }
}
