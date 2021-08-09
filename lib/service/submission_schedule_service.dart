part of "service.dart";

class SubmissionScheduleService {
  /* 
    Submit Schedule 
  */
  static Future<ApiReturnValue> submit(scheduleId) async {
    await Future.delayed(Duration(milliseconds: 500));
    try {
      Response response = await dio()
          .post('/schedule/submission', data: {"schedule_id": scheduleId});
      var data = response.data['data'];
      return ApiReturnValue(value: data);
    } on DioError catch (e) {
      return ApiReturnValue(message: e.response!.statusMessage);
    }
  }
}
