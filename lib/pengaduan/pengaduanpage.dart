import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ngadu/pengaduan/controllers/pengaduanController.dart';
import 'package:ngadu/pengaduan/pengaduanById.dart';
import 'package:ngadu/pengaduan/uploadpengaduan.dart';

class PengaduanPage extends StatelessWidget {
  const PengaduanPage({super.key});

  @override
  Widget build(BuildContext context) {
    pengaduanController kc = Get.put(pengaduanController());
    return Scaffold(
      appBar: AppBar(
          title: Text("Halaman Pengaduan"),
          backgroundColor: Colors.teal[300],
          actions: [
            Container(
              margin: EdgeInsets.only(right: 30),
              child: IconButton(
                  onPressed: () {
                    Get.to(UploadPengaduan());
                  },
                  icon: Icon(Icons.create_new_folder_outlined)),
            )
          ]),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              decoration: BoxDecoration(
                  color: Colors.green,
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://i.pinimg.com/736x/0a/0a/90/0a0a90299cb9f92eba53f3d6b2dba591.jpg'),
                    fit: BoxFit.fill,
                  )),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Can I Help You?",
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 25,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("Masyarakat"),
              onTap: () {
                Get.toNamed("/masyarakat");
              },
            ),
            ListTile(
              leading: Icon(Icons.shield),
              title: Text("Petugas"),
              onTap: () {
                Get.toNamed("/petugas");
              },
            ),
            ListTile(
              leading: Icon(Icons.note_alt),
              title: Text("Pengaduan"),
              tileColor: Colors.teal[300],
            ),
            ListTile(
              leading: Icon(Icons.list_alt),
              title: Text("Tanggapan"),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Obx(() => kc.isLoading.value
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: kc.keluhmodel.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          child: ListTile(
                              leading: CircleAvatar(
                                child: Text(
                                    "${kc.keluhmodel.value[index].idPengaduan}"),
                              ),
                              title: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "${kc.keluhmodel.value[index].masyarakat!.nama}",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "${kc.keluhmodel.value[index].isiLaporan}",
                                    style: TextStyle(color: Colors.grey[600]),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  )
                                ],
                              ),
                              subtitle: Column(
                                children: [
                                  Image.network(
                                    'http://localhost:2000/images/${kc.keluhmodel.value[index].foto}',
                                    width: 320,
                                  ),
                                ],
                              ),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        Get.to(PengaduanById(), arguments: [
                                          "${kc.keluhmodel.value[index].nik}",
                                          "${kc.keluhmodel.value[index].masyarakat!.nama}",
                                          "${kc.keluhmodel.value[index].tglPengaduan}",
                                          "${kc.keluhmodel.value[index].foto}",
                                          "${kc.keluhmodel.value[index].isiLaporan}",
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
                                                content:
                                                    Text("Yakin? Yang Bener?"),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: Text("Batal"),
                                                  ),
                                                  TextButton(
                                                    onPressed: () {},
                                                    child: Text("Hapus"),
                                                  )
                                                ],
                                              );
                                            });
                                      },
                                      icon: Icon(Icons.delete)),
                                ],
                              )),
                        );
                      },
                    ),
                  ))
          ],
        ),
      ),
    );
  }
}
