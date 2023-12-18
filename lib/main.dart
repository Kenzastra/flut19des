import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ngadu/masyarakat/createpage.dart';
import 'package:ngadu/masyarakat/masyarakatpage.dart';
import 'package:ngadu/masyarakat/updatepage.dart';
import 'package:ngadu/pengaduan/pengaduanById.dart';
import 'package:ngadu/pengaduan/pengaduanpage.dart';
import 'package:ngadu/petugas/createpetugaspage.dart';
import 'package:ngadu/petugas/petugaspage.dart';
import 'package:ngadu/petugas/updatepetugaspage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      getPages: [
        // Masyarakat
        GetPage(name: '/masyarakat', page: ()=> FirstPage()),
        GetPage(name: '/masyarakat/create', page: ()=> CreatePage()),
        GetPage(name: '/masyarakat/update', page: ()=> UpdatePage()),

        // Petugas
        GetPage(name: '/petugas', page: () => PetugasPage()),
        GetPage(name: '/petugas/create', page: () => PetugasCreate()),
        GetPage(name: '/petugas/update', page: () => PetugasUpdate()),

        // Pengaduan
        GetPage(name: '/pengaduan', page: () => PengaduanPage()),
        GetPage(name: '/pengaduan/id', page: () => PengaduanById()),

      ],
      home: FirstPage()
    );
  }
}