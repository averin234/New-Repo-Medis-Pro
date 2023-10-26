class data_acc {
  List<DataAcc>? dataAcc;
  int? code;
  String? msg;
  int? totalBayar;
  int? totalHutang;
  int? response;

  data_acc({this.dataAcc, this.totalBayar, this.totalHutang, this.response});

  data_acc.fromJson(Map<String, dynamic> json) {
    if (json['data_acc'] != null) {
      dataAcc = <DataAcc>[];
      json['data_acc'].forEach((v) {
        dataAcc!.add(new DataAcc.fromJson(v));
      });
    }
    totalBayar = json['total_bayar'];
    totalHutang = json['total_hutang'];
    response = json['Response'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.dataAcc != null) {
      data['data_acc'] = this.dataAcc!.map((v) => v.toJson()).toList();
    }
    data['total_bayar'] = this.totalBayar;
    data['total_hutang'] = this.totalHutang;
    data['Response'] = this.response;
    return data;
  }
}

class DataAcc {
  String? foto;
  String? namaPerusahaan;
  String? totalHarga;
  String? totalBayar;
  int? jumPesan;
  int? code;
  String? msg;
  String? kodePerusahaanPbf;

  DataAcc(
      {this.foto,
        this.namaPerusahaan,
        this.totalHarga,
        this.totalBayar,
        this.jumPesan,
        this.kodePerusahaanPbf});

  DataAcc.fromJson(Map<String, dynamic> json) {
    foto = json['foto'];
    namaPerusahaan = json['nama_perusahaan'];
    totalHarga = json['total_harga'];
    totalBayar = json['total_bayar'];
    jumPesan = json['jum_pesan'];
    kodePerusahaanPbf = json['kode_perusahaan_pbf'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['foto'] = this.foto;
    data['nama_perusahaan'] = this.namaPerusahaan;
    data['total_harga'] = this.totalHarga;
    data['total_bayar'] = this.totalBayar;
    data['jum_pesan'] = this.jumPesan;
    data['kode_perusahaan_pbf'] = this.kodePerusahaanPbf;
    return data;
  }
}