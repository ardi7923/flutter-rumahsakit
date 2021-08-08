part of "consult.dart";

class ConsultDoctorScreen extends StatefulWidget {
  @override
  _ConsultDoctorScreenState createState() => _ConsultDoctorScreenState();
}

class _ConsultDoctorScreenState extends State<ConsultDoctorScreen> {
  DateTime selectedDate = DateTime.now();
  String? name;
  String? specialist;
  /*
   * date picker 
   */
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return PublicLayout(
      appBar: AppBar(
        elevation: 8,
        backgroundColor: primaryColor,
        title: Text(
          "Pilih Dokter",
          style: poppinsFont.copyWith(
              color: Colors.black, fontWeight: FontWeight.bold),
        ),
        leading: InkWell(
            onTap: () {
              Get.to(() => ConsultHomeScreen());
            },
            child: Icon(
              Icons.arrow_back_ios_new_sharp,
              color: Colors.black,
            )),
      ),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: ListView(
          children: [
            Card(
                elevation: 8,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: InkWell(
                  borderRadius: BorderRadius.circular(15),
                  splashColor: primaryColor,
                  onTap: () {
                    
                    setState(() {
                      name     = "Dr.Sumarjo";
                    specialist = "THT";  
                    });
                    showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 10),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  height: 8,
                                  width: 80,
                                  decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(20)),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Dokter",
                                      style: poppinsFont.copyWith(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      name!,
                                      style: poppinsFont,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Spesialis",
                                      style: poppinsFont.copyWith(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      specialist!,
                                      style: poppinsFont,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Pilih Tanggal",
                                      style: poppinsFont.copyWith(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        _selectDate(context);
                                      },
                                      child: Container(
                                        margin: EdgeInsets.only(top: 6),
                                        width: 120,
                                        height: 50,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          border:
                                              Border.all(color: Colors.black),
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              DateFormat("dd-MM-yyyy")
                                                  .format(selectedDate),
                                              style: poppinsFont,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 20),
                                Container(
                                  width: double.infinity,
                                  
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: primaryColor
                                    ),
                                      onPressed: () {
                                        Get.to(()=> ConsultScheduleScreen());
                                      },
                                      child: Text(
                                        "Cek Jadwal",
                                      )),
                                )
                              ],
                            ),
                          );
                        });
                  },
                  child: ListTile(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    leading: Image.asset(
                      "assets/icons/list_schedule.png",
                      width: 40,
                    ),
                    title: Text(
                      "Dr. Sumarjo",
                      style: poppinsFont.copyWith(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Spesialis THT",
                          style: poppinsFont.copyWith(fontSize: 10),
                        ),
                      ],
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
