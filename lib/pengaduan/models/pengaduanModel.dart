class PengaduanModel {
  int? idPengaduan;
  String? tglPengaduan;
  int? nik;
  String? isiLaporan;
  String? foto;
  String? url;
  String? status;
  String? createdAt;
  String? updatedAt;
  Masyarakat? masyarakat;
  List<Tanggapans>? tanggapans;

  PengaduanModel(
      {this.idPengaduan,
        this.tglPengaduan,
        this.nik,
        this.isiLaporan,
        this.foto,
        this.url,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.masyarakat,
        this.tanggapans});

  PengaduanModel.fromJson(Map<String, dynamic> json) {
    idPengaduan = json['id_pengaduan'];
    tglPengaduan = json['tgl_pengaduan'];
    nik = json['nik'];
    isiLaporan = json['isi_laporan'];
    foto = json['foto'];
    url = json['url'];
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    masyarakat = json['masyarakat'] != null
        ? new Masyarakat.fromJson(json['masyarakat'])
        : null;
    if (json['tanggapans'] != null) {
      tanggapans = <Tanggapans>[];
      json['tanggapans'].forEach((v) {
        tanggapans!.add(new Tanggapans.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_pengaduan'] = this.idPengaduan;
    data['tgl_pengaduan'] = this.tglPengaduan;
    data['nik'] = this.nik;
    data['isi_laporan'] = this.isiLaporan;
    data['foto'] = this.foto;
    data['url'] = this.url;
    data['status'] = this.status;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    if (this.masyarakat != null) {
      data['masyarakat'] = this.masyarakat!.toJson();
    }
    if (this.tanggapans != null) {
      data['tanggapans'] = this.tanggapans!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Masyarakat {
  String? nama;

  Masyarakat({this.nama});

  Masyarakat.fromJson(Map<String, dynamic> json) {
    nama = json['nama'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nama'] = this.nama;
    return data;
  }
}

class Tanggapans {
  int? idPengaduan;
  String? tanggapan;
  int? idPetugas;
  Petuga? petuga;

  Tanggapans({this.idPengaduan, this.tanggapan, this.idPetugas, this.petuga});

  Tanggapans.fromJson(Map<String, dynamic> json) {
    idPengaduan = json['id_pengaduan'];
    tanggapan = json['tanggapan'];
    idPetugas = json['id_petugas'];
    petuga =
    json['petuga'] != null ? new Petuga.fromJson(json['petuga']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_pengaduan'] = this.idPengaduan;
    data['tanggapan'] = this.tanggapan;
    data['id_petugas'] = this.idPetugas;
    if (this.petuga != null) {
      data['petuga'] = this.petuga!.toJson();
    }
    return data;
  }
}

class Petuga {
  String? namaPetugas;

  Petuga({this.namaPetugas});

  Petuga.fromJson(Map<String, dynamic> json) {
    namaPetugas = json['nama_petugas'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nama_petugas'] = this.namaPetugas;
    return data;
  }
}
