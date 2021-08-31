part of "model.dart";

class PatientSchedule extends Equatable {
  final int id;
  final DateTime date;
  final String time;
  final String name;
  final String specialist;
  final String image;
  final ScheduleStatus status;
  final ScheduleExpire expire;

  PatientSchedule(
      {required this.id,
      required this.date,
      required this.time,
      required this.name,
      required this.specialist,
      required this.image,
      required this.status,
      required this.expire});

  factory PatientSchedule.fromJson(Map<String, dynamic> json) =>
      PatientSchedule(
          id: json["id"],
          date: DateTime.parse(json["date"]),
          time: json["time"],
          name: json["doctor"]["name"],
          specialist: json["doctor"]["specialist"],
          image: json["doctor"]["image"],
          status: (int.parse(json["status"]) == 0 )
              ? ScheduleStatus.available
              : (int.parse(json["status"]) == 1 )
                  ? ScheduleStatus.unavailable
                  : ScheduleStatus.confirm,
          expire: (json["closed"] == 0 || json["closed"] == "0")
              ? ScheduleExpire.unexpired
              : ScheduleExpire.expired);
  @override
  List<Object?> get props =>
      [id, date, time, name, specialist, image, status, expire];
}
