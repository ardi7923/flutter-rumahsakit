part of "doctor.dart";

class DoctorHomeScreen extends StatefulWidget {
  @override
  _DoctorHomeScreenState createState() => _DoctorHomeScreenState();
}

class _DoctorHomeScreenState extends State<DoctorHomeScreen> {
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
              child: Column(
                children: [
                  ListTile(
                      leading: InkWell(
                        onTap: () {
                          Get.offNamed("/home");
                        },
                        child: Icon(
                          Icons.arrow_back_ios_new,
                          color: Colors.black,
                        ),
                      ),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Home Dokter",
                            style: poppinsFont.copyWith(
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      trailing: InkWell(
                        onTap: () {
                          _confirmLogout();
                        },
                        child: Container(
                          child: Icon(
                            Icons.logout,
                            color: Colors.black,
                          ),
                        ),
                      )),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Hai, ${authData.read('name')}",
                            style: poppinsFont.copyWith(
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                                color: Colors.black),
                          ),
                          SizedBox(
                            height: 6,
                          ),
                        ],
                      ),
                      Image.asset(
                        "assets/icons/consultation.png",
                        width: MediaQuery.of(context).size.width / 4,
                      )
                    ],
                  ),
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
                              image: "assets/icons/list_schedule.png",
                              title: "Konfirmasi Jadwal",
                              onTap: () {
                                Get.to(() => DoctorConfirmScheduleScreen());
                              },
                            ),
                            CardMenu(
                              image: "assets/icons/add_schedule.png",
                              title: "Lihat Jadwal",
                              onTap: () {
                                Get.to(() => ConsultDoctorScreen());
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  )),
            ],
          )
        ]),
      ),
    );
  }

  _confirmLogout() {
    var baseDialog = BaseAlertDialog(
        title: "Perhatian",
        content: "Anda Yakin ingin Logout ?",
        yesOnPressed: () async {
          var response = await AuthService.logout();

          if (response.value != null) {
            authData.erase();
            Get.offAllNamed("/home");
          }
        },
        noOnPressed: () {},
        yes: "Ya",
        no: "Tidak");

    showDialog(context: context, builder: (BuildContext context) => baseDialog);
  }
}
