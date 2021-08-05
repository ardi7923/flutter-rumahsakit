part of "screen.dart";

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  splashscreenStart() async {
    var duration = const Duration(seconds: 3);
    return Timer(duration, () async {
      Get.offAndToNamed('/home');
    });
  }

  @override
  void initState() {
    super.initState();

    splashscreenStart();
  }

  Widget build(BuildContext context) {
    return Center(
      child: Container(
          height: double.infinity,
          width: double.infinity,
          color: secondaryColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/icons/hospital.png",
                width: 100,
              ),
              SizedBox(
                height: 30,
              ),
              SpinKitCircle(
                size: 50,
                color: Colors.white,
              )
            ],
          )),
    );
  }
}
