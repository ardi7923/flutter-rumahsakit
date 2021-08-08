part of "shared.dart";


Color backgroundColor = "#f5f6fa".toColor();
Color secondaryColor = "#8c7ae6".toColor();
Color primaryColor = "#9c88ff".toColor();
Color errorColor = "#D9435E".toColor();

TextStyle poppinsFont = GoogleFonts.poppins();

double widthScreen (context) =>  MediaQuery.of(context).size.width;
double heightScreen (context) =>  MediaQuery.of(context).size.height;

Widget loadingFadingCircle = SpinKitFadingCircle(
    size: 25,
  color: primaryColor
);


final authData = GetStorage();