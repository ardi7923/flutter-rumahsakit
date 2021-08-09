part of "model.dart";

enum Gender { laki, perempuan }

class Patient extends Equatable {
  final int id;
  final String name;
  final Gender gender;
  final String address;
  final String phone;
  final String room;
  final String status;

  Patient(
      {required this.id,
      required this.name,
      required this.gender,
      required this.address,
      required this.phone,
      required this.room,
      required this.status});

  factory Patient.fromJson(Map<String, dynamic> json) => Patient(
      id: json["id"],
      name: json["name"],
      gender: ( json["gender"] == "M") ? Gender.laki : Gender.perempuan,
      address: json["address"],
      phone: json["phone"],
      room: json["room"],
      status: json["status"]);

  @override
  List<Object> get props => [id, name, gender, address, phone, room, status];
}

