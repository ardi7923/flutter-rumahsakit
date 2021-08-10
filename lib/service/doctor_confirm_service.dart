part of "service.dart";

class DoctorConfirmService {
  /* 
    get Data Patient Schedule
  */
  static Future<ApiReturnValue> approve(scheduleId) async {
    await Future.delayed(Duration(milliseconds: 500));

    try {
      Response response = await dio()
          .post('/doctor-confirm/approve', data: {"schedule_id": scheduleId});
      var data = response.data['data'];
      return ApiReturnValue(value: data);
    } on DioError catch (e) {
      return ApiReturnValue(message: e.response!.statusMessage);
    }
  }
}
