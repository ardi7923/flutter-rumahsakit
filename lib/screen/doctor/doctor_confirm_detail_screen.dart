part of "doctor.dart";

class DoctorConfirmDetailScreen extends StatefulWidget {
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
                      Get.to(() => DoctorConfirmScheduleScreen());
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
                      "nama",
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
                          datapatient("Tanggal", "28 Nov 2021"),
                          datapatient("Waktu", "17:00 - 18:00"),
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
                          datapatient("nama", "nama"),
                          datapatient("No KTP", "123123123123"),
                          datapatient("Jenis Kelamin", "Perempuan"),
                          datapatient("Tanggal Lahir", "28 Nov 2021"),
                          datapatient("Alamat", "tes"),
                          datapatient("No Telp", "tes"),
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
      bottomNavigationBar: Container(
        height: 40,
        margin: EdgeInsets.symmetric(vertical: 15, horizontal: 16),
        child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(primary: primaryColor),
            child: Text("Konfirmasi")),
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
