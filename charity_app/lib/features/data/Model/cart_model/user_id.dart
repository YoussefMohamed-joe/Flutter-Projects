class UserId {
  String? id;
  String? name;
  String? email;

  UserId({this.id, this.name, this.email});

  factory UserId.fromJson(Map<String, dynamic> json) => UserId(
        id: json['_id'] as String?,
        name: json['name'] as String?,
        email: json['email'] as String?,
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'name': name,
        'email': email,
      };
}
