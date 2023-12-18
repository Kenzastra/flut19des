import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ngadu/pengaduan/controllers/pengaduanController.dart';

class PengaduanById extends StatelessWidget {
  const PengaduanById({super.key});

  @override
  Widget build(BuildContext context) {
    pengaduanController kc = Get.find();
    final List<String> args = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text("Halaman Pengaduan"),
        backgroundColor: Colors.teal[300],
      ),
      body: Container(
        margin: EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    child: Text("${args[0]}"),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      flex: 1,
                      child: Text(
                        "${args[1]}",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                  Text("Tanggal: ${args[2]}")
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 20, bottom: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Laporan: ${args[4]}",
                      style: TextStyle(fontWeight: FontWeight.normal),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Image.network(
                      'http://localhost:2000/images/${args[3]}',
                      height: 200,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          Get.bottomSheet(
                            isDismissible: true,
                            backgroundColor: Colors.white,
                            Obx(
                              () => kc.isLoading.value
                                  ? Text("")
                                  : ListView.builder(
                                      itemCount: kc.keluhmodel.value.length,
                                      itemBuilder:
                                          (BuildContext context, index) {
                                        return ListTile(
                                          leading: CircleAvatar(
                                            child: Text(
                                                "${kc.keluhmodel.value[index].tanggapans![index].idPetugas}"),
                                          ),
                                          title: Text(
                                              "${kc.keluhmodel.value[index].tanggapans![index].petuga!.namaPetugas}"),
                                          subtitle: Text(
                                              "${kc.keluhmodel.value[index].tanggapans![index].tanggapan}"),
                                        );
                                      },
                                    ),
                            ),
                          );
                        },
                        child: Text('Tanggapan'))
                  ],
                ),
              ),
              // Container(
              //   child: Column(
              //     children: [
              //       Text(
              //         "Tanggapan",
              //         style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              //       ),
              //
              //     ],
              //   ),
              // ),
              // Expanded(
              //   child: Obx(
              //     () => kc.isLoading.value
              //         ? Text("")
              //         : ListView.builder(
              //             shrinkWrap: true,
              //             scrollDirection: Axis.vertical,
              //             itemCount: kc.keluhmodel.value.length,
              //             itemBuilder: (BuildContext context, index) {
              //               return ListTile(
              //                 trailing: CircleAvatar(
              //                   child: Text(
              //                       "${kc.keluhmodel.value[index].tanggapans![index].idPetugas}"),
              //                 ),
              //                 title: Text(
              //                     "${kc.keluhmodel.value[index].tanggapans![0].petuga!.namaPetugas}"),
              //               );
              //             },
              //           ),
              //   ),
              // )
            ],
        ),
      ),
    );
  }
}
