part of "service.dart";

class PatientScheduleService {
  /* 
    get Data Patient Schedule
  */
  static Future<ApiReturnValue<List<PatientSchedule>>> getData() async {
    await Future.delayed(Duration(milliseconds: 500));

    try {
      Response response = await dio().get('/patient-schedule');
      var data = response.data['data'];
      List<PatientSchedule> patientSchedules =
          (data as Iterable).map((e) => PatientSchedule.fromJson(e)).toList();
      return ApiReturnValue(value: patientSchedules);
    } on DioError catch (e) {
      return ApiReturnValue(message: e.response!.statusMessage);
    }
  }
}
