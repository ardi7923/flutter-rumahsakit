part of "screen.dart";

class PatientDetailScreen extends StatefulWidget {
  final Patient patient;

  PatientDetailScreen({required this.patient});

  @override
  _PatientDetailScreenState createState() => _PatientDetailScreenState();
}

class _PatientDetailScreenState extends State<PatientDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return GeneralLayout(
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
                      Get.to(PatientScreen());
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
                      widget.patient.name,
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
                          datapatient("nama", widget.patient.name),
                          datapatient(
                              "Jenis Kelamin",
                              (widget.patient.gender == Gender.laki)
                                  ? "Laki-laki"
                                  : "Perempuan"),
                          datapatient("Ruangan", widget.patient.room),
                          datapatient("Alamat", widget.patient.address),
                          datapatient("No Telp", widget.patient.phone),
                          datapatient("Status", widget.patient.status),
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
