class data_pemesanan_det {
  int? response;

  data_pemesanan_det({this.response});

  data_pemesanan_det.fromJson(Map<String, dynamic> json) {
    response = json['Response'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Response'] = this.response;
    return data;
  }
}