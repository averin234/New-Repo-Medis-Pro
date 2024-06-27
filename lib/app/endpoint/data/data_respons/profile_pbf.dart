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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['data_cabang'] = dataCabang;
    data['sql_berlangganan'] = sqlBerlangganan;
    data['obat_yg_dimilik'] = obatYgDimilik;
    data['sudah_so'] = sudahSo;
    data['obat_invoce'] = obatInvoce;
    data['penjualan_bln_ini'] = penjualanBlnIni;
    data['Response'] = response;
    return data;
  }
}