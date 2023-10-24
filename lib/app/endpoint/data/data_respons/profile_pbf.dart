class profile_pbf {
  String? dataCabang;
  bool? sqlBerlangganan;
  String? obatYgDimilik;
  String? sudahSo;
  String? obatInvoce;
  int? penjualanBlnIni;
  int? response;

  profile_pbf(
      {this.dataCabang,
        this.sqlBerlangganan,
        this.obatYgDimilik,
        this.sudahSo,
        this.obatInvoce,
        this.penjualanBlnIni,
        this.response});

  profile_pbf.fromJson(Map<String, dynamic> json) {
    dataCabang = json['data_cabang'];
    sqlBerlangganan = json['sql_berlangganan'];
    obatYgDimilik = json['obat_yg_dimilik'];
    sudahSo = json['sudah_so'];
    obatInvoce = json['obat_invoce'];
    penjualanBlnIni = json['penjualan_bln_ini'];
    response = json['Response'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['data_cabang'] = this.dataCabang;
    data['sql_berlangganan'] = this.sqlBerlangganan;
    data['obat_yg_dimilik'] = this.obatYgDimilik;
    data['sudah_so'] = this.sudahSo;
    data['obat_invoce'] = this.obatInvoce;
    data['penjualan_bln_ini'] = this.penjualanBlnIni;
    data['Response'] = this.response;
    return data;
  }
}