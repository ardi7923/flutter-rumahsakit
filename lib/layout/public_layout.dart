part of "layout.dart";

class PublicLayout extends StatelessWidget {
  
  final PreferredSizeWidget? appBar;
  final Widget child;
  final Widget? bottomNavigationBar;
  PublicLayout({this.appBar, required this.child, this.bottomNavigationBar});

  

  @override
  Widget build(BuildContext context) {
    DateTime? lastpressed;
    
    return Scaffold(
      appBar: appBar,
      backgroundColor: backgroundColor,
      body: WillPopScope(
        onWillPop: () async {
          final now = DateTime.now();
          final maxDuration = Duration(seconds: 2);
          final isWarning =
              lastpressed == null || now.difference(lastpressed!) > maxDuration;

          if (isWarning) {
            lastpressed = DateTime.now();

            final snackBar = SnackBar(
              content: Text("Double Tap for Close App"),
            );

            ScaffoldMessenger.of(context)
              ..removeCurrentSnackBar()
              ..showSnackBar(snackBar);

            return false;
          } else {
            return true;
          }
        },
        child: SafeArea(
          child: Container(
            color: backgroundColor,
            child: child,
          ),
        ),
      ),
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
