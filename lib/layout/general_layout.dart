part of "layout.dart";

class GeneralLayout extends StatelessWidget {
  final Widget child;
  final Function? onBackPressed;
  GeneralLayout({ required this.child, this.onBackPressed});
  @override
  Widget build(BuildContext context) {
    return PublicLayout(
      
      child: child,
    );
  }
}
