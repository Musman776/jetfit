// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserModel {
  String? name;
  String? id;
  String? imageURL;
  String? email;
  String? password;
  String? status;
  String? role;

  UserModel({
    this.name,
    this.id,
    this.imageURL,
    this.email,
    this.password,
    this.status,
    this.role,
  });

  UserModel copyWith({
    String? name,
    String? id,
    String? imageURL,
    String? email,
    String? password,
    String? status,
    String? role,
  }) {
    return UserModel(
      name: name ?? this.name,
      id: id ?? this.id,
      imageURL: imageURL ?? this.imageURL,
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
      role: role ?? this.role,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'id': id,
      'imageURL': imageURL,
      'email': email,
      'password': password,
      'status': status,
      'role': role,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] != null ? map['name'] as String : null,
      id: map['id'] != null ? map['id'] as String : null,
      imageURL: map['imageURL'] != null ? map['imageURL'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      password: map['password'] != null ? map['password'] as String : null,
      status: map['status'] != null ? map['status'] as String : null,
      role: map['role'] != null ? map['role'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(name: $name, id: $id, imageURL: $imageURL, email: $email, password: $password, status: $status, role: $role)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.id == id &&
        other.imageURL == imageURL &&
        other.email == email &&
        other.password == password &&
        other.status == status &&
        other.role == role;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        id.hashCode ^
        imageURL.hashCode ^
        email.hashCode ^
        password.hashCode ^
        status.hashCode ^
        role.hashCode;
  }
}
