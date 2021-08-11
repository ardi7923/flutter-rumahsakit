part of "screen.dart";

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String gender = "M";
  final _formKey = new GlobalKey<FormState>();
  String? validationKtpNumber;
  String? validationUsername;
  bool isLoading = false;
  DateTime selectedDate = DateTime.now();

  TextEditingController ktpNumberController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController repetPasswordController = TextEditingController();

  /*
   * date picker 
   */
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1960, 8),
        lastDate: DateTime(2022));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return PublicLayout(
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      Get.to(() => SigninScreen(
                            register: true,
                          ));
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
                child: TextFormField(
                  controller: ktpNumberController,
                  decoration: InputDecoration(
                      border: InputBorder.none, hintText: 'Nomor KTP'),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  onChanged: (value) {
                    setState(() {
                      validationKtpNumber = null;
                    });
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Isian Tidak Boleh Kosong";
                    }

                    if (validationKtpNumber != null) {
                      return validationKtpNumber;
                    }
                  },
                ),
              ),
              labelText("Nama"),
              inputText(false, nameController),
              labelText("Jenis Kelamin"),
              Container(
                margin: EdgeInsets.fromLTRB(16, 0, 16, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    (gender == "M")
                        ? Container(
                            width: widthScreen(context) / 2.3,
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
                            onTap: () {
                              setState(() {
                                gender = "M";
                              });
                            },
                            child: Container(
                              width: widthScreen(context) / 2.3,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: backgroundColor,
                                  border: Border.all(color: primaryColor)),
                              height: 50,
                              child: Center(
                                  child: Text(
                                "Laki-laki",
                                style:
                                    poppinsFont.copyWith(color: primaryColor),
                              )),
                            ),
                          ),
                    (gender == "F")
                        ? Container(
                            width: widthScreen(context) / 2.3,
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
                            onTap: () {
                              setState(() {
                                gender = "F";
                              });
                            },
                            child: Container(
                              width: widthScreen(context) / 2.3,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: backgroundColor,
                                  border: Border.all(color: primaryColor)),
                              height: 50,
                              child: Center(
                                  child: Text(
                                "Perempuan",
                                style:
                                    poppinsFont.copyWith(color: primaryColor),
                              )),
                            ),
                          ),
                  ],
                ),
              ),
              labelText("Tanggal Lahir"),
              GestureDetector(
                onTap: () {
                  _selectDate(context);
                },
                child: Container(
                  margin: EdgeInsets.fromLTRB(16, 0, 16, 0),
                  width: double.infinity,
                  height: 50,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.black),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        DateFormat("dd-MM-yyyy").format(selectedDate),
                        style: poppinsFont,
                      ),
                    ],
                  ),
                ),
              ),
              labelText("Alamat"),
              inputText(false, addressController),
              labelText("No Telp"),
              phoneText(),
              labelText("Username"),
              Container(
                width: double.infinity,
                margin: EdgeInsets.fromLTRB(16, 0, 16, 0),
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.black),
                ),
                child: TextFormField(
                  controller: usernameController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  onChanged: (value) {
                    setState(() {
                      validationUsername = null;
                    });
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Isian Tidak Boleh Kosong";
                    }

                    if (validationKtpNumber != null) {
                      return validationUsername;
                    }
                  },
                ),
              ),
              labelText("Password"),
              inputText(true, passwordController),
              labelText("Ulangi Password"),
              Container(
                width: double.infinity,
                margin: EdgeInsets.fromLTRB(16, 0, 16, 0),
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.black),
                ),
                child: TextFormField(
                  controller: repetPasswordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Isian Tidak Boleh Kosong";
                    }
                    if (value != passwordController.text) {
                      return "Password Tidak Sama";
                    }
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              (!isLoading)
                  ? Container(
                      margin: EdgeInsets.fromLTRB(16, 0, 16, 0),
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () async {
                            final form = _formKey.currentState;

                            if (form!.validate()) {
                              var response = await RegisterService.registrasion(
                                  ktpNumberController.text,
                                  nameController.text,
                                  DateFormat("yyyy-MM-dd").format(selectedDate).toString(),
                                  gender,
                                  addressController.text,
                                  phoneController.text,
                                  usernameController.text,
                                  passwordController.text,
                                  repetPasswordController.text);

                              if (response.value != null) {
                                authData.write('name', response.value["name"]);
                                authData.write(
                                    'token', response.value["token"]);
                                authData.write('role', response.value['role']);

                                Get.offAll(() => ConsultHomeScreen(),transition: transitionZoom);
                              } else {
                                setState(() {
                                  isLoading = false;
                                });
                              }
                            }
                          },
                          style:
                              ElevatedButton.styleFrom(primary: primaryColor),
                          child: Text(
                            "Daftar",
                            style: poppinsFont,
                          )))
                  : loadingFadingCircle,
              SizedBox(
                height: 20,
              ),
            ],
          ),
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

  inputText(obsecure, controller) {
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
          controller: controller,
          obscureText: obsecure,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: InputDecoration(
            border: InputBorder.none,
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return "Isian Wajib Diisi";
            }
          },
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
          controller: phoneController,
          keyboardType: TextInputType.phone,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          decoration: InputDecoration(
            border: InputBorder.none,
          ),
        ),
      ),
    ]);
  }
}
