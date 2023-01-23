import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:developer';

class ListCloud {
  String id, title, desc, img, tglAwal, tglAkhir;
  ListCloud(
      {required this.id,
      required this.title,
      required this.desc,
      required this.img,
      required this.tglAwal,
      required this.tglAkhir});
}

Future<List<ListCloud>> read(query) async {
  List<ListCloud> dataList = <ListCloud>[];
  ListCloud tmpData;
  final response =
      await Dio().get("https://tifrp20a.my.id/6/list.php", queryParameters: {
    "key": query.toString(),
  });
  log("test query: $query");
  log("test read data: ${response.data[0]}");
  var data = response.data;
  log("test decode: $data[0]}");

  if (data.length == 0) {
    return dataList;
  } else {
    List<ListCloud> tdata = [];
    data.forEach((item) {
      tmpData = ListCloud(
          id: item["id"]!,
          title: item["title"]!,
          desc: item["desc"]!,
          img: item["img"]!,
          tglAwal: item["first_date"]!,
          tglAkhir: item["last_date"]!);
      dataList.add(tmpData);
    });
    return dataList;
  }
}
