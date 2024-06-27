class act_profile {
  String? namaPerusahaan;
  String? email;
  String? alamat;
  String? kelurahan;
  String? kecamatan;
  String? kota;
  String? propinsi;
  String? kodepos;
  String? telpon1;
  String? telpon2;
  String? fax;
  String? foto;
  int? code;
  String? msg;
  int? response;

  act_profile(
      {this.namaPerusahaan,
      this.email,
      this.alamat,
      this.kelurahan,
      this.kecamatan,
      this.kota,
      this.propinsi,
      this.kodepos,
      this.telpon1,
      this.telpon2,
      this.fax,
      this.foto,
      this.response});

  act_profile.fromJson(Map<String, dynamic> json) {
    namaPerusahaan = json['nama_perusahaan'];
    email = json['email'];
    alamat = json['alamat'];
    kelurahan = json['kelurahan'];
    kecamatan = json['kecamatan'];
    kota = json['kota'];
    propinsi = json['propinsi'];
    kodepos = json['kodepos'];
    telpon1 = json['telpon1'];
    telpon2 = json['telpon2'];
    fax = json['fax'];
    foto = json['foto'];
    response = json['Response'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nama_perusahaan'] = namaPerusahaan;
    data['email'] = email;
    data['alamat'] = alamat;
    data['kelurahan'] = kelurahan;
    data['kecamatan'] = kecamatan;
    data['kota'] = kota;
    data['propinsi'] = propinsi;
    data['kodepos'] = kodepos;
    data['telpon1'] = telpon1;
    data['telpon2'] = telpon2;
    data['fax'] = fax;
    data['foto'] = foto;
    data['Response'] = response;
    return data;
  }
}
