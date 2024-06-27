class data_pembayaran {
  List<DataPembayaran>? dataPembayaran;
  String? totalHutang;
  int? response;
  int? code;
  String? msg;

  data_pembayaran({this.dataPembayaran, this.totalHutang, this.response});

  data_pembayaran.fromJson(Map<String, dynamic> json) {
    if (json['data_Pembayaran'] != null) {
      dataPembayaran = <DataPembayaran>[];
      json['data_Pembayaran'].forEach((v) {
        dataPembayaran!.add(DataPembayaran.fromJson(v));
      });
    }
    totalHutang = json['total_hutang'];
    response = json['Response'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (dataPembayaran != null) {
      data['data_Pembayaran'] =
          dataPembayaran!.map((v) => v.toJson()).toList();
    }
    data['total_hutang'] = totalHutang;
    data['Response'] = response;
    return data;
  }
}

class DataPembayaran {
  int? jumPesan;
  String? totalHarga;
  String? kodePerusahaanPbf;
  String? namaPerusahaan;
  String? foto;

  DataPembayaran(
      {this.jumPesan,
        this.totalHarga,
        this.kodePerusahaanPbf,
        this.namaPerusahaan,
        this.foto});

  DataPembayaran.fromJson(Map<String, dynamic> json) {
    jumPesan = json['jum_pesan'];
    totalHarga = json['total_harga'];
    kodePerusahaanPbf = json['kode_perusahaan_pbf'];
    namaPerusahaan = json['nama_perusahaan'];
    foto = json['foto'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['jum_pesan'] = jumPesan;
    data['total_harga'] = totalHarga;
    data['kode_perusahaan_pbf'] = kodePerusahaanPbf;
    data['nama_perusahaan'] = namaPerusahaan;
    data['foto'] = foto;
    return data;
  }
}