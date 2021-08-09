part of "doctor.dart";

class DoctorSchedule extends StatefulWidget {
  @override
  _DoctorScheduleState createState() => _DoctorScheduleState();
}

class _DoctorScheduleState extends State<DoctorSchedule> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: PublicLayout(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(110),
          child: AppBar(
            elevation: 8,
            backgroundColor: primaryColor,
            title: Text(
              "List Jadwal",
              style: poppinsFont.copyWith(
                  color: Colors.black, fontWeight: FontWeight.bold),
            ),
            leading: InkWell(
              onTap: () {
                Get.to(() => DoctorHomeScreen());
              },
              child: Icon(
                Icons.arrow_back_ios_new,
                color: Colors.black,
              ),
            ),
            bottom: TabBar(
                indicator: UnderlineTabIndicator(
                    borderSide: BorderSide(color: Colors.white, width: 2)),
                tabs: [
                  Tab(
                    text: "Hari ini",
                  ),
                  Tab(
                    text: "List",
                  ),
                  Tab(text: "Riwayat"),
                ]),
          ),
        ),
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 5, horizontal: 16),
          child: TabBarView(children: [
            ListView(
              children: [
                Card(
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(15),
                      splashColor: primaryColor,
                      onTap: () {},
                      child: ListTile(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        leading: Image.asset(
                          "assets/icons/list_schedule.png",
                          width: 40,
                        ),
                        title: Text(
                          "Dr. Sumarjo",
                          style:
                              poppinsFont.copyWith(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "28 Nov 2021",
                              style: poppinsFont.copyWith(fontSize: 10),
                            ),
                            Text(
                              "17.00 - 18.00",
                              style: poppinsFont.copyWith(fontSize: 10),
                            ),
                            Text(
                              "Spesialis THT",
                              style: poppinsFont.copyWith(fontSize: 10),
                            ),
                          ],
                        ),
                        trailing: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Menunggu",
                              style: poppinsFont.copyWith(
                                  fontSize: 8,
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    )),
              ],
            ),
            ListView(
              children: [
                Card(
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(15),
                      splashColor: primaryColor,
                      onTap: () {},
                      child: ListTile(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                        leading: Image.asset(
                          "assets/icons/list_schedule.png",
                          width: 40,
                        ),
                        title: Text(
                          "Dr. Sumarto",
                          style:
                              poppinsFont.copyWith(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "tes",
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
                    )),
              ],
            ),
            ListView(
              children: [
                Card(
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(15),
                      splashColor: primaryColor,
                      onTap: () {},
                      child: ListTile(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                        leading: Image.asset(
                          "assets/icons/list_schedule.png",
                          width: 40,
                        ),
                        title: Text(
                          "Dr. Sumarto",
                          style:
                              poppinsFont.copyWith(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "tes",
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
                    )),
              ],
            )
          ]),
        ),
      ),
    );
  }
}
