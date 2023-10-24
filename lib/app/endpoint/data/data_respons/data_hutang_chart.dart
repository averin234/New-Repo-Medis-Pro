class data_hutang_chart {
  String? bayar;
  String? hutang;
  int? response;

  data_hutang_chart({this.bayar, this.hutang, this.response});

  data_hutang_chart.fromJson(Map<String, dynamic> json) {
    bayar = json['bayar'];
    hutang = json['hutang'];
    response = json['Response'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['bayar'] = this.bayar;
    data['hutang'] = this.hutang;
    data['Response'] = this.response;
    return data;
  }
}