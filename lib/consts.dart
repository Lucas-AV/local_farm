import 'package:flutter/material.dart';
import 'producer_widget.dart';

MaterialColor colorToMaterialColor(Color color) {
  Map<int, Color> swatch = {
    50: color.withOpacity(0.1),
    100: color.withOpacity(0.2),
    200: color.withOpacity(0.3),
    300: color.withOpacity(0.4),
    400: color.withOpacity(0.5),
    500: color.withOpacity(0.6),
    600: color.withOpacity(0.7),
    700: color.withOpacity(0.8),
    800: color.withOpacity(0.9),
    900: color.withOpacity(1.0),
  };

  return MaterialColor(color.value, swatch);
}

Map<String,dynamic> sizes = {
  "padding":44.0,
  "logo":{
    "height":611.0,
    "width":1440.0,
  },
  "tag":{
    "height":161.0,
    "width":426.0,
    "padding":62.0,
  },
  "outdoor":{
    "height":543.0,
    "width":1000.0,
    "padding":62.0,
  },
  "divisor":{
    "height":5.0,
    "width":1174.0,
  },
  "item":{
    "height":200.0,
    "width":1325.0,
  },
  "producer":{
    "height":289.0,
    "width":1325.0,
  },
  "#":{
    "height":161.0,
    "width":161.0,
  },
  "img-item":{
    "width":330.0,
    "height":200.0,
  },
  "appbar":{
    "width":1440.0,
    "height":236.0,
  },
  "button":{
    "width":150.0,
    "height":150.0,
  },
  "nameField":{
    "width":1325.0,
    "height":247.0,
  },
  "phoneField":{
    "width":1325.0,
    "height":247.0,
  },
  "bioField":{
    "width":1325.0,
    "height":385.0,
  },
  "categoryCard":{
    "width":1328.0,
    "height":543.0,
  }
};

List<String> exampleTags = ["Tag 1", "Tag 2", "Tag 3", "Tag 4", "Tag 5","Tag 6"];

List<Product> products = [
  Product(
      "Shimeji Mushrooms",
      ["Tag 1", "Tag 2", "Tag 3", "Tag 4", "Tag 5","Tag 6"]
  ),
  Product(
      "Red Neck Chicken",
      ["Tag 1", "Tag 2", "Tag 3", "Tag 4", "Tag 5","Tag 6"]
  ),
  Product(
      "Fresh tomatoes",
      ["Tag 1", "Tag 2", "Tag 3", "Tag 4", "Tag 5","Tag 6"]
  ),
  Product(
      "Blueberry Jam",
      ["Tag 1", "Tag 2", "Tag 3", "Tag 4", "Tag 5","Tag 6"]
  ),
  Product(
      "Blood Orange",
      ["Tag 1", "Tag 2", "Tag 3", "Tag 4", "Tag 5","Tag 6"]
  ),
  Product(
      "Pomegranate",
      ["Tag 1", "Tag 2", "Tag 3", "Tag 4", "Tag 5","Tag 6"]
  ),
  Product(
      "Watermelons",
      ["Tag 1", "Tag 2", "Tag 3", "Tag 4", "Tag 5","Tag 6"]
  ),
  Product(
      "Corn grains",
      ["Tag 1", "Tag 2", "Tag 3", "Tag 4", "Tag 5","Tag 6"]
  ),
  Product(
      "Milk Curd",
      ["Tag 1", "Tag 2", "Tag 3", "Tag 4", "Tag 5","Tag 6"]
  ),
];

Producer producerExample = Producer("Producer", "Store name", ["Tag 1", "Tag 2", "Tag 3", "Tag 4", "Tag 5","Tag 6"], products);



class Product {
  String name;
  List<String> tags;
  Map<String,dynamic> nutritionFacts = {
    "Carbohydrate":"",
    "Phosphorus":"",
    "Potassium":"",
    "Calcium":"",
    "Protein":"",
    "Fiber":"",
    "Iron":"",
    "Zinc":"",
  };
  Product(this.name,this.tags);
}

double axisHeight = 3040;
double axisWidth = 1440;
double radius = 7.5;
Color quadGreen = const Color(0xffD9E9D7);
Color thirdColor = const Color(0xff89AE86);
Color primaryColor = const Color(0xff72986F);
Color secondaryGreen = const Color(0xffA0C09E);
Color primaryBlack = const Color(0xff1A1A1A);
Color secondaryColor = const Color(0xff4D293E);
Color primaryGrey = const Color(0xff595959);
Color primaryOyster = const Color(0xff996E68);
Color backgroundColor = const Color(0xffF2FEF1);

List<IconData> iconList = [Icons.home_rounded,Icons.search,Icons.location_on_rounded,Icons.account_circle];
List<String> imagesName = ["farm","search","locate","profile"];
List<String> categories = ["Mushrooms","Vegetables & Fruits","Grains & Cereals","Craft Drinks","Dairy Products"];