part of "doctor.dart";

class DoctorConfirmDetailScreen extends StatefulWidget {
  final DoctorSchedule doctorSchedule;
  final bool confirm;
  final Function? onBackPressed;

  DoctorConfirmDetailScreen(
      {required this.doctorSchedule,
      required this.confirm,
      this.onBackPressed});

  @override
  _DoctorConfirmDetailScreenState createState() =>
      _DoctorConfirmDetailScreenState();
}

class _DoctorConfirmDetailScreenState extends State<DoctorConfirmDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return PublicLayout(
      child: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              color: primaryColor,
              height: MediaQuery.of(context).size.height / 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      if (widget.onBackPressed != null) {
                        widget.onBackPressed!();
                      } else {
                        Get.to(() => DoctorConfirmScheduleScreen());
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(20)),
                      margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                      child: Icon(Icons.arrow_back_ios_new),
                    ),
                  ),
                  Center(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: secondaryColor,
                          borderRadius: BorderRadius.circular(20)),
                      child: Image.asset(
                        "assets/icons/patient.png",
                        width: 80,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Center(
                    child: Text(
                      widget.doctorSchedule.name,
                      style: poppinsFont.copyWith(
                          fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                  SizedBox(height: 15),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height / 1.5,
              width: double.infinity,
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height / 3.2),
              decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(20))),
              child: Container(
                margin: EdgeInsets.fromLTRB(16, 10, 16, 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                      child: Column(
                        children: [
                          datapatient(
                              "Tanggal",
                              DateFormat("dd-MM-yyyy")
                                  .format(widget.doctorSchedule.date)),
                          datapatient("Waktu", widget.doctorSchedule.time),
                        ],
                      ),
                    ),
                    Divider(
                      height: 4,
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Data Pasien",
                      style: poppinsFont.copyWith(
                          fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                      child: Column(
                        children: [
                          datapatient("nama", widget.doctorSchedule.name),
                          datapatient(
                              "No KTP", widget.doctorSchedule.ktpNumber),
                          datapatient(
                              "Jenis Kelamin",
                              (widget.doctorSchedule.gender == Gender.laki)
                                  ? "Laki-laki"
                                  : "Perempuan"),
                          datapatient(
                              "Tanggal Lahir",
                              DateFormat("dd-MM-yyyy")
                                  .format(widget.doctorSchedule.birthday)),
                          datapatient("Alamat", widget.doctorSchedule.address),
                          datapatient("No Telp", widget.doctorSchedule.phone),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: (widget.confirm)
          ? Container(
              height: 40,
              margin: EdgeInsets.symmetric(vertical: 15, horizontal: 16),
              child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(primary: primaryColor),
                  child: Text("Konfirmasi")),
            )
          : Container(
              height: 2,
            ),
    );
  }

  Widget datapatient(String title, value) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: poppinsFont.copyWith(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            width: 80,
          ),
          Flexible(
            child: Text(
              value,
              style: poppinsFont,
              maxLines: 3,
              textAlign: TextAlign.right,
            ),
          )
        ],
      ),
    );
  }
}
