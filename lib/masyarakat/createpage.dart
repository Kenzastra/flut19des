import 'package:flutter/material.dart';
import 'package:ngadu/masyarakat/controllers/masyaController.dart';
import 'package:get/get.dart';

class CreatePage extends StatelessWidget {
  const CreatePage({super.key});

  @override
  Widget build(BuildContext context) {
    masyaController nc = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Page"),
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: nc.setNama,
              decoration: InputDecoration(
                  label: Text("Nama")
              ),
            ),
            SizedBox(
              width: 20,
            ),
            TextField(
              controller: nc.setUsername,
              decoration: InputDecoration(
                  label: Text("Username")
              ),
            ),
            SizedBox(
              width: 20,
            ),
            TextField(
              controller: nc.setPassword,
              decoration: InputDecoration(
                  label: Text("Password")
              ),
            ),
            SizedBox(
              width: 20,
            ),
            TextField(
              controller: nc.setTelp,
              decoration: InputDecoration(
                  label: Text("No Telp")
              ),
            ),
            SizedBox(
              width: 20,
            ),
            ElevatedButton(onPressed: () => nc.postData(), child: Text("Create"))
          ],
        ),
      ),
    );
  }
}
