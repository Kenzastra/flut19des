import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:ngadu/petugas/model/petugas_model.dart';

class petugasController extends GetxController {
  TextEditingController setId = TextEditingController();
  TextEditingController setNama = TextEditingController();
  TextEditingController setUsername = TextEditingController();
  TextEditingController setPassword = TextEditingController();
  TextEditingController setTelp = TextEditingController();
  TextEditingController setLevel = TextEditingController();

  RxBool isLoading = false.obs;
  RxList<PetugasModel> pmodel = RxList<PetugasModel>([]);

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  getData() async {
    final String url = 'http://localhost:2000';
    try {
      isLoading.value = true;
      var res = await http.get(Uri.parse('${url}/petugas'));
      if (res.statusCode == 200) {
        isLoading.value = false;
        final content = jsonDecode(res.body);

        pmodel.value.clear();
        for (Map<String, dynamic> i in content) {
          pmodel.value.add(PetugasModel.fromJson(i));
          print(pmodel.value.length);
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
      var res = await http.post(Uri.parse('${url}/petugas'),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({
            "nama": setNama.text,
            "username": setUsername.text,
            "password": setPassword.text,
            "telp": setTelp.text,
            "level": setLevel.text
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

  updateData(String id_petugas, String nama_petugas, String username, String password, String telp, String level) async {
    final String url = 'http://localhost:2000';
    try {
      var res = await http.patch(Uri.parse('${url}/petugas/$id_petugas'),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({
            "nama": nama_petugas,
            "username": username,
            "password": password,
            "telp": telp,
            "level" : level
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

  deleteData(String id_petugas) async {
    final String url = 'http://localhost:2000';
    try {
      var res = await http.delete(Uri.parse('${url}/petugas/$id_petugas'),
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