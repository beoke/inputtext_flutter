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
  String str = ""; // Variabel untuk menyimpan teks yang diinput
  final TextEditingController textController = TextEditingController(); // Controller untuk mengelola input teks biasa
  final TextEditingController alertController = TextEditingController(); // Controller untuk mengelola input teks untuk alert
  final TextEditingController snackbarController = TextEditingController(); // Controller untuk mengelola input teks untuk snackbar

  // Fungsi untuk menampilkan Snackbar
  void _snackbar(String str) {
    if (str.isEmpty) return; // Tidak melakukan apa-apa jika teks kosong

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          str,
          style: TextStyle(fontSize: 20.0), // Mengatur ukuran teks di Snackbar
        ),
        duration: Duration(seconds: 3), // Menambah durasi pada Snackbar yang muncul
      ),
    );
  }

  // Fungsi untuk menampilkan dialog peringatan
  void _alertdialog(String value) {
    if (value.isEmpty) return; // Jika input kosong, tidak melakukan apa-apa

    // Membuat objek AlertDialog dengan teks dan tombol aksi
    AlertDialog alertDialog = AlertDialog(
      content: Text(
        value, // Menampilkan teks yang diinput di dialog
        style: TextStyle(fontSize: 20.0),
      ),
      actions: <Widget>[
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.purple, // Mengatur warna tombol
          ),
          child: Text("OK"), // Teks pada tombol
          onPressed: () {
            Navigator.of(context).pop(); // Menutup dialog saat tombol ditekan
          },
        ),
      ],
    );

    // Menampilkan dialog
    showDialog(
      context: context, // Memberikan konteks aplikasi
      builder: (context) => alertDialog, // Menampilkan dialog yang sudah dibuat
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("INPUT TEXT, ALERT DIALOG & SNACKBAR"), // Judul aplikasi pada AppBar
        backgroundColor: Colors.purple, // Warna latar belakang AppBar
      ),
      body: Container(
        padding: EdgeInsets.all(16.0), // Menambahkan padding di sekitar konten
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextField(
              controller: textController, // Mengatur controller untuk input teks biasa
              decoration: InputDecoration(
                hintText: "tulis di sini", // Teks petunjuk pada input
              ),
              onSubmitted: (String value) {
                setState(() {
                  str = value + '\n' + str; // Menambahkan teks baru ke atas teks sebelumnya
                  textController.clear(); // Mengosongkan teks setelah submit
                });
              },
            ),
            SizedBox(height: 20), // Menambahkan jarak antar widget
            Text(
              str, // Menampilkan teks yang sudah diinput
              style: TextStyle(fontSize: 20.0), // Mengatur ukuran teks
            ),
            SizedBox(height: 20), // Menambahkan jarak antar widget
            TextField(
              controller: alertController, // Mengatur controller untuk input alert
              decoration: InputDecoration(
                hintText: "tulis untuk Alert...", // Teks petunjuk untuk alert
              ),
              onSubmitted: (String value) {
                _alertdialog(value); // Memanggil fungsi untuk menampilkan alert
                alertController.clear(); // Mengosongkan teks setelah submit
              },
            ),
            SizedBox(height: 20), // Menambahkan jarak antar widget
            TextField(
              controller: snackbarController, // Mengatur controller untuk input Snackbar
              decoration: InputDecoration(
                hintText: "tulis untuk Snackbar...", // Teks petunjuk untuk Snackbar
              ),
              onSubmitted: (String value) {
                _snackbar(value); // Memanggil fungsi untuk menampilkan Snackbar
                snackbarController.clear(); // Mengosongkan teks setelah submit
              },
            ),
          ],
        ),
      ),
    );
  }
}
