class Product {
  String? id;
  String? name;
  String? category;
  String? brand;
  String? model;
  double? price;
  String? colour;
  String? weight;
  String? imageUrl;

  Product(
      {this.id,
      this.name,
      this.category,
      this.brand,
      this.model,
      this.price,
      this.colour,
      this.weight,
      this.imageUrl});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    category = json['category'];
    brand = json['brand'];
    model = json['model'];
    price = json['price'];
    colour = json['colour'];
    weight = json['weight'];
    imageUrl = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['category'] = category;
    data['brand'] = brand;
    data['model'] = model;
    data['price'] = price;
    data['colour'] = colour;
    data['weight'] = weight;
    data['image'] = imageUrl;
    return data;
  }
}







class ApiRes {
  dynamic albumId;
  dynamic  id;
  String? title;
  String? url;
  String? thumbnailUrl;

  // "albumId": 1,
  // "id": 1,
  // "title": "accusamus beatae ad facilis cum similique qui sunt",
  // "url": "https://via.placeholder.com/600/92c952",
  // "thumbnailUrl": "https://via.placeholder.com/150/92c952"
  // "": 1,
  // "id": 1,
  // "title": "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
  // "body":

  ApiRes(
      {this.id,
       this.albumId,
      this.title,this.thumbnailUrl});

  ApiRes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    albumId= json['albumId'];

    title = json['title'];
    thumbnailUrl= json['thumbnailUrl'];

    // name = json['name'];
    // category = json['category'];
    // brand = json['brand'];
    // model = json['model'];
    // price = json['price'];
    // colour = json['colour'];
    // weight = json['weight'];
    // imageUrl = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['albumId'] = albumId;
    data['thumbnailUrl'] = thumbnailUrl;
    data['title'] = title;
    // data['model'] = model;
    // data['price'] = price;
    // data['colour'] = colour;
    // data['weight'] = weight;
    // data['image'] = imageUrl;
    return data;
  }
}
