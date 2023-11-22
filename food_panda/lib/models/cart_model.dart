class CartModel {
  int? id;
  String? name;

  int? price;

  String? img;
  int? quantity;
  bool? isExist;
  String? time;

  CartModel({
    this.id,
    this.name,
    this.price,
    this.img,
    this.quantity,
    required this.isExist,
    this.time,
  });

  CartModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    quantity = json['quantity'];
    isExist;
    ['isExist'];
    time = json['time'];

    price = json['price'];

    img = json['img'];
  }
}
