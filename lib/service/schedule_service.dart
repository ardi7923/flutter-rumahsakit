part of "service.dart";

class ScheduleService {

  /* 
    get Schedule doctor for date
  */
  static Future<ApiReturnValue<List<Schedule>>> getData(doctorId,date) async {
    await Future.delayed(Duration(milliseconds: 500));
    try {
      Response response = await dio().get('/schedule?date='+DateFormat("yyyy-MM-dd").format(date)+'&doctor_id='+doctorId.toString());
      var data = response.data['data'];
      List<Schedule> schedules =
          (data as Iterable).map((e) => Schedule.fromJson(e)).toList();
      return ApiReturnValue(value: schedules);
    } on DioError catch (e) {
      return ApiReturnValue(message: e.response!.statusMessage);
    }
  }
  
}