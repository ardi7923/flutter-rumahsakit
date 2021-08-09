part of "consult.dart";

class ConsultSuccessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IlustrationLayout(
      title: "Pengajuan Jadwal Berhasil !!",
      subtitle: "Silahkan Tunggu konfirmasi dari dokter anda",
      imagePath: "assets/icons/contract.png",
      titleButtonPrimary: "Lihat Jadwal",
      onPressedPrimaryButton: (){
        Get.offAll(() => ListScheduleScreen());
      },
      secondaryButton: true,
      titleButtonSecondary: "Kembali Ke Home",
      onPressedSecondaryButton: (){
        Get.offAll(() => ConsultHomeScreen());
      },
    );
  }
}
