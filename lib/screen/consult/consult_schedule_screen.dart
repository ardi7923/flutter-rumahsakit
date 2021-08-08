part of 'consult.dart';

class ConsultScheduleScreen extends StatefulWidget {

  @override
  _ConsultScheduleScreenState createState() => _ConsultScheduleScreenState();
}

class _ConsultScheduleScreenState extends State<ConsultScheduleScreen> {
  @override
  Widget build(BuildContext context) {
    return PublicLayout(
      child: Stack(
        children: [
          Image.asset("assets/about_us.jpeg"),
        ],
      ),
    );
  }
}