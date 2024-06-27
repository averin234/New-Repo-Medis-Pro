class get_hutang_umur {
  int? response;
  int? code;
  String? msg;

  get_hutang_umur({this.response});

  get_hutang_umur.fromJson(Map<String, dynamic> json) {
    response = json['Response'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Response'] = response;
    return data;
  }
}