part of "layout.dart";

class PublicLayout extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final Widget child;
  final Widget? bottomNavigationBar;
  PublicLayout({this.appBar, required this.child, this.bottomNavigationBar});

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
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
