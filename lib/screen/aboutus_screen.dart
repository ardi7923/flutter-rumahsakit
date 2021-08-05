part of "screen.dart";

class AboutusScreen extends StatefulWidget {
  @override
  _AboutusScreenState createState() => _AboutusScreenState();
}

class _AboutusScreenState extends State<AboutusScreen> {
  @override
  Widget build(BuildContext context) {
    return PublicLayout(
      child: SingleChildScrollView(
        child: Stack(
          children: [
            Image.asset("assets/about_us.jpeg"),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Get.offNamed("/home");
                      },
                      child: Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(20)),
                        margin: EdgeInsets.fromLTRB(26, 20, 0, 0),
                        child: Icon(
                          Icons.arrow_back_ios_new,
                          color: Colors.white.withOpacity(0.5),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 4.5,
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Tentang Kami",
                        style: poppinsFont.copyWith(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      SizedBox(height: 20),
                      dataInformation(
                          "Nama Instansi", "Rumah Sakit Umum Daerah Serui"),
                      dataInformation("Alamat",
                          "JL. Dokter Sam Ratulangi, Serui Kota, Yapen Selatan, Kabupaten Kepulauan Yapen, Papua"),
                      dataInformation("Nomor Telepon", "(0983) - 31128"),
                      dataInformation("Kode Pos", "98213")
                    ],
                  ), 
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget dataInformation(String title, value) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: poppinsFont.copyWith(fontWeight: FontWeight.bold),
          ),
          Text(
            value,
            style: poppinsFont,
          )
        ],
      ),
    );
  }
}
