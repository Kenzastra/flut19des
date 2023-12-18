class MasyarakatModel{
  int? nik;
  String? nama;
  String? username;
  String? password;
  String? telp;


  MasyarakatModel(this.nik, this.nama, this.username);

  MasyarakatModel.fromJson(Map<String, dynamic> json) {
    nik = json['nik'];
    nama = json['nama'];
    username = json['username'];
    password = json['password'];
    telp = json['telp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nik'] = this.nik;
    data['nama'] = this.nama;
    data['username'] = this.username;
    return data;
  }
}