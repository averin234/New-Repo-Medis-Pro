class statusProfile {
  String? dataObatApotik;
  String? obatDidistrex;
  String? dataMinumum;
  String? soBelumKonfirm;
  String? blmTerkirim;
  String? baBulanIni;
  int? code;
  String? msg;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['data_obat_apotik'] = dataObatApotik;
    data['obat_didistrex'] = obatDidistrex;
    data['data_minumum'] = dataMinumum;
    data['so_belum_konfirm'] = soBelumKonfirm;
    data['blm_terkirim'] = blmTerkirim;
    data['ba_bulan_ini'] = baBulanIni;
    data['Response'] = response;
    return data;
  }
}