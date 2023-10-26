class json_hutang {
  List<DataHutang>? dataHutang;
  String? totalHutang;
  String? totalTagihan;
  int? response;
  int? code;
  String? msg;

  json_hutang(
      {this.dataHutang, this.totalHutang, this.totalTagihan, this.response});

  json_hutang.fromJson(Map<String, dynamic> json) {
    if (json['data_hutang'] != null) {
      dataHutang = <DataHutang>[];
      json['data_hutang'].forEach((v) {
        dataHutang!.add(new DataHutang.fromJson(v));
      });
    }
    totalHutang = json['total_hutang'];
    totalTagihan = json['total_tagihan'];
    response = json['Response'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.dataHutang != null) {
      data['data_hutang'] = this.dataHutang!.map((v) => v.toJson()).toList();
    }
    data['total_hutang'] = this.totalHutang;
    data['total_tagihan'] = this.totalTagihan;
    data['Response'] = this.response;
    return data;
  }
}

class DataHutang {
  String? foto;
  String? namaPerusahaan;
  String? totalHarga;
  String? totalBayar;
  int? code;
  String? msg;
  int? jumPesan;
  String? kodePerusahaanPbf;

  DataHutang(
      {this.foto,
        this.namaPerusahaan,
        this.totalHarga,
        this.totalBayar,
        this.jumPesan,
        this.kodePerusahaanPbf});

  DataHutang.fromJson(Map<String, dynamic> json) {
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