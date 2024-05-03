class User {
  String? id;
  String? name;
  String? email;
  String? phoneNumber;
  String? role;
  int? v;

  User({
    this.id,
    this.name,
    this.email,
    this.phoneNumber,
    this.role,
    this.v,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['_id'] as String?,
        name: json['name'] as String?,
        email: json['email'] as String?,
        phoneNumber: json['phoneNumber'] as String?,
        role: json['role'] as String?,
        v: json['__v'] as int?,
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'name': name,
        'email': email,
        'phoneNumber': phoneNumber,
        'role': role,
        '__v': v,
      };
}
