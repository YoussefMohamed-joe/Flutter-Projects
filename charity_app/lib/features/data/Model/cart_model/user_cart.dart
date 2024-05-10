import 'donation_item_id.dart';
import 'user_id.dart';

class UserCart {
  String? id;
  UserId? userId;
  String? organizationId;
  DonationItemId? donationItemId;
  int? quantity;
  int? totalPrice;
  DateTime? createdAt;
  int? v;

  UserCart({
    this.id,
    this.userId,
    this.organizationId,
    this.donationItemId,
    this.quantity,
    this.totalPrice,
    this.createdAt,
    this.v,
  });

  factory UserCart.fromJson(Map<String, dynamic> json) => UserCart(
        id: json['_id'] as String?,
        userId: json['userId'] == null
            ? null
            : UserId.fromJson(json['userId'] as Map<String, dynamic>),
        organizationId: json['organizationId'] as String?,
        donationItemId: json['donationItemId'] == null
            ? null
            : DonationItemId.fromJson(
                json['donationItemId'] as Map<String, dynamic>),
        quantity: json['quantity'] as int?,
        totalPrice: json['totalPrice'] as int?,
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
        v: json['__v'] as int?,
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'userId': userId?.toJson(),
        'organizationId': organizationId,
        'donationItemId': donationItemId?.toJson(),
        'quantity': quantity,
        'totalPrice': totalPrice,
        'createdAt': createdAt?.toIso8601String(),
        '__v': v,
      };
}
