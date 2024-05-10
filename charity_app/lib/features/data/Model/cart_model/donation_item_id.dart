class DonationItemId {
  String? donationType;
  String? productImage;
  String? tagName;
  String? description;
  int? quantity;
  int? price;
  String? id;

  DonationItemId({
    this.donationType,
    this.productImage,
    this.tagName,
    this.description,
    this.quantity,
    this.price,
    this.id,
  });

  factory DonationItemId.fromJson(Map<String, dynamic> json) {
    return DonationItemId(
      donationType: json['donationType'] as String?,
      productImage: json['productImage'] as String?,
      tagName: json['tagName'] as String?,
      description: json['description'] as String?,
      quantity: json['quantity'] as int?,
      price: json['price'] as int?,
      id: json['_id'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'donationType': donationType,
        'productImage': productImage,
        'tagName': tagName,
        'description': description,
        'quantity': quantity,
        'price': price,
        '_id': id,
      };
}
