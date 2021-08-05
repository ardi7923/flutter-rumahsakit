part of "layout.dart";

class PublicLayout extends StatelessWidget {
  final Widget appBar;
  final Widget child;

  PublicLayout({this.appBar,this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: appBar,
      body: SafeArea(
        
        child: Container(
          color: backgroundColor,
          child: child,
        ),
      ),
    );
  }
}