class bayar_detail {
  int? response;

  bayar_detail({this.response});

  bayar_detail.fromJson(Map<String, dynamic> json) {
    response = json['Response'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Response'] = this.response;
    return data;
  }
}