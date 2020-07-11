import 'package:flutter/material.dart';

class Category{
  Color begin;
  Color end;
  String category;
  String image;

  Category(this.begin, this.end, this.category, this.image);


}



class category{
  String title ;
  String image;
  category( this.title, this.image);

  category.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['image'] = this.image;
    return data;
  }

}

