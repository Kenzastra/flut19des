import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ngadu/masyarakat/model/masyarakat_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class masyaController extends GetxController {
  TextEditingController setNik = TextEditingController();
  TextEditingController setNama = TextEditingController();
  TextEditingController setUsername = TextEditingController();
  TextEditingController setPassword = TextEditingController();
  TextEditingController setTelp = TextEditingController();

  RxBool isLoading = false.obs;
  RxList<MasyarakatModel> mmodel = RxList<MasyarakatModel>([]);

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  getData() async {
    final String url = 'http://localhost:2000';
    try {
      isLoading.value = true;
      var res = await http.get(Uri.parse('${url}/masyarakat'));
      if (res.statusCode == 200) {
        isLoading.value = false;
        final content = jsonDecode(res.body);

        mmodel.value.clear();
        for (Map<String, dynamic> i in content) {
          mmodel.value.add(MasyarakatModel.fromJson(i));
          print(mmodel.value.length);
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

  postData() async {
    final String url = 'http://localhost:2000';
    try {
      var res = await http.post(Uri.parse('${url}/masyarakat'),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({
            "nama": setNama.text,
            "username": setUsername.text,
            "password": setPassword.text,
            "telp": setTelp.text,
          }));
      if (res.statusCode == 201) {
        getData();
        print("Create berhasil");
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

  updateData(String nik, String nama, String username, String password, String telp) async {
    final String url = 'http://localhost:2000';
    try {
      var res = await http.patch(Uri.parse('${url}/masyarakat/$nik'),
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
      var res = await http.delete(Uri.parse('${url}/masyarakat/$nik'),
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
