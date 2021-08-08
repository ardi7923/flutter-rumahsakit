part of "service.dart";

class PatientService {
  /* 
    get Data Cashier
  */
  static Future<ApiReturnValue<List<Patient>>> getData(search) async {
    await Future.delayed(Duration(milliseconds: 500));

    try {
      Response response = await dio().get('/patient?q='+search);
      var data = response.data['data'];
      List<Patient> cashiers =
          (data as Iterable).map((e) => Patient.fromJson(e)).toList();
      return ApiReturnValue(value: cashiers);
    } on DioError catch (e) {
      return ApiReturnValue(message: e.response!.statusMessage);
    }
  }
}
