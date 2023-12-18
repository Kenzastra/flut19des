import 'package:flutter/material.dart';
import 'package:ngadu/petugas/controllers/petugasController.dart';
import 'package:get/get.dart';

class PetugasUpdate extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    petugasController pc = Get.find();
    final List<String> data= Get.arguments;
    print(data);
    TextEditingController setId = TextEditingController(text: "${data[0]}");
    TextEditingController setNama = TextEditingController(text: "${data[1]}");
    TextEditingController setUsername = TextEditingController(text: "${data[2]}");
    TextEditingController setPassword = TextEditingController(text: "${data[3]}");
    TextEditingController setTelp = TextEditingController(text: "${data[4]}");
    TextEditingController setLevel = TextEditingController(text: "${data[5]}");

    return Scaffold(
      appBar: AppBar(
        title: Text("Update Staff Page"),
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: setId,
              decoration: InputDecoration(label: Text("ID")),
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
            TextField(
              controller: setLevel,
              decoration: InputDecoration(label: Text("Level")),
            ),
            SizedBox(
              width: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  pc.updateData(setId.text,setNama.text,setUsername.text,setPassword.text,setTelp.text,setLevel.text);
                }, child: Text("Update"))
          ],
        ),
      ),
    );
  }
}
