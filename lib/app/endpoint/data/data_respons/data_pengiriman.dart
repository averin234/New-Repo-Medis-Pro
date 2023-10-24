class data_pengiriman {
  int? response;

  data_pengiriman({this.response});

  data_pengiriman.fromJson(Map<String, dynamic> json) {
    response = json['Response'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Response'] = this.response;
    return data;
  }
}