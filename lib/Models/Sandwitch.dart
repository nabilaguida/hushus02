

class Sandwitch {
  String sand_id;
  // String size;
  List<String> ingredents;
  int price;
  int qntt;

  Sandwitch(
      {required this.sand_id,
        required this.ingredents,
        // required this.size,
        required this.price,
        required this.qntt
      }
      );

  factory Sandwitch.fromJson(
      Map<String, dynamic> responseData) {
    return Sandwitch(
      sand_id: responseData['sand_id'] ?? 'sand_id',
      ingredents: responseData['ingredents'] ?? 'ingredents',
      // size: responseData['size'] ?? 'size',
      price: responseData['price'] ?? 'price',
      qntt: responseData['qntt'] ?? 'qntt',


    );
  }
  Map<String, dynamic> toJson() {
    return {
      'sand_id': sand_id,
      'ingredients': ingredents,
      // 'size': size,
      'price': price,
      'qntt': qntt
    };
  }
}