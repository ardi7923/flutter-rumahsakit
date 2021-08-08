part of "screen.dart";

class PatientScreen extends StatefulWidget {
  @override
  _PatientScreenState createState() => _PatientScreenState();
}

class _PatientScreenState extends State<PatientScreen> {
  @override
  Widget build(BuildContext context) {
    return GeneralLayout(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: primaryColor,
              ),
              height: MediaQuery.of(context).size.height / 7,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Get.offNamed("/home");
                      },
                      child: Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(20)),
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: Icon(Icons.arrow_back_ios_new),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Pencarian Pasien",
                          style: poppinsFont.copyWith(
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                              color: Colors.black),
                        ),
                      ],
                    ),
                    Image.asset(
                      "assets/icons/consultation.png",
                      width: MediaQuery.of(context).size.width / 4,
                    )
                  ],
                ),
              ),
            ),
            Container(
                width: double.infinity,
                child: Container(
                  margin: EdgeInsets.fromLTRB(16, 10, 16, 10),
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: backgroundColor,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.black),
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search_rounded),
                        border: InputBorder.none,
                        hintText: "Cari Pasien"),
                  ),
                )),
            Container(
              margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
              height: MediaQuery.of(context).size.height / 1.2,
              child: ListView(
                  children: mockPatient
                      .map((e) => Card(
                            elevation: 8,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            child: InkWell(
                              borderRadius: BorderRadius.circular(15),
                              splashColor: primaryColor,
                              onTap: () {
                                Get.to(
                                    () => PatientDetailScreen(
                                          patient: e,
                                        ),
                                    transition: Transition.leftToRightWithFade);
                              },
                              child: ListTile(
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 5),
                                leading: Image.asset(
                                  "assets/icons/patient.png",
                                  width: 50,
                                ),
                                title: Text(
                                  e.name,
                                  style: poppinsFont.copyWith(
                                      fontWeight: FontWeight.bold),
                                ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      (e.gender == Gender.Laki)
                                          ? "Laki-laki"
                                          : "Perempuan",
                                      style: poppinsFont.copyWith(fontSize: 10),
                                    ),
                                    Text(
                                      e.room,
                                      style: poppinsFont.copyWith(fontSize: 10),
                                    ),
                                  ],
                                ),
                                trailing: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(Icons.arrow_forward_ios_outlined),
                                  ],
                                ),
                              ),
                            ),
                          ))
                      .toList()),
            )
          ],
        ),
      ),
    );
  }
}
