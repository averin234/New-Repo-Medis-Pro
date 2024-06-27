class data_piutang_chart {
  String? terbayar;
  String? piutang;
  int? response;

  data_piutang_chart({this.terbayar, this.piutang, this.response});

  data_piutang_chart.fromJson(Map<String, dynamic> json) {
    terbayar = json['terbayar'];
    piutang = json['piutang'];
    response = json['Response'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['terbayar'] = terbayar;
    data['piutang'] = piutang;
    data['Response'] = response;
    return data;
  }
}