part of "layout.dart";

class IlustrationLayout extends StatelessWidget {
  final String title;
  final String? subtitle;
  final String titleButtonPrimary;
  final Function onPressedPrimaryButton;
  final String imagePath;
  final bool secondaryButton;
  final String? titleButtonSecondary;
  final Function? onPressedSecondaryButton;

  IlustrationLayout(
      {required this.title,
      this.subtitle,
      required this.titleButtonPrimary,
      required this.onPressedPrimaryButton,
      required this.imagePath,
      required this.secondaryButton,
      this.titleButtonSecondary,
      this.onPressedSecondaryButton});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: poppinsFont.copyWith(
                  fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 5),
            Text(
              subtitle ?? "",
              style: poppinsFont.copyWith(),
            ),
            SizedBox(height: 50),
            Image.asset(imagePath, width: 230),
            Container(
                margin: EdgeInsets.fromLTRB(16, 50, 16, 20),
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                    onPressed: () {
                      onPressedPrimaryButton();
                    },
                    style: ElevatedButton.styleFrom(primary: primaryColor),
                    child: Text(titleButtonPrimary))),
            (secondaryButton)
                ? Container(
                    width: double.infinity,
                    margin: EdgeInsets.fromLTRB(16, 0, 16, 0),
                    height: 50,
                    child: ElevatedButton(
                        onPressed: () {
                          if (onPressedSecondaryButton != null) {
                            onPressedSecondaryButton!();
                          }
                        },
                        style: ElevatedButton.styleFrom(primary: errorColor),
                        child: Text(titleButtonSecondary ?? "")))
                : Container()
          ],
        ),
      ),
    );
  }
}
