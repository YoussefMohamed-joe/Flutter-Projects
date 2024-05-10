import 'user_cart.dart';

class CartModel {
  int? results;
  String? status;
  List<UserCart>? userCarts;

  CartModel({this.results, this.status, this.userCarts});

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
        results: json['results'] as int?,
        status: json['status'] as String?,
        userCarts: (json['userCarts'] as List<dynamic>?)
            ?.map((e) => UserCart.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'results': results,
        'status': status,
        'userCarts': userCarts?.map((e) => e.toJson()).toList(),
      };
}
