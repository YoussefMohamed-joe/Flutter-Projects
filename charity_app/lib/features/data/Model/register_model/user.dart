class User {
  String? name;
  String? email;
  String? phoneNumber;
  String? role;
  bool? active;
  String? id;
  int? v;

  User({
    this.name,
    this.email,
    this.phoneNumber,
    this.role,
    this.active,
    this.id,
    this.v,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        name: json['name'] as String?,
        email: json['email'] as String?,
        phoneNumber: json['phoneNumber'] as String?,
        role: json['role'] as String?,
        active: json['active'] as bool?,
        id: json['_id'] as String?,
        v: json['__v'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'phoneNumber': phoneNumber,
        'role': role,
        'active': active,
        '_id': id,
        '__v': v,
      };
}
