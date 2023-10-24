class get_hutang_umur {
  int? response;

  get_hutang_umur({this.response});

  get_hutang_umur.fromJson(Map<String, dynamic> json) {
    response = json['Response'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Response'] = this.response;
    return data;
  }
}