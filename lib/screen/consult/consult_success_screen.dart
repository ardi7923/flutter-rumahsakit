part of "consult.dart";

class ConsultSuccessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IlustrationLayout(
      title: "Pengajuan Jadwal Berhasil !!",
      subtitle: "Silahkan Tunggu konfirmasi dari dokter anda",
      imagePath: "assets/icons/contract.png",
      titleButtonPrimary: "Buat Jadwal Lagi",
      onPressedPrimaryButton: (){
        Get.offAll(() => ConsultDoctorScreen());
      },
      secondaryButton: true,
      titleButtonSecondary: "Kembali Ke Home",
      onPressedSecondaryButton: (){
        Get.offAll(() => ConsultHomeScreen());
      },
    );
  }
}
