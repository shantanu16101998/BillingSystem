import 'dart:ui';

class ProductObj {
  var count = 0;
  var name = '';

  ProductObj(this.count, this.name);
}

List<ProductObj> productList = [
  ProductObj(0, 'Aloo'),
  ProductObj(0, 'Pyaz'),
  ProductObj(0, 'Gobi'),
  ProductObj(0, 'Matar'),
  ProductObj(0, 'Bhindi'),
];

const phoneWidth = 760;
const figmaHeightFactor = 0.81545064377;
const figmaCyan = Color(0xFF55AABB);
const figmawhite = Color.fromRGBO(243, 243, 243, 1.0);
