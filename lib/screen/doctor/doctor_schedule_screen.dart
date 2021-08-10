part of "doctor.dart";

class DoctorScheduleScreen extends StatefulWidget {
  @override
  _DoctorScheduleScreenState createState() => _DoctorScheduleScreenState();
}

class _DoctorScheduleScreenState extends State<DoctorScheduleScreen> {
  @override
  void initState() {
    super.initState();
    context.read<DoctorScheduleCubit>().getDoctorSchedule();
  }

  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
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
                    text: "List",
                  ),
                  Tab(text: "Riwayat"),
                ]),
          ),
        ),
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 5, horizontal: 16),
          child: TabBarView(children: [
            BlocBuilder<DoctorScheduleCubit, DoctorScheduleState>(
              builder: (context, state) {
                if (state is DoctorScheduleLoaded) {
                  return ListView(
                      children: state.doctorSchedules
                          .where((e) =>
                              e.expire == ScheduleExpire.unexpired &&
                              e.status == ScheduleStatus.confirm)
                          .map((e) => Card(
                              elevation: 8,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              child: InkWell(
                                borderRadius: BorderRadius.circular(15),
                                splashColor: primaryColor,
                                onTap: () {
                                  Get.to(() => DoctorConfirmDetailScreen(
                                      doctorSchedule: e));
                                },
                                child: ListTile(
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 10),
                                    leading: Image.asset(
                                      "assets/icons/patient.png",
                                      width: 40,
                                    ),
                                    title: Text(
                                      e.name,
                                      style: poppinsFont.copyWith(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    subtitle: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          DateFormat("dd-MM-yyyy")
                                              .format(e.date),
                                          style: poppinsFont.copyWith(
                                              fontSize: 10),
                                        ),
                                        Text(
                                          e.time,
                                          style: poppinsFont.copyWith(
                                              fontSize: 10),
                                        ),
                                      ],
                                    ),
                                    trailing: Icon(Icons.arrow_forward_ios)),
                              )))
                          .toList());
                } else {
                  return loadingFadingCircle;
                }
              },
            ),
            BlocBuilder<DoctorScheduleCubit, DoctorScheduleState>(
              builder: (context, state) {
                if (state is DoctorScheduleLoaded) {
                  return ListView(
                      children: state.doctorSchedules
                          .where((e) =>
                              e.expire == ScheduleExpire.expired &&
                              e.status == ScheduleStatus.confirm)
                          .map((e) => Card(
                              elevation: 8,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              child: InkWell(
                                borderRadius: BorderRadius.circular(15),
                                splashColor: primaryColor,
                                onTap: () {
                                  Get.to(() => DoctorConfirmDetailScreen(
                                      doctorSchedule: e));
                                },
                                child: ListTile(
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 10),
                                    leading: Image.asset(
                                      "assets/icons/patient.png",
                                      width: 40,
                                    ),
                                    title: Text(
                                      e.name,
                                      style: poppinsFont.copyWith(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    subtitle: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          DateFormat("dd-MM-yyyy")
                                              .format(e.date),
                                          style: poppinsFont.copyWith(
                                              fontSize: 10),
                                        ),
                                        Text(
                                          e.time,
                                          style: poppinsFont.copyWith(
                                              fontSize: 10),
                                        ),
                                      ],
                                    ),
                                    trailing: Icon(Icons.arrow_forward_ios)),
                              )))
                          .toList());
                } else {
                  return loadingFadingCircle;
                }
              },
            )
          ]),
        ),
      ),
    );
  }
}
