class json_hutang {
  List<DataHutang>? dataHutang;
  String? totalHutang;
  String? totalTagihan;
  String? totalTerbayar;
  int? code;
  String? msg;
  int? response;

  json_hutang(
      {this.dataHutang,
        this.totalHutang,
        this.totalTagihan,
        this.totalTerbayar,
        this.response});

  json_hutang.fromJson(Map<String, dynamic> json) {
    if (json['data_hutang'] != null) {
      dataHutang = <DataHutang>[];
      json['data_hutang'].forEach((v) {
        dataHutang!.add(DataHutang.fromJson(v));
      });
    }
    totalHutang = json['total_hutang'];
    totalTagihan = json['total_tagihan'];
    totalTerbayar = json['total_terbayar'];
    response = json['Response'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (dataHutang != null) {
      data['data_hutang'] = dataHutang!.map((v) => v.toJson()).toList();
    }
    data['total_hutang'] = totalHutang;
    data['total_tagihan'] = totalTagihan;
    data['total_terbayar'] = totalTerbayar;
    data['Response'] = response;
    return data;
  }
}

class DataHutang {
  String? foto;
  String? namaPerusahaan;
  String? totalHarga;
  String? totalBayar;
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