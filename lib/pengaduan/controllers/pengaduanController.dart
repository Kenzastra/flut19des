import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:ngadu/pengaduan/models/pengaduanModel.dart';
import 'package:ngadu/tanggapan/models/tanggapanModel.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

class pengaduanController extends GetxController {
  var url = 'http://192.168.232.119:2000/pengaduan';

  TextEditingController nik = TextEditingController();
  TextEditingController isiLaporan = TextEditingController();

  PlatformFile? imagepicked;
  RxBool isLoading = false.obs;
  RxBool Web = false.obs;
  File? fileToDisplayHp;
  Uint8List fileToDisplayWeb = Uint8List(0);

  var isWeb = kIsWeb.obs;
  String? fileName;

  RxList<PengaduanModel> keluhmodel = RxList<PengaduanModel>([]);
  RxList<TanggapanModel> tpmodel = RxList<TanggapanModel>([]);

  @override
  void onInit() {
    getData();
    getDataTanggapan();
    super.onInit();
  }

  Future<void> pickImage() async {
    try {
      isLoading.value = true;
      FilePickerResult? result = await FilePicker.platform
          .pickFiles(type: FileType.image, allowMultiple: false);

      if (result != null) {
        imagepicked = result.files.first;
        fileToDisplayHp = File(imagepicked!.path.toString());
        print(fileToDisplayHp);
        print(imagepicked!.name);
      }
      isLoading.value = false;
    } catch (e) {}
  }

  Future<void> pickImageWeb() async {
    try {
      isLoading.value = true;

      FilePickerResult? result =
          await FilePicker.platform.pickFiles(type: FileType.image);
      if (result == null) return;

      imagepicked = result.files.first;
      print(imagepicked);
      fileName = result.files.first.name;
      fileToDisplayWeb = Uint8List.fromList(imagepicked!.bytes!);

      isLoading.value = false;
    } catch (e) {}
  }

  uploadImage() async {
    var request = http.MultipartRequest(
      "POST", Uri.parse('http://localhost:2000/pengaduan'));
    request.fields['nik'] = nik.text;
    request.fields['isi'] = isiLaporan.text;
    if(isWeb.value) {
      request.files.add(http.MultipartFile.fromBytes('foto', fileToDisplayWeb, filename: fileName));
    } else {
      request.files.add(await http.MultipartFile.fromPath('foto', imagepicked!.path.toString()));
    }

    var response = await request.send();
    if(response.statusCode == 201) {
      nik.text = "";
      isiLaporan.text = "";

      Get.back();
      getData();

      print("sukses");
    } else {
      print ("gagal: response ${response.statusCode}");
    }
  }

  getData() async {
    final String url = 'http://localhost:2000';
    try {
      isLoading.value = true;
      var res = await http.get(Uri.parse('${url}/pengaduan'));
      if (res.statusCode == 200) {
        isLoading.value = false;
        final content = jsonDecode(res.body);

        keluhmodel.value.clear();
        for (Map<String, dynamic> i in content) {
          keluhmodel.value.add(PengaduanModel.fromJson(i));
          print(keluhmodel.value.length);
        }
      } else {
        isLoading.value = false;
        print('error');
      }
    } catch (e) {
      isLoading.value = false;
      print(e.toString());
    }
  }

  getDataTanggapan() async {
    final String url = 'http://localhost:2000';
    try {
      isLoading.value = true;
      var res = await http.get(Uri.parse('${url}/tanggapan'));
      if (res.statusCode == 200) {
        isLoading.value = false;
        final content = jsonDecode(res.body);

        tpmodel.value.clear();
        for (Map<String, dynamic> i in content) {
          tpmodel.value.add(TanggapanModel.fromJson(i));
          print(tpmodel.value.length);
        }
      } else {
        isLoading.value = false;
        print('error');
      }
    } catch (e) {
      isLoading.value = false;
      print(e.toString());
    }
  }

  updateData(String nik, String nama, String username, String password,
      String telp) async {
    final String url = 'http://localhost:2000';
    try {
      var res = await http.patch(Uri.parse('${url}/pengaduan/$nik'),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({
            "nama": nama,
            "username": username,
            "password": password,
            "telp": telp,
          }));
      print(res.body);
      if (res.statusCode == 200) {
        getData();
        print("Update berhasil");
        Get.back();
      } else {
        isLoading.value = false;
        print('error');
      }
    } catch (e) {
      isLoading.value = false;
      print(e.toString());
    }
  }

  deleteData(String nik) async {
    final String url = 'http://localhost:2000';
    try {
      var res = await http.delete(Uri.parse('${url}/pengaduan/$nik'),
          headers: {'Content-Type': 'application/json'});
      print(res.body);
      if (res.statusCode == 200) {
        getData();
        print("Delete berhasil");
      } else {
        isLoading.value = false;
        print('error');
      }
    } catch (e) {
      isLoading.value = false;
      print(e.toString());
    }
  }
}
