class acc_detail {
  List<DataAccDetail>? dataAccDetail;
  int? response;

  acc_detail({this.dataAccDetail, this.response});

  acc_detail.fromJson(Map<String, dynamic> json) {
    if (json['data_acc_detail'] != null) {
      dataAccDetail = <DataAccDetail>[];
      json['data_acc_detail'].forEach((v) {
        dataAccDetail!.add(DataAccDetail.fromJson(v));
      });
    }
    response = json['Response'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (dataAccDetail != null) {
      data['data_acc_detail'] =
          dataAccDetail!.map((v) => v.toJson()).toList();
    }
    data['Response'] = response;
    return data;
  }
}

class DataAccDetail {
  String? idTcHutangSupplierInv;
  String? tglInvoice;
  String? noInvoice;
  String? status;
  String? totalHarga;
  String? tglJt;
  String? tglAccDireksi;
  String? totalBayar;

  DataAccDetail(
      {this.idTcHutangSupplierInv,
        this.tglInvoice,
        this.noInvoice,
        this.status,
        this.totalHarga,
        this.tglJt,
        this.tglAccDireksi,
        this.totalBayar});

  DataAccDetail.fromJson(Map<String, dynamic> json) {
    idTcHutangSupplierInv = json['id_tc_hutang_supplier_inv'];
    tglInvoice = json['tgl_invoice'];
    noInvoice = json['no_invoice'];
    status = json['status'];
    totalHarga = json['total_harga'];
    tglJt = json['tgl_jt'];
    tglAccDireksi = json['tgl_acc_direksi'];
    totalBayar = json['total_bayar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id_tc_hutang_supplier_inv'] = idTcHutangSupplierInv;
    data['tgl_invoice'] = tglInvoice;
    data['no_invoice'] = noInvoice;
    data['status'] = status;
    data['total_harga'] = totalHarga;
    data['tgl_jt'] = tglJt;
    data['tgl_acc_direksi'] = tglAccDireksi;
    data['total_bayar'] = totalBayar;
    return data;
  }
}