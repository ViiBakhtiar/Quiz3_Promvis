import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  MyAppState createState() {
    return MyAppState();
  }
}


class MyAppState extends State<MyApp> {
  final textEditController = TextEditingController();
  String _nama = "";
  String pilihanPinjaman = "pertama";
  String pilihanPinjamanlOut = "";

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    textEditController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<DropdownMenuItem<String>> pinjaman = [];
    var itm1 = const DropdownMenuItem<String>(
      value: "pertama",
      child: Text("Pilih Jenis Pinjaman"),
    );
    var itm2 = const DropdownMenuItem<String>(
      value: "kedua",
      child: Text("Jenis pinjaman 1"),
    );
    var itm3 = const DropdownMenuItem<String>(
      value: "ketiga",
      child: Text("Jenis pinjaman 2"),
    );
    var itm4 = const DropdownMenuItem<String>(
      value: "keempat",
      child: Text("Jenis pinjaman 3"),
    );
    pinjaman.add(itm1);
    pinjaman.add(itm2);
    pinjaman.add(itm3);
    pinjaman.add(itm4);

    return MaterialApp(
      title: 'Hello App',
      home: Scaffold(
        appBar: AppBar(
            title: Text('My App P2P')),
        body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all((10)),
                  child: Text('2001123, Muhamad Fikri Nur Bakhtiar; 2009037, Ellsya Nabella Nurallifa; Saya berjanji tidak akan berbuat curang data atau membantu orang berbuat curang'),
                ),
                DropdownButton(
                  value: pilihanPinjaman,
                  items: pinjaman,
                  onChanged: (String? newValue) {
                    setState(() {
                      if (newValue != null) {
                        pilihanPinjaman = newValue;
                      }
                    });
                    width: 80;
                  },
                ),
              ],
            )), //column center
      ), //Scaffold
    ); //Material APP
  }
}


