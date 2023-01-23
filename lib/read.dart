// ignore_for_file: sort_child_properties_last

import 'dart:developer';
import 'package:flutter/material.dart';
import 'function/func_logout.dart';
import 'function/func_read.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'dart:convert';

class Read extends StatefulWidget {
  const Read({super.key});

  @override
  State<Read> createState() => _ReadState();
}

class _ReadState extends State<Read> {
  String qsearch = "";
  List<ListCloud> data = <ListCloud>[];

  @override
  void initState() {
    //inisialisasi awal disini
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController searchingController = TextEditingController();

    return WillPopScope(
      onWillPop: () async => false, //disable back from back on home android
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.pushNamed(context, '/add');
            },
            child: const Icon(Icons.add),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: TextField(
                    controller: searchingController,
                    onChanged: (value) {
                      EasyDebounce.debounce(
                          'my-search', // <-- An ID for this particular debouncer
                          const Duration(
                              milliseconds: 500), // <-- The debounce duration
                          () async {
                        log("SEARCH ${searchingController.text}");
                        setState(() {
                          qsearch = searchingController.text;
                        });
                      });
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Cari data berdasarkan judul',
                    ),
                  ),
                ),
                Center(
                  child: FutureBuilder<List<ListCloud>>(
                      future: read(qsearch.toString()),
                      builder: (inContext, snapshot) {
                        if (snapshot.connectionState != ConnectionState.done) {
                          return const CircularProgressIndicator();
                        } else {
                          log("TEST bb ${snapshot.data}");
                        }
                        log("TEST $snapshot");
                        List<Widget> tempChildren = <Widget>[];
                        if (snapshot.hasData) {
                          for (var item in snapshot.data!) {
                            Widget child = GestureDetector(
                              child: Card(
                                margin: EdgeInsets.all(10.0),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0)),
                                elevation: 5.0,
                                child: Container(
                                  decoration: const BoxDecoration(
                                    gradient: LinearGradient(
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                        colors: [Colors.blue, Colors.white54]),
                                  ),
                                  child: ListTile(
                                    leading: Container(
                                        width: 60.0,
                                        height: 60.0,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          border: Border.all(
                                              color: Colors.blue, width: 2.0),
                                        ),
                                        child: Image.network(
                                          item.img,
                                          fit: BoxFit.cover,
                                        )),
                                    title: Text(item.title),
                                    subtitle: Text(item.desc),
                                    trailing: Text(
                                        item.tglAwal + "- \n" + item.tglAkhir),
                                  ),
                                  padding: const EdgeInsets.only(
                                      top: 3, left: 2, right: 2, bottom: 3),
                                  margin: const EdgeInsets.only(bottom: 0),
                                ),
                              ),
                              onTap: () async {
                                Navigator.pushNamed(context, '/detail',
                                    arguments: {
                                      "data": ListCloud(
                                          id: item.id,
                                          title: item.title,
                                          desc: item.desc,
                                          img: item.img,
                                          tglAwal: item.tglAwal,
                                          tglAkhir: item.tglAkhir)
                                    });
                                setState(() {
                                  qsearch = "";
                                });
                              },
                            );
                            tempChildren.add(child);
                          }
                          return Column(
                            children: tempChildren,
                          );
                        } else {
                          return const Text("NO DATA");
                        }
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
