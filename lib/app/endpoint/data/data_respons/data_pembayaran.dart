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
        dataPembayaran!.add(new DataPembayaran.fromJson(v));
      });
    }
    totalHutang = json['total_hutang'];
    response = json['Response'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.dataPembayaran != null) {
      data['data_Pembayaran'] =
          this.dataPembayaran!.map((v) => v.toJson()).toList();
    }
    data['total_hutang'] = this.totalHutang;
    data['Response'] = this.response;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['jum_pesan'] = this.jumPesan;
    data['total_harga'] = this.totalHarga;
    data['kode_perusahaan_pbf'] = this.kodePerusahaanPbf;
    data['nama_perusahaan'] = this.namaPerusahaan;
    data['foto'] = this.foto;
    return data;
  }
}