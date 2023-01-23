import 'package:uas_kelompok3/function/func_handleNull.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:developer';
import 'package:fluttertoast/fluttertoast.dart';
import 'func_isLoading.dart';

addData(context, username, password, name) async {
  //handle data kosong
  if (username == null || password == null || name == null) {
    handle("Semua data harus diisi!");
  } else {
    //jika data tidak kosong, loading lalu pushnamed ke fungsi read
    isLoading(context);

    FormData sendData = FormData.fromMap({
      "user": name.toString(),
      "pwd": name.toString(),
      "nm": name.toString(),
    });
    final InkResponse = await Dio()
        .post("https://tifrp20a.my.id/6/register.php", data: sendData);
    log("test send data :" + username.toString());
    return Navigator.of(context)
        .pushNamedAndRemoveUntil('/login', (Route<dynamic> route) => false);
  }
}
