part of "layout.dart";

class GeneralLayout extends StatelessWidget {
  final Widget child;
  final Function onBackPressed;
  GeneralLayout({this.child, this.onBackPressed});
  @override
  Widget build(BuildContext context) {
    return PublicLayout(
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 8,
        leading: InkWell(
            onTap: () {
              if(onBackPressed != null){
                onBackPressed();
              }
            },
            child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.black,
                ))),
        title: Text(
          "Data Pasien",
          style: poppinsFont.copyWith(
              color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      child: child,
    );
  }
}
