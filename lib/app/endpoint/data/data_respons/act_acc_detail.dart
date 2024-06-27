class act_acc_detail {
  int? response;
  int? code;
  String? msg;

  act_acc_detail({this.response});

  act_acc_detail.fromJson(Map<String, dynamic> json) {
    response = json['Response'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Response'] = response;
    return data;
  }
}