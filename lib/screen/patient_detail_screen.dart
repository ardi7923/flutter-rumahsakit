part of "screen.dart";

class PatientDetailScreen extends StatefulWidget {
  @override
  _PatientDetailScreenState createState() => _PatientDetailScreenState();
}

class _PatientDetailScreenState extends State<PatientDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return GeneralLayout(
      onBackPressed: () {
        Get.off(PatientScreen());
      },
      child: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              color: primaryColor,
              height: MediaQuery.of(context).size.height / 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: secondaryColor,
                        borderRadius: BorderRadius.circular(20)),
                    child: Image.asset(
                      "assets/icons/patient.png",
                      width: 80,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Albertus Cigaretes",
                    style: poppinsFont.copyWith(
                        fontWeight: FontWeight.bold, fontSize: 20),
                  )
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height / 1.7,
              width: double.infinity,
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height / 3.2),
              decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(20))),
              child: Container(
                margin: EdgeInsets.fromLTRB(16, 30, 16, 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                          datapatient("nama", "Albertus Cigaretes"),
                          datapatient("Ruangan", "302"),
                          datapatient("Penyakit", "Gila Gilai Kodong")
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
    );
  }

  Widget datapatient(String title, value) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: poppinsFont.copyWith(fontWeight: FontWeight.bold),
          ),
          Text(
            value,
            style: poppinsFont,
          )
        ],
      ),
    );
  }
}
