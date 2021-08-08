part of "model.dart";

enum Gender { Laki, Perempuan }

class Patient extends Equatable {
  final int id;
  final String name;
  final Gender gender;
  final String address;
  final String phone;
  final String room;
  final String status;

  Patient(
      {
        required this.id,
      required this.name,
      required this.gender,
      required this.address,
      required this.phone,
      required this.room,
      required this.status
      });

  @override
  List<Object> get props => [];
}

List<Patient> mockPatient = [
  Patient(
      id: 1,
      name: "Albertus Cigaretes",
      gender: Gender.Laki,
      room: "Rawat Inap TB Paru",
      address: "Jalan Faisal no 17 Kecamatan Rappocini",
      phone: "085 340 630 610",
      status: "Pemulihan"),
  Patient(
      id: 2,
      name: "Hercules",
      gender: Gender.Perempuan,
      room: "Ruang Bedah",
      address: "Jalan Sungai Saddang Baru",
      phone: "085 340 630 620",
      status: "Rawaat Inap"),
];
