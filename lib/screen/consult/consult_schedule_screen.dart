part of 'consult.dart';

class ConsultScheduleScreen extends StatefulWidget {
  final Doctor doctor;
  final DateTime selectedDate;
  ConsultScheduleScreen({required this.doctor, required this.selectedDate});

  @override
  _ConsultScheduleScreenState createState() => _ConsultScheduleScreenState();
}

class _ConsultScheduleScreenState extends State<ConsultScheduleScreen> {
  int? scheduleId;
  bool isLoading = false;
  String? errorValidation;

  @override
  void initState() {
    super.initState();
    context
        .read<ScheduleCubit>()
        .getSchedule(widget.doctor.id, widget.selectedDate);
  }

  Widget build(BuildContext context) {
    return PublicLayout(
      child: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: 210,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(widget.doctor.image),
                      fit: BoxFit.fitHeight)),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(20)),
                    margin: EdgeInsets.fromLTRB(26, 20, 0, 0),
                    child: Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.white.withOpacity(0.5),
                    ),
                  ),
                ),
                SizedBox(height: 175),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Nama Dokter",
                            style: poppinsFont.copyWith(
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            widget.doctor.name,
                            style: poppinsFont,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Specialist",
                            style: poppinsFont.copyWith(
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            widget.doctor.specialist,
                            style: poppinsFont,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Tanggal",
                            style: poppinsFont.copyWith(
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            DateFormat("dd-MM-yyyy")
                                .format(widget.selectedDate),
                            style: poppinsFont,
                          )
                        ],
                      ),
                      Divider(
                        height: 2,
                      ),
                      SizedBox(height: 20),
                      Text(
                        "Pilih Waktu",
                        style:
                            poppinsFont.copyWith(fontWeight: FontWeight.bold),
                      ),
                      BlocBuilder<ScheduleCubit, ScheduleState>(
                          builder: (context, state) {
                        if (state is ScheduleLoaded) {
                          return Container(
                              margin: EdgeInsets.only(top: 10),
                              height: 170,
                              child: GridView.count(
                                crossAxisCount: 3,
                                childAspectRatio: 3,
                                mainAxisSpacing: 10,
                                crossAxisSpacing: 5,
                                children: state.schedules.map((e) {
                                  print(e);
                                  return (e.status == ScheduleStatus.available)
                                      ? (scheduleId == e.id)
                                          ? Container(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 5, horizontal: 10),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: primaryColor,
                                              ),
                                              child: Center(
                                                child: Text(
                                                  e.time,
                                                  style: poppinsFont.copyWith(
                                                      color: Colors.white),
                                                ),
                                              ),
                                            )
                                          : GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  scheduleId = e.id;
                                                });
                                              },
                                              child: Container(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 5,
                                                    horizontal: 10),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: Colors.grey
                                                      .withOpacity(0.5),
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    e.time,
                                                    style: poppinsFont,
                                                  ),
                                                ),
                                              ),
                                            )
                                      : Container(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 5, horizontal: 10),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: errorColor,
                                          ),
                                          child: Center(
                                            child: Text(
                                              e.time,
                                              style: poppinsFont.copyWith(
                                                  color: Colors.white),
                                            ),
                                          ),
                                        );
                                }).toList(),
                              ));
                        } else {
                          return loadingFadingCircle;
                        }
                      })
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: (!isLoading)
          ? Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               (errorValidation != null) ? Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 16,
                    ),
                    child: Text(
                      errorValidation!,
                      style: poppinsFont.copyWith(color: errorColor),
                    )) : Container(),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 15),
                  width: double.infinity,
                  height: 40,
                  child: ElevatedButton(
                      onPressed: () async {
                        setState(() {
                          isLoading = true;
                        });
                        if (scheduleId == null) {
                          setState(() {
                            isLoading = false;
                            errorValidation = "Pilih Waktu Konsultasi";
                          });
                        } else {
                          var response = await SubmissionScheduleService.submit(
                              scheduleId);

                          if (response.value != null) {
                            Get.offAll(() => ConsultSuccessScreen());
                          }
                        }
                      },
                      style: ElevatedButton.styleFrom(primary: primaryColor),
                      child: Text(
                        "Ajukan Jadwal",
                        style:
                            poppinsFont.copyWith(fontWeight: FontWeight.bold),
                      )),
                ),
              ],
            )
          : Container(height: 40, child: loadingFadingCircle),
    );
  }
}
