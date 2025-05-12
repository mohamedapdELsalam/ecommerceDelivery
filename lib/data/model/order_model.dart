class OrderModel {
  int? ordersId;
  int? ordersUserid;
  int? ordersTotalPrice;
  int? ordersDeliveryPrice;
  int? ordersCoupon;
  int? ordersPaymentMethod;
  int? ordersDeliveryType;
  int? ordersAddressId;
  String? ordersDateTime;
  int? ordersStatus;
  double? ordersRating;
  String? ordersNoteRating;
  int? addressId;
  int? addressUserid;
  String? name;
  String? street;
  double? latitude;
  double? longitude;
  String? goverAr;
  String? goverEn;
  String? cityAr;
  String? cityEn;

  OrderModel(
      {this.ordersId,
      this.ordersUserid,
      this.ordersTotalPrice,
      this.ordersDeliveryPrice,
      this.ordersCoupon,
      this.ordersPaymentMethod,
      this.ordersDeliveryType,
      this.ordersAddressId,
      this.ordersDateTime,
      this.ordersStatus,
      this.ordersRating,
      this.ordersNoteRating,
      this.addressId,
      this.addressUserid,
      this.name,
      this.street,
      this.latitude,
      this.longitude,
      this.goverAr,
      this.goverEn,
      this.cityAr,
      this.cityEn});

  OrderModel.fromJson(Map<String, dynamic> json) {
    ordersId = json['orders_id'];
    ordersUserid = json['orders_userid'];
    ordersTotalPrice = json['orders_totalPrice'];
    ordersDeliveryPrice = json['orders_deliveryPrice'];
    ordersCoupon = json['orders_coupon'];
    ordersPaymentMethod = json['orders_paymentMethod'];
    ordersDeliveryType = json['orders_deliveryType'];
    ordersAddressId = json['orders_addressId'];
    ordersDateTime = json['orders_dateTime'];
    ordersStatus = json['orders_status'];
    ordersRating = json['orders_rating'] + 0.0;
    ordersNoteRating = json['orders_note_rating'];
    addressId = json['address_id'];
    addressUserid = json['address_userid'] ?? 0;
    name = json['name'] ?? "0";
    street = json['street'] ?? "0";
    latitude = json['latitude'] ?? 0.0;
    longitude = json['longitude'] ?? 0.0;
    goverAr = json['gover_ar'] ?? "0";
    goverEn = json['gover_en'] ?? "0";
    cityAr = json['city_ar'] ?? "0";
    cityEn = json['city_en'] ?? "0";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['orders_id'] = ordersId;
    data['orders_userid'] = ordersUserid;
    data['orders_totalPrice'] = ordersTotalPrice;
    data['orders_deliveryPrice'] = ordersDeliveryPrice;
    data['orders_coupon'] = ordersCoupon;
    data['orders_paymentMethod'] = ordersPaymentMethod;
    data['orders_deliveryType'] = ordersDeliveryType;
    data['orders_addressId'] = ordersAddressId;
    data['orders_dateTime'] = ordersDateTime;
    data['orders_status'] = ordersStatus;
    data['orders_rating'] = ordersRating;
    data['orders_note_rating'] = ordersNoteRating;
    data['address_id'] = addressId;
    data['address_userid'] = addressUserid;
    data['name'] = name;
    data['street'] = street;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['gover_ar'] = goverAr;
    data['gover_en'] = goverEn;
    data['city_ar'] = cityAr;
    data['city_en'] = cityEn;
    return data;
  }
}
