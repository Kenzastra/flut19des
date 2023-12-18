import 'package:flutter/material.dart';
import 'package:ngadu/petugas/controllers/petugasController.dart';
import 'package:get/get.dart';

class PetugasCreate extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    petugasController pc = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: Text("Create Staff Page"),
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: pc.setNama,
              decoration: InputDecoration(label: Text("Nama")),
            ),
            SizedBox(
              width: 20,
            ),
            TextField(
              controller: pc.setUsername,
              decoration: InputDecoration(label: Text("Username")),
            ),
            SizedBox(
              width: 20,
            ),
            TextField(
              controller: pc.setPassword,
              decoration: InputDecoration(label: Text("Password")),
            ),
            SizedBox(
              width: 20,
            ),
            TextField(
              controller: pc.setTelp,
              decoration: InputDecoration(label: Text("No Telp")),
            ),
            SizedBox(
              width: 20,
            ),
            TextField(
              controller: pc.setLevel,
              decoration: InputDecoration(label: Text("Level")),
            ),
            SizedBox(
              width: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  pc.postData();
                }, child: Text("Create"))
          ],
        ),
      ),
    );
  }
}
