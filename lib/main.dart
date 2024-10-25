import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "Input Text, Alert & Snackbar",
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String str = "";
  final TextEditingController textController = TextEditingController();
  final TextEditingController alertController = TextEditingController(); // Controller untuk Alert

  void _alertdialog(String value) {
    if (value.isEmpty) return;

    AlertDialog alertDialog = AlertDialog(
      content: Text(
        value,
        style: TextStyle(fontSize: 20.0),
      ),
      actions: <Widget>[
        RaisedButton{
        color=Colors.purple,
          child
        },
      ],
    );

    showDialog(builder: (context) => alertDialog, context: context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("INPUT TEXT, ALERT DIALOG & SNACKBAR"),
        backgroundColor: Colors.purple,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: textController, // Mengatur controller untuk input biasa
              decoration: InputDecoration(
                hintText: "tulis di sini",
              ),
              onSubmitted: (String value) {
                setState(() {
                  str = value + '\n' + str; // Menggunakan str yang benar
                  textController.clear(); // Mengosongkan teks setelah submit
                });
              },
            ),
            SizedBox(height: 20), // Menambahkan jarak
            TextField(
              controller: alertController, // Mengatur controller untuk alert
              decoration: InputDecoration(
                hintText: "tulis untuk Alert...",
              ),
              onSubmitted: (String value) {
                _alertdialog(value);
                alertController.clear(); // Mengosongkan teks setelah submit
              },
            ),
            SizedBox(height: 20), // Menambahkan jarak
            Text(
              str,
              style: TextStyle(fontSize: 20.0),
            ),
          ],
        ),
      ),
    );
  }
}
