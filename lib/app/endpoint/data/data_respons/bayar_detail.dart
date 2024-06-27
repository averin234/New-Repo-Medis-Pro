class bayar_detail {
  List<DataBayarDetail>? dataBayarDetail;
  int? jumlahParsial;
  int? jumlahLunas;
  int? response;
  int? code;
  String? msg;

  bayar_detail(
      {this.dataBayarDetail,
        this.jumlahParsial,
        this.jumlahLunas,
        this.response});

  bayar_detail.fromJson(Map<String, dynamic> json) {
    if (json['data_bayar_detail'] != null) {
      dataBayarDetail = <DataBayarDetail>[];
      json['data_bayar_detail'].forEach((v) {
        dataBayarDetail!.add(DataBayarDetail.fromJson(v));
      });
    }
    jumlahParsial = json['jumlahParsial'];
    jumlahLunas = json['jumlahLunas'];
    response = json['Response'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (dataBayarDetail != null) {
      data['data_bayar_detail'] =
          dataBayarDetail!.map((v) => v.toJson()).toList();
    }
    data['jumlahParsial'] = jumlahParsial;
    data['jumlahLunas'] = jumlahLunas;
    data['Response'] = response;
    return data;
  }
}

class DataBayarDetail {
  String? tglInvoice;
  String? noInvoice;
  String? totalHarga;
  int? status;
  int? code;
  String? msg;

  DataBayarDetail(
      {this.tglInvoice, this.noInvoice, this.totalHarga, this.status});

  DataBayarDetail.fromJson(Map<String, dynamic> json) {
    tglInvoice = json['tgl_invoice'];
    noInvoice = json['no_invoice'];
    totalHarga = json['total_harga'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['tgl_invoice'] = tglInvoice;
    data['no_invoice'] = noInvoice;
    data['total_harga'] = totalHarga;
    data['status'] = status;
    return data;
  }
}