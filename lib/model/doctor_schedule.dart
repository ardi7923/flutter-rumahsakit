part of "model.dart";

class DoctorSchedule extends Equatable {
  final int id;
  final DateTime date;
  final String time;
  final String name;
  final String ktpNumber;
  final Gender gender;
  final DateTime birthday;
  final String address;
  final String phone;
  final ScheduleStatus status;
  final ScheduleExpire expire;

  DoctorSchedule(
      {required this.id,
      required this.date,
      required this.time,
      required this.name,
      required this.ktpNumber,
      required this.gender,
      required this.birthday,
      required this.address,
      required this.phone,
      required this.status,
      required this.expire});

  factory DoctorSchedule.fromJson(Map<String, dynamic> json) => DoctorSchedule(
      id: json["id"],
      date: DateTime.parse(json["date"]),
      time: json["time"],
      name: json["patient"]["name"],
      ktpNumber: json["patient"]["ktp_number"],
      gender:
          (json["patient"]["gender"] == "M") ? Gender.laki : Gender.perempuan,
      birthday: DateTime.parse(json["patient"]["birthday"]),
      address: json["patient"]["address"],
      phone: json["patient"]["phone"],
      status: (json["status"] == 0)
          ? ScheduleStatus.available
          : (json["status"] == 1)
              ? ScheduleStatus.unavailable
              : ScheduleStatus.confirm,
      expire: (json["closed"] == 0)
          ? ScheduleExpire.unexpired
          : ScheduleExpire.expired);

  @override
  List<Object?> get props => [
        id,
        date,
        time,
        name,
        ktpNumber,
        gender,
        birthday,
        address,
        status,
        expire
      ];
}
