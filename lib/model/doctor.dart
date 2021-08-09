part of "model.dart";

class Doctor extends Equatable {
  final int id;
  final String nip;
  final String name;
  final String address;
  final String phone;
  final String specialist;
  final String image;

  Doctor(
      {required this.id,
      required this.nip,
      required this.name,
      required this.address,
      required this.phone,
      required this.specialist,
      required this.image});

  factory Doctor.fromJson(Map<String, dynamic> json) => Doctor(
        id: json["id"],
        nip: json["nip"],
        name: json["name"],
        address: json["address"],
        phone: json["phone"],
        specialist: json["specialist"],
        image: json["image"],
      );

  @override
  List<Object?> get props => [id, nip, name, address, phone, specialist, image];
}
