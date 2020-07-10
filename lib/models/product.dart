
//temanın kendi productu
class Product{
  String image;
  String name;
  String description;
  double price;

  Product(this.image, this.name, this.description, this.price);
}

//firebase push product
class product{
  product(this.image, this.name, this.description,this.category, this.price);
  String name;
  String image;
  String description;
  String category;
  double price;

  product.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    image = json['image'];
    description = json['description'];
    category = json['category'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.name;
    data['image'] = this.image;
    data['description'] = this.description;
    data['category'] = this.category;
    data['price'] = this.price;
    return data;
  }
}


