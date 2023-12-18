import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ngadu/petugas/controllers/petugasController.dart';
import 'package:ngadu/petugas/updatepetugaspage.dart';

class PetugasPage extends StatelessWidget {
  const PetugasPage({super.key});

  @override
  Widget build(BuildContext context) {
    petugasController pc = Get.put(petugasController());
    return Scaffold(
        appBar: AppBar(
          title: Text("Halaman Petugas"),
          backgroundColor: Colors.blueAccent,
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                padding: EdgeInsets.zero,
                decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    image: DecorationImage(
                      image:
                          NetworkImage('https://i.redd.it/z23xoqgrykh71.png'),
                      fit: BoxFit.fill,
                    )),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "KOKOMI",
                      style: TextStyle(
                        color: Colors.blueAccent,
                        fontSize: 50,
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
                tileColor: Colors.blueAccent,
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.note_alt),
                title: Text("Pengaduan"),
                onTap: () {Get.toNamed("/pengaduan");},
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
          child: Column(
            children: [
              Obx(() => pc.isLoading.value
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      itemCount: pc.pmodel.value.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          leading: CircleAvatar(
                            child: Text("${pc.pmodel.value[index].id_petugas}"),
                          ),
                          title: Text("${pc.pmodel.value[index].nama_petugas}"),
                          subtitle: Text("${pc.pmodel.value[index].username}"),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    Get.to(PetugasUpdate(), arguments: [
                                      "${pc.pmodel.value[index].id_petugas.toString()}",
                                      "${pc.pmodel.value[index].nama_petugas}",
                                      "${pc.pmodel.value[index].username}",
                                      "${pc.pmodel.value[index].password}",
                                      "${pc.pmodel.value[index].telp}",
                                      "${pc.pmodel.value[index].level}",
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
                                                  pc.deleteData(pc.pmodel.value[index].id_petugas.toString());
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
                            radius: 30,
                            child: IconButton(
                              onPressed: () {
                                Get.toNamed("/petugas/create");
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
        ));
  }
}
