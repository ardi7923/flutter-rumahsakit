part of "screen.dart";

class SigninScreen extends StatefulWidget {
  final bool register;

  SigninScreen({required this.register});
  @override
  _SigninScreenState createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoading = false;
  final authData = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          color: backgroundColor,
          child: Column(
            children: [
              Row(
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
                      margin: EdgeInsets.fromLTRB(26, 40, 0, 0),
                      child: Icon(Icons.arrow_back_ios_new),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 15,
              ),
              Image.asset("assets/logo_kepulauan_yapen.png", width: 120),
              SizedBox(height: 10),
              Container(
                width: double.infinity,
                margin: EdgeInsets.fromLTRB(16, 26, 0, 0),
                child: Text(
                  'Username',
                  style: poppinsFont.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.fromLTRB(16, 0, 16, 15),
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.black),
                ),
                child: TextField(
                  controller: usernameController,
                  decoration: InputDecoration(
                      border: InputBorder.none, hintText: 'Masukkan Username'),
                ),
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.fromLTRB(16, 8, 0, 0),
                child: Text(
                  'Password',
                  style: poppinsFont.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.fromLTRB(16, 0, 16, 0),
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.black),
                ),
                child: TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                      border: InputBorder.none, hintText: 'Masukkan Password'),
                ),
              ),
              (!isLoading)
                  ? Container(
                      width: double.infinity,
                      margin:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                      child: ElevatedButton(
                          style:
                              ElevatedButton.styleFrom(primary: primaryColor),
                          onPressed: () {
                            setState(() {
                              isLoading = true;
                            });
                            _submitButton(usernameController.text.toString(),
                                passwordController.text.toString());
                          },
                          child: Text(
                            "Login",
                            style: poppinsFont.copyWith(
                                fontWeight: FontWeight.bold),
                          )))
                  : Container(
                      margin: EdgeInsets.symmetric(vertical: 20),
                      child: loadingFadingCircle),
              SizedBox(height: 10),
              (widget.register)
                  ? Container(
                      margin: EdgeInsets.fromLTRB(16, 0, 16, 0),
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "Belum Punya Akun ?",
                            style: poppinsFont,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                              onTap: () {
                                Get.to(() => RegisterScreen());
                              },
                              child: Text(
                                "Buat Akun",
                                style:
                                    poppinsFont.copyWith(color: primaryColor),
                              ))
                        ],
                      ),
                    )
                  : Container()
            ],
          ),
        ),
      ),
    );
  }

  _submitButton(username, password) async {
    var response = await AuthService.login(username, password);

    if (response.value != null) {
      authData.write('name', response.value["name"]);
      authData.write('token', response.value["token"]);
      authData.write('role', response.value['role']);

      if(response.value['role'] == "patient"){
        Get.offAll(() => ConsultHomeScreen() );
      }
      
    } else {

    }

    setState(() {
      isLoading = false;
    });
  }
}
