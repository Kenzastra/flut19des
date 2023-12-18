import 'package:flutter/material.dart';
import 'package:ngadu/masyarakat/controllers/masyaController.dart';
import 'package:get/get.dart';
import 'package:ngadu/masyarakat/updatepage.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    masyaController nc = Get.put(masyaController());
    return Scaffold(
      appBar: AppBar(
        title: Text("Halaman Masyarakat"),
        backgroundColor: Colors.red[900],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              decoration: BoxDecoration(
                  color: Colors.red,
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://upload-os-bbs.hoyolab.com/upload/2022/10/09/142358137/8a44038e62d045da29873ef9e6c5a04d_4207137950525597670.jpg?x-oss-process=image%2Fresize%2Cs_1000%2Fauto-orient%2C0%2Finterlace%2C1%2Fformat%2Cwebp%2Fquality%2Cq_80'),
                    fit: BoxFit.fill,
                  )),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "HUTAO",
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 50,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("Masyarakat"),
              tileColor: Colors.deepOrange,
              onTap: (){},
            ),
            ListTile(
              leading: Icon(Icons.shield),
              title: Text("Petugas"),
              onTap: (){Get.toNamed("/petugas");},
            ),
            ListTile(
              leading: Icon(Icons.note_alt),
              title: Text("Pengaduan"),
              onTap: (){Get.toNamed("/pengaduan");},
            ),
            ListTile(
              leading: Icon(Icons.list_alt),
              title: Text("Tanggapan"),
              onTap: (){},
            ),
          ],
        ),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Obx(() => nc.isLoading.value
                ? Container(
                    alignment: Alignment.center,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ))
                : ListView.builder(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemCount: nc.mmodel.value.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        leading: CircleAvatar(backgroundColor: Colors.red[900],
                          child: Text("${nc.mmodel.value[index].nik}"),
                        ),
                        title: Text("${nc.mmodel.value[index].nama}"),
                        subtitle: Text("${nc.mmodel.value[index].username}"),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                                onPressed: () {
                                  Get.to(UpdatePage(), arguments: [
                                    "${nc.mmodel.value[index].nik.toString()}",
                                    "${nc.mmodel.value[index].nama}",
                                    "${nc.mmodel.value[index].username}",
                                    "${nc.mmodel.value[index].password}",
                                    "${nc.mmodel.value[index].telp}",
                                  ]);
                                },
                                icon: Icon(Icons.edit_note)),
                            IconButton(
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: Text("Hapus Data"),
                                          content: Text("Yakin? Yang Bener?"),
                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: Text("Batal"),
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                nc.deleteData(nc
                                                    .mmodel.value[index].nik
                                                    .toString());
                                                Navigator.of(context).pop();
                                              },
                                              child: Text("Hapus"),
                                            )
                                          ],
                                        );
                                      });
                                },
                                icon: Icon(Icons.delete)),
                          ],
                        ),
                      );
                    },
                  )),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(right: 10, bottom: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: CircleAvatar(
                          backgroundColor: Colors.red[900],
                          radius: 30,
                          child: IconButton(
                            onPressed: () {
                              Get.toNamed("/masyarakat/create");
                            },
                            iconSize: 30,
                            icon: Icon(Icons.add),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
