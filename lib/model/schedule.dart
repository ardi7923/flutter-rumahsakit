part of "model.dart";

enum ScheduleStatus { available, unavailable,confirm }
enum ScheduleExpire { expired, unexpired }

class Schedule extends Equatable {
  final int id;
  final String time;
  final ScheduleStatus status;

  Schedule({required this.id, required this.time, required this.status});

  factory Schedule.fromJson(Map<String, dynamic> json) => Schedule(
        id: json["id"],
        time: json["time"],
        status: (json["status"] == 0)
            ? ScheduleStatus.available
            : ScheduleStatus.unavailable,
      );

  @override
  List<Object?> get props => [id, time, status];
}
