import 'package:flutter/material.dart';
import 'function/func_read.dart';
import 'function/func_delete.dart';

class Detail extends StatefulWidget {
  Detail({Key? key}) : super(key: key);

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    ListCloud detail = arguments["data"];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: Text(detail.title.toString()),
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          body: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Center(
                  child: Image.network(
                    detail.img.toString(),
                    height: 200,
                  ),
                ),
              ),
              Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    detail.desc.toString(),
                  )),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: MaterialButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/edit',
                            arguments: ListCloud(
                                id: detail.id,
                                title: detail.title,
                                desc: detail.desc,
                                img: detail.img,
                                tglAwal: detail.tglAwal,
                                tglAkhir: detail.tglAkhir));
                      },
                      child: Text("Edit"),
                      color: Colors.green,
                      textColor: Colors.white,
                    )),
                    Expanded(
                        child: MaterialButton(
                      onPressed: () {
                        delete(context, detail.title, detail.id, detail.tglAwal,
                            detail.tglAkhir);
                      },
                      child: Text("Hapus"),
                      color: Colors.red,
                      textColor: Colors.white,
                    )),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
