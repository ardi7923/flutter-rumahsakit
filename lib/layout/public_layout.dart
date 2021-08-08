part of "layout.dart";

class PublicLayout extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final Widget child;

  PublicLayout({this.appBar, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Container(
          color: backgroundColor,
          child: child,
        ),
      ),
    );
  }
}
