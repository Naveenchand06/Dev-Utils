import 'package:sharada_app/app/features/authentication/models/app_user.dart';

extension GetAppUser on AuthResponse {
  AppUser getAppUser() {
    final user = data!.user;
    return AppUser(
      id: user.id,
      name: user.name,
      email: user.email,
      isSuperUser: user.isSuperUser,
      original: user.original,
    );
  }
}

class AuthResponse {
  AuthResponse({
    required this.data,
  });

  final Data? data;

  const AuthResponse.unKnown() : data = null;

  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    return AuthResponse(
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
      };
}

class Data {
  Data({
    required this.token,
    required this.user,
  });

  final String token;
  final User user;

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      token: json["token"] ?? "",
      user: User.fromJson(json["user"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "token": token,
        "user": user.toJson(),
      };
}

class User {
  User({
    required this.original,
    required this.id,
    required this.name,
    required this.email,
    required this.isSuperUser,
    required this.v,
  });

  final bool original;
  final String id;
  final String name;
  final String email;
  final bool isSuperUser;
  final int v;

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      original: json["original"] ?? false,
      id: json["_id"] ?? "",
      name: json["name"] ?? "",
      email: json["email"] ?? "",
      isSuperUser: json["isSuperUser"] ?? false,
      v: json["__v"] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
        "original": original,
        "_id": id,
        "name": name,
        "email": email,
        "isSuperUser": isSuperUser,
        "__v": v,
      };
}
