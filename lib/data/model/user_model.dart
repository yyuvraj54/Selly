class UserModel {
  String? sId;
  String? name;
  String? email;
  int? phoneNumber;
  bool? isAdmin;
  // List? requests;
  // List? wishlist;
  // List? products;
  // List? itemsBought;
  String? telegram_username;
  String? college;
  String? address;
  String? createdAt;
  String? updatedAt;
  int? iV;

  UserModel(
      {this.sId,
        this.name,
        this.email,
        this.phoneNumber,
        this.isAdmin,
        this.address,
        this.telegram_username,
        // this.requests,
        // this.wishlist,
        // this.products,
        // this.itemsBought,
        this.createdAt,
        this.updatedAt,
        this.college,
        this.iV});

  UserModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    address = json['Address'];
    isAdmin = json['isAdmin'];
    telegram_username = json['telegramName'];
    college = json['college'];
    // requests = json['request'].cast<String>();
    // wishlist = json['wishlist'].cast<String>();
    // products =json['products'].cast<String>();
    // itemsBought = json['itemsBought'].cast<String>();
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    // data['_id'] = this.sId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phoneNumber'] = this.phoneNumber;
    data['isAdmin'] = this.isAdmin;
    data['telegramName'] = this.telegram_username;
    data['college']= this.college;
    data['Address']= this.address;
    // data['wishlist'] = this.wishlist;
    // data['request'] = this.requests;
    // data['products'] = this.products;
    // data['itemsBought'] = this.itemsBought;
    // data['createdAt'] = this.createdAt;
    // data['updatedAt'] = this.updatedAt;
    // data['__v'] = this.iV;
    return data;
  }
}
