class OrderDetailsModel {
  double? totalPrice;
  int? count;
  int? cartId;
  int? cartItemid;
  int? cartUserid;
  int? cartOrders;
  int? itemsId;
  String? itemsNameAr;
  String? itemsNameEn;
  String? itemsNameDe;
  String? itemsNameSp;
  String? itemsDescAr;
  String? itemsDescEn;
  String? itemsDescDe;
  String? itemsDescSp;
  int? itemsPrice;
  int? itemsDiscount;
  int? itemsCount;
  int? itemsActive;
  String? itemsImage;
  String? itemsCreateTime;
  int? itemsCategories;
  int? categoriesId;
  String? categoriesNameAr;
  String? categoriesNameEn;
  String? categoriesNameDe;
  String? categoriesNameSp;
  String? categoriesImage;
  String? categoriesCreateTime;
  double? finalPrice;
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

  OrderDetailsModel(
      {this.totalPrice,
      this.count,
      this.cartId,
      this.cartItemid,
      this.cartUserid,
      this.cartOrders,
      this.itemsId,
      this.itemsNameAr,
      this.itemsNameEn,
      this.itemsNameDe,
      this.itemsNameSp,
      this.itemsDescAr,
      this.itemsDescEn,
      this.itemsDescDe,
      this.itemsDescSp,
      this.itemsPrice,
      this.itemsDiscount,
      this.itemsCount,
      this.itemsActive,
      this.itemsImage,
      this.itemsCreateTime,
      this.itemsCategories,
      this.categoriesId,
      this.categoriesNameAr,
      this.categoriesNameEn,
      this.categoriesNameDe,
      this.categoriesNameSp,
      this.categoriesImage,
      this.categoriesCreateTime,
      this.finalPrice,
      this.ordersId,
      this.ordersUserid,
      this.ordersTotalPrice,
      this.ordersDeliveryPrice,
      this.ordersCoupon,
      this.ordersPaymentMethod,
      this.ordersDeliveryType,
      this.ordersAddressId,
      this.ordersDateTime,
      this.ordersStatus,
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

  OrderDetailsModel.fromJson(Map<String, dynamic> json) {
    totalPrice = double.parse(json['totalPrice'].toString());
    count = json['count'];
    cartId = json['cart_id'];
    cartItemid = json['cart_itemid'];
    cartUserid = json['cart_userid'];
    cartOrders = json['cart_orders'];
    itemsId = json['items_id'];
    itemsNameAr = json['items_name_ar'];
    itemsNameEn = json['items_name_en'];
    itemsNameDe = json['items_name_de'];
    itemsNameSp = json['items_name_sp'];
    itemsDescAr = json['items_desc_ar'];
    itemsDescEn = json['items_desc_en'];
    itemsDescDe = json['items_desc_de'];
    itemsDescSp = json['items_desc_sp'];
    itemsPrice = json['items_price'];
    itemsDiscount = json['items_discount'];
    itemsCount = json['items_count'];
    itemsActive = json['items_active'];
    itemsImage = json['items_image'];
    itemsCreateTime = json['items_createTime'];
    itemsCategories = json['items_categories'];
    categoriesId = json['categories_id'];
    categoriesNameAr = json['categories_name_ar'];
    categoriesNameEn = json['categories_name_en'];
    categoriesNameDe = json['categories_name_de'];
    categoriesNameSp = json['categories_name_sp'];
    categoriesImage = json['categories_image'];
    categoriesCreateTime = json['categories_createTime'];
    finalPrice = double.parse(json['finalPrice'].toString());
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
    addressId = json['address_id'];
    addressUserid = json['address_userid'];
    name = json['name'];
    street = json['street'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    goverAr = json['gover_ar'];
    goverEn = json['gover_en'];
    cityAr = json['city_ar'];
    cityEn = json['city_en'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalPrice'] = totalPrice;
    data['count'] = count;
    data['cart_id'] = cartId;
    data['cart_itemid'] = cartItemid;
    data['cart_userid'] = cartUserid;
    data['cart_orders'] = cartOrders;
    data['items_id'] = itemsId;
    data['items_name_ar'] = itemsNameAr;
    data['items_name_en'] = itemsNameEn;
    data['items_name_de'] = itemsNameDe;
    data['items_name_sp'] = itemsNameSp;
    data['items_desc_ar'] = itemsDescAr;
    data['items_desc_en'] = itemsDescEn;
    data['items_desc_de'] = itemsDescDe;
    data['items_desc_sp'] = itemsDescSp;
    data['items_price'] = itemsPrice;
    data['items_discount'] = itemsDiscount;
    data['items_count'] = itemsCount;
    data['items_active'] = itemsActive;
    data['items_image'] = itemsImage;
    data['items_createTime'] = itemsCreateTime;
    data['items_categories'] = itemsCategories;
    data['categories_id'] = categoriesId;
    data['categories_name_ar'] = categoriesNameAr;
    data['categories_name_en'] = categoriesNameEn;
    data['categories_name_de'] = categoriesNameDe;
    data['categories_name_sp'] = categoriesNameSp;
    data['categories_image'] = categoriesImage;
    data['categories_createTime'] = categoriesCreateTime;
    data['finalPrice'] = finalPrice;
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
