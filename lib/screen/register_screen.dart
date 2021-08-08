part of "screen.dart";

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String gender = "M";

  @override
  Widget build(BuildContext context) {
    return PublicLayout(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.start,
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
                    margin: EdgeInsets.fromLTRB(26, 20, 0, 0),
                    child: Icon(Icons.arrow_back_ios_new),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 4.3,
                ),
                Text(
                  "Registrasi",
                  style: poppinsFont.copyWith(
                      fontWeight: FontWeight.bold, fontSize: 20),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            labelText('Nomor KTP'),
            Container(
              width: double.infinity,
              margin: EdgeInsets.fromLTRB(16, 0, 16, 0),
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.black),
              ),
              child: TextField(
                decoration: InputDecoration(
                    border: InputBorder.none, hintText: 'Nomor KTP'),
              ),
            ),
            labelText("Nama"),
            inputText(false),
            labelText("Jenis Kelamin"),
            Container(
              margin: EdgeInsets.fromLTRB(16, 0, 16, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  (gender == "M")
                      ? Container(
                          width: widthSize(context) / 2.3,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: primaryColor,
                              border: Border.all(color: primaryColor)),
                          height: 50,
                          child: Center(
                              child: Text(
                            "Laki-laki",
                            style: poppinsFont.copyWith(color: Colors.white),
                          )),
                        )
                      : GestureDetector(
                        onTap: (){
                          setState(() {
                            gender = "M";
                          });
                        },
                        child: Container(
                            width: widthSize(context) / 2.3,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: backgroundColor,
                                border: Border.all(color: primaryColor)),
                            height: 50,
                            child: Center(
                                child: Text(
                              "Laki-laki",
                              style: poppinsFont.copyWith(color: primaryColor),
                            )),
                          ),
                      ),
                  (gender == "F")
                      ? Container(
                          width: widthSize(context) / 2.3,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: primaryColor,
                              border: Border.all(color: primaryColor)),
                          height: 50,
                          child: Center(
                              child: Text(
                            "Perempuan",
                            style: poppinsFont.copyWith(color: Colors.white),
                          )),
                        )
                      : GestureDetector(
                        onTap: (){
                          setState(() {
                            gender = "F";
                          });
                        },
                        child: Container(
                            width: widthSize(context) / 2.3,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: backgroundColor,
                                border: Border.all(color: primaryColor)),
                            height: 50,
                            child: Center(
                                child: Text(
                              "Perempuan",
                              style: poppinsFont.copyWith(color: primaryColor),
                            )),
                          ),
                      ),
                ],
              ),
            ),
            labelText("Alamat"),
            inputText(false),
            labelText("No Telp"),
            phoneText(),
            labelText("Username"),
            inputText(false),
            labelText("Password"),
            inputText(true),
            labelText("Ulangi Password"),
            inputText(true),
            SizedBox(
              height: 20,
            ),
            Container(
                margin: EdgeInsets.fromLTRB(16, 0, 16, 0),
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(primary: primaryColor),
                    child: Text(
                      "Daftar",
                      style: poppinsFont,
                    ))),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  labelText(title) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.fromLTRB(16, 15, 0, 4),
      child: Text(
        title,
        style: poppinsFont.copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }

  inputText(obsecure) {
    return Column(children: [
      Container(
        width: double.infinity,
        margin: EdgeInsets.fromLTRB(16, 0, 16, 0),
        padding: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.black),
        ),
        child: TextFormField(
          obscureText: obsecure,

          decoration: InputDecoration(
            border: InputBorder.none,
          ),
        ),
      ),
    ]);
  }

    phoneText() {
    return Column(children: [
      Container(
        width: double.infinity,
        margin: EdgeInsets.fromLTRB(16, 0, 16, 0),
        padding: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.black),
        ),
        child: TextFormField(
          keyboardType: TextInputType.phone,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly
          ],
          decoration: InputDecoration(
            border: InputBorder.none,
          ),
        ),
      ),
    ]);
  }
}
