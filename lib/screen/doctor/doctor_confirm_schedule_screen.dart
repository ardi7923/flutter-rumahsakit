part of "doctor.dart";

class DoctorConfirmScheduleScreen extends StatefulWidget {
  @override
  _DoctorConfirmScheduleScreenState createState() =>
      _DoctorConfirmScheduleScreenState();
}

class _DoctorConfirmScheduleScreenState
    extends State<DoctorConfirmScheduleScreen> {
  @override
  void initState() {
    super.initState();
    context.read<DoctorScheduleCubit>().getDoctorSchedule();
  }

  Widget build(BuildContext context) {
    return PublicLayout(
      appBar: AppBar(
        elevation: 8,
        backgroundColor: primaryColor,
        title: Text(
          "Konfirmasi Jadwal",
          style: poppinsFont.copyWith(
              color: Colors.black, fontWeight: FontWeight.bold),
        ),
        leading: InkWell(
          onTap: () {
            Get.off(() => DoctorHomeScreen());
          },
          child: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
        ),
      ),
      child: BlocBuilder<DoctorScheduleCubit, DoctorScheduleState>(
        builder: (context, state) {
          if (state is DoctorScheduleLoaded) {
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
              child: ListView(
                  children: state.doctorSchedules
                      .where((element) =>
                          element.status == ScheduleStatus.unavailable &&
                          element.expire == ScheduleExpire.unexpired)
                      .map((e) => Card(
                          elevation: 8,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(15),
                            splashColor: primaryColor,
                            onTap: () {
                              Get.to(() =>
                                  DoctorConfirmDetailScreen(doctorSchedule: e,confirm: true,));
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
                                  ],
                                ),
                                trailing: Icon(Icons.arrow_forward_ios)),
                          )))
                      .toList()),
            );
          } else {
            return loadingFadingCircle;
          }
        },
      ),
    );
  }
}
