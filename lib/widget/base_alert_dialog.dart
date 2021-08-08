part of 'widget.dart';

class BaseAlertDialog extends StatelessWidget {
  final String title;
  final String content;
  final String yes;
  final String no;
  final Function? yesOnPressed;
  final Function? noOnPressed;

  BaseAlertDialog(
      {required this.title,
      required this.content,
      required this.yes,
      required this.no,
      this.yesOnPressed,
      this.noOnPressed});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      shape:
          RoundedRectangleBorder(borderRadius: new BorderRadius.circular(15)),
      actions: <Widget>[
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              Navigator.of(context, rootNavigator: true).pop(false);
            },
            child: Container(
              width: 70,
              height: 40,
              child: Center(
                  child: Text(
                no,
                style: poppinsFont.copyWith(
                    color: Colors.grey, fontWeight: FontWeight.bold),
              )),
            ),
          ),
        ),
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              if (yesOnPressed != null) {
                yesOnPressed!();
              }
            },
            child: Container(
              width: 70,
              height: 40,
              child: Center(
                  child: Text(
                yes,
                style: poppinsFont.copyWith(
                    color: errorColor, fontWeight: FontWeight.bold),
              )),
            ),
          ),
        ),
      ],
    );
  }
}
