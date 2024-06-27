class act_login {
  String? kodePerusahaan;
  int? response;
  int? code;
  String? msg;

  act_login({this.kodePerusahaan, this.response});

  act_login.fromJson(Map<String, dynamic> json) {
    kodePerusahaan = json['kode_perusahaan'];
    response = json['Response'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['kode_perusahaan'] = kodePerusahaan;
    data['Response'] = response;
    return data;
  }
}