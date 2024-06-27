class data_piutang_det {
  int? response;

  data_piutang_det({this.response});

  data_piutang_det.fromJson(Map<String, dynamic> json) {
    response = json['Response'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Response'] = response;
    return data;
  }
}