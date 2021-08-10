part of "consult.dart";

class ListScheduleScreen extends StatefulWidget {
  @override
  _ListScheduleScreenState createState() => _ListScheduleScreenState();
}

class _ListScheduleScreenState extends State<ListScheduleScreen> {
  @override
  void initState() {
    super.initState();
    context.read<PatientScheduleCubit>().getPatientSchedule();
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
                Get.to(() => ConsultHomeScreen());
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
            BlocBuilder<PatientScheduleCubit, PatientScheduleState>(
              builder: (context, state) {
                if (state is PatientScheduleLoaded) {
                  return ListView(
                    children: state.patientSchedules
                        .where((element) =>
                            element.expire == ScheduleExpire.unexpired)
                        .map((e) => Card(
                            elevation: 8,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            child: InkWell(
                              borderRadius: BorderRadius.circular(15),
                              splashColor: primaryColor,
                              onTap: () {},
                              child: ListTile(
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 10),
                                leading: Container(
                                  width: 60,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.grey,
                                      image: DecorationImage(
                                          image: NetworkImage(e.image),
                                          fit: BoxFit.fitHeight)),
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
                                      DateFormat("dd-MM-yyyy").format(e.date),
                                      style: poppinsFont.copyWith(fontSize: 10),
                                    ),
                                    Text(
                                      e.time,
                                      style: poppinsFont.copyWith(fontSize: 10),
                                    ),
                                    Text(
                                      e.specialist,
                                      style: poppinsFont.copyWith(fontSize: 10),
                                    ),
                                  ],
                                ),
                                trailing: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    (e.status == ScheduleStatus.unavailable)
                                        ? Text(
                                            "Belum  dikonfirmasi",
                                            style: poppinsFont.copyWith(
                                                fontSize: 8,
                                                color: Colors.red,
                                                fontWeight: FontWeight.bold),
                                          )
                                        : Text(
                                            "Telah dikonfirmasi",
                                            style: poppinsFont.copyWith(
                                                fontSize: 8,
                                                color: Colors.green,
                                                fontWeight: FontWeight.bold),
                                          )
                                  ],
                                ),
                              ),
                            )))
                        .toList(),
                  );
                } else {
                  return loadingFadingCircle;
                }
              },
            ),
            BlocBuilder<PatientScheduleCubit, PatientScheduleState>(
              builder: (context, state) {
                if (state is PatientScheduleLoaded) {
                  return ListView(
                      children: state.patientSchedules
                          .where((element) =>
                              element.expire == ScheduleExpire.expired)
                          .map((e) => Card(
                              elevation: 8,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              child: InkWell(
                                borderRadius: BorderRadius.circular(15),
                                splashColor: primaryColor,
                                onTap: () {},
                                child: ListTile(
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 10),
                                  leading: Container(
                                    width: 60,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.grey,
                                        image: DecorationImage(
                                            image: NetworkImage(e.image),
                                            fit: BoxFit.fitHeight)),
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
                                        DateFormat("dd-MM-yyyy").format(e.date),
                                        style:
                                            poppinsFont.copyWith(fontSize: 10),
                                      ),
                                      Text(
                                        e.time,
                                        style:
                                            poppinsFont.copyWith(fontSize: 10),
                                      ),
                                      Text(
                                        e.specialist,
                                        style:
                                            poppinsFont.copyWith(fontSize: 10),
                                      ),
                                    ],
                                  ),
                                ),
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
