part of "widget.dart";

class CardMenu extends StatelessWidget {

  final String image;
  final String title;
  final Function? onTap;
  
  CardMenu({required this.image, required this.title, this.onTap});
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2.4,
      height: MediaQuery.of(context).size.height / 4.5,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20)
        ),
        elevation: 8,
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          splashColor: primaryColor,
          onTap: (){
             if(onTap != null){
               onTap!();
             }
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(height: 10),
              Image.asset(
                image,
                width: 60,
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 10, 0, 5),
                child: Text(
                  title,
                  style: poppinsFont.copyWith(fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
