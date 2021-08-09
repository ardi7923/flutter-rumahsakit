part of "screen.dart";

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final authData = GetStorage();

  @override
  Widget build(BuildContext context) {
    return PublicLayout(
      child: SingleChildScrollView(
        child: Stack(children: [
          Container(
            decoration: BoxDecoration(
              color: primaryColor,
            ),
            height: MediaQuery.of(context).size.height / 3,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Selamat Datang,",
                        style: poppinsFont.copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                            color: Colors.black),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Text(
                        "Di RS Umum Daerah Serui",
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
          Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 3.3,
              ),
              Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: backgroundColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Container(
                    margin: EdgeInsets.fromLTRB(16, 30, 16, 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Layanan Kami",
                          style: poppinsFont.copyWith(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CardMenu(
                              image: "assets/icons/patient.png",
                              title: "Cari Pasien",
                              onTap: () {
                                Get.to(() => PatientScreen());
                              },
                            ),
                            CardMenu(
                              image: "assets/icons/health-check.png",
                              title: "Konsultasi",
                              onTap: () {
                                if (authData.read("role") == "patient") {
                                  Get.to(() => ConsultHomeScreen());
                                } else if(authData.read("role") == "doctor"){

                                } else {
                                  Get.to(() => SigninScreen(
                                        register: true,
                                      ));
                                }
                              },
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CardMenu(
                              image: "assets/icons/doctor.png",
                              title: "Login Dokter",
                              onTap: () {
                                if (authData.read("role") == "patient") {
                                }else if(authData.read("role") == "doctor"){
                                  Get.to(() => DoctorHomeScreen());
                                } else {
                                  Get.to(() => SigninScreen(
                                        register: false,
                                      ));
                                }
                              },
                            ),
                            CardMenu(
                              image: "assets/icons/hospital.png",
                              title: "Tentang Kami",
                              onTap: () {
                                Get.to(() => AboutusScreen());
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  )),
            ],
          )
        ]),
      ),
    );
  }
}
