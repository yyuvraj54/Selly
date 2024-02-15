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
  String? createdAt;
  String? updatedAt;
  int? iV;

  UserModel(
      {this.sId,
        this.name,
        this.email,
        this.phoneNumber,
        this.isAdmin,
        // this.requests,
        // this.wishlist,
        // this.products,
        // this.itemsBought,
        this.createdAt,
        this.updatedAt,
        this.iV});

  UserModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    isAdmin = json['isAdmin'];
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
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phoneNumber'] = this.phoneNumber;
    data['isAdmin'] = this.isAdmin;
    // data['wishlist'] = this.wishlist;
    // data['request'] = this.requests;
    // data['products'] = this.products;
    // data['itemsBought'] = this.itemsBought;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
