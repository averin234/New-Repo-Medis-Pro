class data_acc_detail {
  int? response;

  data_acc_detail({this.response});

  data_acc_detail.fromJson(Map<String, dynamic> json) {
    response = json['Response'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Response'] = this.response;
    return data;
  }
}