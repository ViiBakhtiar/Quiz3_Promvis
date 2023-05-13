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
            title: Text('My App P2P'),
            actions: <Widget>[ButtonNamaKelompok(), ButtonPerjanjian()]),
        body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
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


class ButtonNamaKelompok extends StatelessWidget {
  const ButtonNamaKelompok({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.account_circle_rounded),
      onPressed: () {
        // icon account di tap
        showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text('Kelompok 18'),
            content: const Text('Muhamad Fikri Nur Bakhtiar (fikribakhtiar62@upi.edu) ; Ellsya Nabella Nurallifa (ellsyanabella13@upi.edu)'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'OK'),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      },
    );
  }
}


class ButtonPerjanjian extends StatelessWidget {
  const ButtonPerjanjian({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.access_alarm_rounded),
      onPressed: () {
        // icon setting ditap
        const snackBar = SnackBar(
          duration: Duration(seconds: 20),
          content: Text('Kami berjanji  tidak akan berbuat curang dan atau membantu kelompok lain berbuat curang'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
    );
  }
}
