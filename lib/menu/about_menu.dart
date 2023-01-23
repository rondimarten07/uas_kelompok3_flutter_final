import 'package:flutter/material.dart';
import 'package:uas_kelompok3/function/func_logout.dart';
import 'package:uas_kelompok3/list_menu.dart';

class AboutMenu extends StatefulWidget {
  const AboutMenu({super.key});

  @override
  State<AboutMenu> createState() => _AboutMenuState();
}

class _AboutMenuState extends State<AboutMenu> {
  List<Data> data = [
    Data(
        img: "images/profil_rondi.jpg",
        nama: "Rondi",
        npm: "20552011135",
        kelas: "TIF RP-20 A"),
    Data(
        img: "images/Jamjam.jpeg",
        nama: "Jamjam",
        npm: "20552011210",
        kelas: "TIF RP-20 A"),
    Data(
        img: "images/Mustopa.jpeg",
        nama: "Mustopa",
        npm: "20552011131",
        kelas: "TIF RP-20 A"),
    Data(
        img: "images/Salwa.png",
        nama: "Salwa",
        npm: "20552011034",
        kelas: "TIF RP-20 A"),
    Data(
        img: "images/Sopy.png",
        nama: "Sofy ",
        npm: "20552011065",
        kelas: "TIF RP-20 A")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 5.0),
        width: double.infinity, height: double.infinity,
        // ignore: prefer_const_constructors
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          elevation: 10,
          // shadowColor: Colors.blueGrey,
          child: Column(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(top: 20.0),
                child: const Align(
                  alignment: Alignment.center,
                  child: Text(
                    'About Us',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        fontFamily: 'Righteous'),
                  ),
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.only(left: 15.0, right: 15.0, top: 10.0),
                child: const Align(
                  alignment: Alignment.centerLeft,
                  child: Text.rich(
                    TextSpan(
                        text: 'Aplikasi Akademik ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            fontFamily: 'Roboto'),
                        children: <InlineSpan>[
                          TextSpan(
                            text:
                                'Aplikasi ini dibangun untuk memberikan kemudahan kepada pengguna dalam kegiatan administrasi akademik ',
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 14,
                                fontFamily: 'Roboto'),
                          )
                        ]),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  left: 15.0,
                  right: 15.0,
                  top: 5.0,
                ),
                child: const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'dan menampilkan agenda - agenda yang dibuat oleh akademik dengan berbagai menu yaitu :b',
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 14,
                        fontFamily: 'Roboto'),
                  ),
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.only(left: 25.0, right: 15.0, top: 5.0),
                child: const Align(
                  alignment: Alignment.centerLeft,
                  child: Text.rich(
                    TextSpan(
                        text: 'Pertama Home. ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            fontFamily: 'Roboto'),
                        children: <InlineSpan>[
                          TextSpan(
                            text:
                                'Menampilkan kategori data kegiatan yang dibuat oleh akademik berdasarkan bulan.',
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 14,
                                fontFamily: 'Roboto'),
                          )
                        ]),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 25.0, right: 15.0),
                child: const Align(
                  alignment: Alignment.centerLeft,
                  child: Text.rich(
                    TextSpan(
                        text: 'Kedua Calender. ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            fontFamily: 'Roboto'),
                        children: <InlineSpan>[
                          TextSpan(
                            text:
                                'Menampilkan rincian kegiatan dan menambah kegiatan ',
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 14,
                                fontFamily: 'Roboto'),
                          )
                        ]),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 25.0, right: 15.0),
                child: const Align(
                  alignment: Alignment.centerLeft,
                  child: Text.rich(
                    TextSpan(
                        text: 'Ketiga About. ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            fontFamily: 'Roboto'),
                        children: <InlineSpan>[
                          TextSpan(
                            text:
                                'Menampilkan informasi aplikasi dan copyright.',
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 14,
                                fontFamily: 'Roboto'),
                          )
                        ]),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 5.0),
                child: const Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Copyright',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        fontFamily: 'Righteous'),
                  ),
                ),
              ),
              Column(
                  children: data.map((data) {
                return Container(
                  margin: const EdgeInsets.only(left: 5.0),
                  padding: const EdgeInsets.only(left: 5.0),
                  child: ListTile(
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(5.0),
                      child: Image.asset(
                        (data.img),
                      ),
                    ),
                    title: Text(data.nama,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14.0,
                            fontFamily: 'Roboto')),
                    subtitle: Text("${data.npm}\n${data.kelas}",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12.0,
                            fontFamily: 'Roboto')),
                  ),
                );
              }).toList()),
            ],
          ),
        ),
      ),
    );
  }
}
