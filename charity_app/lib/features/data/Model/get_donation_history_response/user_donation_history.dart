class UserDonationHistory {
  String? id;
  String? paymentId;
  String? receiptEmail;
  int? totalPrice;
  String? status;
  DateTime? paymentDate;
  int? v;

  UserDonationHistory({
    this.id,
    this.paymentId,
    this.receiptEmail,
    this.totalPrice,
    this.status,
    this.paymentDate,
    this.v,
  });

  factory UserDonationHistory.fromJson(Map<String, dynamic> json) {
    return UserDonationHistory(
      id: json['_id'] as String?,
      paymentId: json['paymentId'] as String?,
      receiptEmail: json['receiptEmail'] as String?,
      totalPrice: json['totalPrice'] as int?,
      status: json['status'] as String?,
      paymentDate: json['paymentDate'] == null
          ? null
          : DateTime.parse(json['paymentDate'] as String),
      v: json['__v'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
        '_id': id,
        'paymentId': paymentId,
        'receiptEmail': receiptEmail,
        'totalPrice': totalPrice,
        'status': status,
        'paymentDate': paymentDate?.toIso8601String(),
        '__v': v,
      };
}
