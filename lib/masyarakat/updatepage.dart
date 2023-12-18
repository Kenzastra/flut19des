import 'package:flutter/material.dart';
import 'package:ngadu/masyarakat/controllers/masyaController.dart';
import 'package:get/get.dart';

class UpdatePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    masyaController nc = Get.find();
    final List<String> data= Get.arguments;
    print(data);
    TextEditingController setNik = TextEditingController(text: "${data[0]}");
    TextEditingController setNama = TextEditingController(text: "${data[1]}");
    TextEditingController setUsername = TextEditingController(text: "${data[2]}");
    TextEditingController setPassword = TextEditingController(text: "${data[3]}");
    TextEditingController setTelp = TextEditingController(text: "${data[4]}");
    return Scaffold(
      appBar: AppBar(
        title: Text("Update Page"),
      ),
      body: Container(
        child: Column(
          children: [

            TextField(
              controller: setNik,
              decoration: InputDecoration(label: Text("NIK")),
              readOnly: true,
            ),
            SizedBox(
              width: 20,
            ),
            TextField(
              controller: setNama,
              decoration: InputDecoration(label: Text("Nama")),
            ),
            SizedBox(
              width: 20,
            ),
            TextField(
              controller: setUsername,
              decoration: InputDecoration(label: Text("Username")),
            ),
            SizedBox(
              width: 20,
            ),
            TextField(
              controller: setPassword,
              decoration: InputDecoration(label: Text("Password")),
            ),
            SizedBox(
              width: 20,
            ),
            TextField(
              controller: setTelp,
              decoration: InputDecoration(label: Text("No Telp")),
            ),
            SizedBox(
              width: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  nc.updateData(setNik.text,setNama.text,setUsername.text,setPassword.text,setTelp.text,);
                }, child: Text("Update"))
          ],
        ),
      ),
    );
  }
}
