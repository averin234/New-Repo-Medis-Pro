class data_hutang_chart {
  String? bayar;
  String? hutang;
  int? code;
  String? msg;
  int? response;

  data_hutang_chart({this.bayar, this.hutang, this.response});

  data_hutang_chart.fromJson(Map<String, dynamic> json) {
    bayar = json['bayar'];
    hutang = json['hutang'];
    response = json['Response'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['bayar'] = bayar;
    data['hutang'] = hutang;
    data['Response'] = response;
    return data;
  }
}