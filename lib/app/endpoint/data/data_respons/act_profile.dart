class act_profile {
  String? namaPerusahaan;
  String? email;
  String? alamat;
  Null? kelurahan;
  Null? kecamatan;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nama_perusahaan'] = this.namaPerusahaan;
    data['email'] = this.email;
    data['alamat'] = this.alamat;
    data['kelurahan'] = this.kelurahan;
    data['kecamatan'] = this.kecamatan;
    data['kota'] = this.kota;
    data['propinsi'] = this.propinsi;
    data['kodepos'] = this.kodepos;
    data['telpon1'] = this.telpon1;
    data['telpon2'] = this.telpon2;
    data['fax'] = this.fax;
    data['foto'] = this.foto;
    data['Response'] = this.response;
    return data;
  }
}