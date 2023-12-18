import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ngadu/pengaduan/controllers/pengaduanController.dart';

class UploadPengaduan extends StatelessWidget {
  const UploadPengaduan({super.key});

  @override
  Widget build(BuildContext context) {
    pengaduanController kc = Get.find<pengaduanController>();
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Image"),
      ),
      body: Obx(
        () => Container(
          margin: EdgeInsets.all(10),
          child: Column(
            children: [
              Center(
                child: kc.isLoading.value
                    ? CircularProgressIndicator()
                    : kc.isWeb.value
                        ? ElevatedButton.icon(
                            onPressed: () {
                              kc.pickImageWeb();
                              kc.Web.value = true;
                            },
                            icon: Icon(Icons.image_outlined),
                            label: Text("Pick Imageweb"),
                          )
                        : IconButton(
                            onPressed: () async {
                              kc.pickImage();
                              kc.Web.value = false;
                            },
                            icon: Icon(Icons.image_rounded),
                          ),
              ),
              if (kc.imagepicked != null)
                SizedBox(
                    height: 100,
                    width: 200,
                    child: kc.Web.value == false
                        ? Image.file(kc.fileToDisplayHp!)
                        : Image.memory(kc.fileToDisplayWeb)),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: kc.nik,
                decoration: InputDecoration(
                    label: Text("Nik"), border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: kc.isiLaporan,
                decoration: InputDecoration(
                    label: Text("Laporan"), border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    kc.uploadImage();
                  },
                  child: Text("Save Image")),
            ],
          ),
        ),
      ),
    );
  }
}
