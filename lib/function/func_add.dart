import 'package:uas_kelompok3/function/func_handleNull.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:developer';
import 'package:fluttertoast/fluttertoast.dart';
import 'func_isLoading.dart';

addData(context, jdl, description, pathImg, tgl, tglAkhir) async {
  //handle data kosong
  if (jdl == null || description == null || pathImg == null) {
    handle("Semua data harus diisi!");
  } else {
    //jika data tidak kosong, loading lalu pushnamed ke fungsi read
    isLoading(context);
    String imgName = pathImg.path.split('/').last;
    FormData sendData = FormData.fromMap({
      "judul": description.toString(),
      "deskripsi": description.toString(),
      "url_image": await MultipartFile.fromFile(pathImg.path,
          filename: imgName.toString()),
      "tanggal_awal": tgl.toString(),
      "tanggal_akhir": tglAkhir.toString(),
    });
    final InkResponse =
        await Dio().post("https://tifrp20a.my.id/6/add.php", data: sendData);
    log("test send data :" + jdl.toString());
    return Navigator.of(context)
        .pushNamedAndRemoveUntil('/read', (Route<dynamic> route) => false);
  }
}
