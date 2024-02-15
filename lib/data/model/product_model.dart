class ProductModel {
  String ?sId ;
  String? title;
  String? description;
  int? price;
  List<String>? photos=[];
  String? condition;
  String? username="";
  String? listedBy;
  String? status="";
  String? category;
  String? tags="";
  String? usePeriod="";
  String? link="";
  String? createdAt;
  String? updatedAt;
  int? iV;

  ProductModel(
      {this.sId,
        this.title,
        this.description,
        this.price,
        this.photos,
        this.condition,
        this.username,
        this.listedBy,
        this.status,
        this.category,
        this.tags,
        this.usePeriod,
        this.link,
        this.createdAt,
        this.updatedAt,
        this.iV});

  ProductModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    description = json['description'];
    price = json['Price'];
    photos = json['photos'].cast<String>();
    condition = json['condition'];
    username = json['username'];
    listedBy = json['ListedBy'];
    status = json['status'];
    category = json['category'];
    tags = json['tags'];
    usePeriod = json['usePeriod'];
    link = json['link'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['title'] = this.title;
    data['description'] = this.description;
    data['Price'] = this.price;
    data['photos'] = this.photos ?? [""];
    data['condition'] = this.condition;
    // data['ListedBy'] = this.listedBy ;
    data['status'] = this.status ?? "available";
    data['category'] = this.category;
    data['tags'] = this.tags ?? "colllege item";
    data['usePeriod'] = this.usePeriod ?? "some days";
    data['link'] = this.link ??"";
    return data;
  }
}