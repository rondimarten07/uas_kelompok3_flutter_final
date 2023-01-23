// ignore_for_file: prefer_const_constructors

import 'dart:developer';
import 'package:flutter/material.dart';
import 'function/func_read.dart';
import 'package:uas_kelompok3/function/func_getImage.dart';
import 'function/func_edit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'dart:developer';

class Edit extends StatefulWidget {
  const Edit({super.key});

  @override
  State<Edit> createState() => _EditState();
}

class _EditState extends State<Edit> {
  String? gambar;

  DateTime? dateTimenow = DateTime.now(), dateTimeTommorow, picked_date;
  DateTime? dateTimenow2 = DateTime.now(), dateTimeTommorow2, picked_date2;
  var year, month, day;
  var year2, month2, day2;

  TextEditingController ctl_tgl = TextEditingController();
  TextEditingController ctl_tglAkhir = TextEditingController();
//Tanggal
  Future<Null> getDate(BuildContext context) async {
    picked_date = await showDatePicker(
        context: context,
        initialDate: dateTimenow!,
        firstDate: DateTime(dateTimenow!.year - 1),
        lastDate: DateTime(dateTimenow!.year + 1));

    if (picked_date != null && picked_date != dateTimenow) {
      ctl_tgl.text = picked_date.toString().substring(0, 10);
    }
  }

  void dateTime_method() {
    dateTimenow = new DateTime.now();
    dateTimeTommorow = dateTimenow!.add(const Duration(days: 1));
    year = dateTimeTommorow!.year;
    month = dateTimeTommorow!.month;
    day = dateTimeTommorow!.day;

    log("year" + year.toString());
    log("month" + month.toString());
    log("day" + day.toString());
  }
  //Akhir tanggal

  Future<Null> getDate2(BuildContext context) async {
    picked_date2 = await showDatePicker(
        context: context,
        initialDate: dateTimenow2!,
        firstDate: DateTime(dateTimenow2!.year - 1),
        lastDate: DateTime(dateTimenow2!.year + 1));

    if (picked_date2 != null && picked_date2 != dateTimenow2) {
      ctl_tglAkhir.text = picked_date2.toString().substring(0, 10);
    }
  }

  void dateTime_method2() {
    dateTimenow2 = new DateTime.now();
    dateTimeTommorow2 = dateTimenow2!.add(const Duration(days: 1));
    year2 = dateTimeTommorow2!.year;
    month2 = dateTimeTommorow2!.month;
    day2 = dateTimeTommorow2!.day;

    log("year" + year2.toString());
    log("month" + month2.toString());
    log("day" + day2.toString());
  }

  @override
  void initState() {
    setState(() {
      file = null;
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ListCloud detailEdit =
        ModalRoute.of(context)!.settings.arguments as ListCloud;

    TextEditingController ctl_judul =
        TextEditingController(text: detailEdit.title);
    TextEditingController ctl_deskrpsi =
        TextEditingController(text: detailEdit.desc);
    TextEditingController ctl_gambar = TextEditingController();
    ctl_tgl.text = detailEdit.tglAwal;
    ctl_tglAkhir.text = detailEdit.tglAkhir;

    if (file != null) {
      gambar = nameFile;
    } else {
      gambar = detailEdit.img.toString();
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: Text(detailEdit.title.toString()),
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Center(
                    child: TextField(
                      controller: ctl_judul,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Judul',
                        hintText: "Isi data judul",
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Center(
                        child: Container(
                          width: 200,
                          height: 200,
                          decoration: BoxDecoration(
                              border:
                                  Border.all(width: 2, color: Colors.black)),
                          child: Padding(
                            padding: const EdgeInsets.all(36.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 2, color: Colors.black)),
                              child: Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: IconButton(
                                      icon: Icon(
                                        Icons.camera_alt_outlined,
                                        size: 30,
                                      ),
                                      onPressed: () {
                                        alertAdd();
                                      })),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Center(
                    child: Text(gambar.toString().split('/').last),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Center(
                    child: TextField(
                      controller: ctl_deskrpsi,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Deksirpsi',
                        hintText: "Isi data deskripsi",
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: TextField(
                          controller: ctl_tgl,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Isi tgl awal',
                            hintText: "yyyy-dd-mm",
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 8.0),
                        child: SizedBox(
                          height: 50,
                          child: Expanded(
                              child: MaterialButton(
                            onPressed: () => getDate(context),
                            child: Text("Choose"),
                            color: Colors.blue,
                            textColor: Colors.white,
                          )),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: TextField(
                          controller: ctl_tglAkhir,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Isi tgl akhir',
                            hintText: "yyyy-dd-mm",
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 8.0),
                        child: SizedBox(
                          height: 50,
                          child: Expanded(
                              child: MaterialButton(
                            onPressed: () => getDate2(context),
                            child: Text("Choose"),
                            color: Colors.blue,
                            textColor: Colors.white,
                          )),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: MaterialButton(
                      color: Colors.green,
                      textColor: Colors.white,
                      onPressed: () {
                        editData(
                            context,
                            detailEdit.id,
                            ctl_judul.text,
                            ctl_deskrpsi.text,
                            file,
                            ctl_tgl.text,
                            ctl_tglAkhir.text);
                      },
                      child: Text("Simpan"),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }

  void alertAdd() {
    Widget buttonKamera = MaterialButton(
        onPressed: () {
          Navigator.pop(context);
          takePicture(ImageSource.camera, setState);
        },
        child: const Text('Kamera'));
    Widget buttonGaleri = MaterialButton(
        onPressed: () {
          Navigator.pop(context);
          takePicture(ImageSource.gallery, setState);
        },
        child: const Text('Galeri'));

    AlertDialog pilihgambar = AlertDialog(
      title: Text("Pilih Foto"),
      content: Text("Silahkan pilih foto anda !"),
      actions: [buttonGaleri, buttonKamera],
    );

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return pilihgambar;
        });
  }
}
