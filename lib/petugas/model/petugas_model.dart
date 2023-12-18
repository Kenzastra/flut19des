class PetugasModel{
  int? id_petugas;
  String? nama_petugas;
  String? username;
  String? password;
  String? telp;
  String? level;


  PetugasModel(this.id_petugas, this.nama_petugas, this.username, this.level);

  PetugasModel.fromJson(Map<String, dynamic> json) {
    id_petugas = json['id_petugas'];
    nama_petugas = json['nama_petugas'];
    username = json['username'];
    password = json['password'];
    telp = json['telp'];
    level = json['level'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_petugas'] = this.id_petugas;
    data['nama_petugas'] = this.nama_petugas;
    data['username'] = this.username;
    data['level'] = this.level;
    return data;
  }
}