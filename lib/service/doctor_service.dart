part of "service.dart";

class DoctorService {
  /* 
    get Data Doctor
  */
  static Future<ApiReturnValue<List<Doctor>>> getData() async {
    await Future.delayed(Duration(milliseconds: 500));

    try {
      Response response = await dio().get('/doctor');
      var data = response.data['data'];
      List<Doctor> doctors =
          (data as Iterable).map((e) => Doctor.fromJson(e)).toList();
      return ApiReturnValue(value: doctors);
    } on DioError catch (e) {
      return ApiReturnValue(message: e.response!.statusMessage);
    }
  }
}
