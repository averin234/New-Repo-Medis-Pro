class statusProfile {
  String? dataObatApotik;
  String? obatDidistrex;
  String? dataMinumum;
  String? soBelumKonfirm;
  String? blmTerkirim;
  String? baBulanIni;
  int? response;

  statusProfile(
      {this.dataObatApotik,
        this.obatDidistrex,
        this.dataMinumum,
        this.soBelumKonfirm,
        this.blmTerkirim,
        this.baBulanIni,
        this.response});

  statusProfile.fromJson(Map<String, dynamic> json) {
    dataObatApotik = json['data_obat_apotik'];
    obatDidistrex = json['obat_didistrex'];
    dataMinumum = json['data_minumum'];
    soBelumKonfirm = json['so_belum_konfirm'];
    blmTerkirim = json['blm_terkirim'];
    baBulanIni = json['ba_bulan_ini'];
    response = json['Response'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['data_obat_apotik'] = this.dataObatApotik;
    data['obat_didistrex'] = this.obatDidistrex;
    data['data_minumum'] = this.dataMinumum;
    data['so_belum_konfirm'] = this.soBelumKonfirm;
    data['blm_terkirim'] = this.blmTerkirim;
    data['ba_bulan_ini'] = this.baBulanIni;
    data['Response'] = this.response;
    return data;
  }
}