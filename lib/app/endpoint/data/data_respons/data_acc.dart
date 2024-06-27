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
        dataAcc!.add(DataAcc.fromJson(v));
      });
    }
    totalBayar = json['total_bayar'];
    totalHutang = json['total_hutang'];
    response = json['Response'];
  }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (dataAcc != null) {
      data['data_acc'] = dataAcc!.map((v) => v.toJson()).toList();
    }
    data['total_bayar'] = totalBayar;
    data['total_hutang'] = totalHutang;
    data['Response'] = response;
    return data;
  }

  static empty() {}
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['foto'] = foto;
    data['nama_perusahaan'] = namaPerusahaan;
    data['total_harga'] = totalHarga;
    data['total_bayar'] = totalBayar;
    data['jum_pesan'] = jumPesan;
    data['kode_perusahaan_pbf'] = kodePerusahaanPbf;
    return data;
  }
}