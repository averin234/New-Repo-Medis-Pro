class data_piutang {
  int? response;

  data_piutang({this.response});

  data_piutang.fromJson(Map<String, dynamic> json) {
    response = json['Response'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Response'] = response;
    return data;
  }
}