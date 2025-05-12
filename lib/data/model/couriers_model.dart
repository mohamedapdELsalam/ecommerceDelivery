class CouriersModel {
  int? couriersId;
  String? couriersName;
  String? couriersEmail;
  String? couriersPassword;
  String? couriersPhone;
  int? couriersVerifycode;
  int? couriersApprove;
  String? couriersCreatetime;

  CouriersModel({
    this.couriersId,
    this.couriersName,
    this.couriersEmail,
    this.couriersPassword,
    this.couriersPhone,
    this.couriersVerifycode,
    this.couriersApprove,
    this.couriersCreatetime,
  });

  CouriersModel.fromJson(Map<String, dynamic> json) {
    couriersId = json['couriers_id'];
    couriersName = json['couriers_name'];
    couriersEmail = json['couriers_email'];
    couriersPassword = json['couriers_password'];
    couriersPhone = json['couriers_phone'].toString();
    couriersVerifycode = json['couriers_verifycode'];
    couriersApprove = json['couriers_approve'];
    couriersCreatetime = json['couriers_createtime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['couriers_id'] = couriersId;
    data['couriers_name'] = couriersName;
    data['couriers_email'] = couriersEmail;
    data['couriers_password'] = couriersPassword;
    data['couriers_phone'] = couriersPhone;
    data['couriers_verifycode'] = couriersVerifycode;
    data['couriers_approve'] = couriersApprove;
    data['couriers_createtime'] = couriersCreatetime;
    return data;
  }
}
