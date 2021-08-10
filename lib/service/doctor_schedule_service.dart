part of "service.dart";

class DoctorScheduleService {
  /* 
    get Data Patient Schedule
  */
  static Future<ApiReturnValue<List<DoctorSchedule>>> getData() async {
    await Future.delayed(Duration(milliseconds: 500));

    try {
      Response response = await dio().get('/doctor-schedule');
      var data = response.data['data'];
      List<DoctorSchedule> doctorSchedules =
          (data as Iterable).map((e) => DoctorSchedule.fromJson(e)).toList();
      return ApiReturnValue(value: doctorSchedules);
    } on DioError catch (e) {
      return ApiReturnValue(message: e.response!.statusMessage);
    }
  }
}
