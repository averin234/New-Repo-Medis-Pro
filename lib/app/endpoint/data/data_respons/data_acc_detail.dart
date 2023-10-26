class acc_detail {
  List<DataAccDetail>? dataAccDetail;
  int? response;

  acc_detail({this.dataAccDetail, this.response});

  acc_detail.fromJson(Map<String, dynamic> json) {
    if (json['data_acc_detail'] != null) {
      dataAccDetail = <DataAccDetail>[];
      json['data_acc_detail'].forEach((v) {
        dataAccDetail!.add(new DataAccDetail.fromJson(v));
      });
    }
    response = json['Response'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.dataAccDetail != null) {
      data['data_acc_detail'] =
          this.dataAccDetail!.map((v) => v.toJson()).toList();
    }
    data['Response'] = this.response;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_tc_hutang_supplier_inv'] = this.idTcHutangSupplierInv;
    data['tgl_invoice'] = this.tglInvoice;
    data['no_invoice'] = this.noInvoice;
    data['status'] = this.status;
    data['total_harga'] = this.totalHarga;
    data['tgl_jt'] = this.tglJt;
    data['tgl_acc_direksi'] = this.tglAccDireksi;
    data['total_bayar'] = this.totalBayar;
    return data;
  }
}