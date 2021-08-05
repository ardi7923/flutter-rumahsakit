part of "screen.dart";

class PatientScreen extends StatefulWidget {
  @override
  _PatientScreenState createState() => _PatientScreenState();
}

class _PatientScreenState extends State<PatientScreen> {
  @override
  Widget build(BuildContext context) {
    return GeneralLayout(
      onBackPressed: () {
        Get.offAllNamed("/home");
      },
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
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Cari SAi Keluarganu,",
                          style: poppinsFont.copyWith(
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                              color: Colors.black),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                          "Parompa Rompai",
                          style: poppinsFont.copyWith(
                              fontWeight: FontWeight.w600,
                              fontSize: 17,
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
              height: MediaQuery.of(context).size.height / 1.63,
              child: ListView(
                children: [
                  Card(
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(15),
                      splashColor: primaryColor,
      
                      onTap: (){
      
                      },
                      child: ListTile(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                        leading: Image.asset(
                          "assets/icons/patient.png",
                          width: 50,
                        ),
                        title: Text(
                          "Nama Pasien",
                          style: poppinsFont.copyWith(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          "Penyakit Gila Banyak dudu gayana",
                          style: poppinsFont.copyWith(fontSize: 10),
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
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
