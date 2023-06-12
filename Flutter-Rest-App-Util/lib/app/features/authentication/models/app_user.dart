class AppUser {
  AppUser({
    required this.id,
    required this.name,
    required this.email,
    required this.isSuperUser,
    required this.original,
  });

  AppUser.unknown()
      : id = '',
        name = '',
        email = '',
        isSuperUser = false,
        original = false;

  final String id;
  final String name;
  final String email;
  final bool isSuperUser;
  final bool original;

  factory AppUser.fromJson(Map<String, dynamic> json) {
    return AppUser(
      id: json["_id"] ?? "",
      name: json["name"] ?? "",
      email: json["email"] ?? "",
      isSuperUser: json["isSuperUser"] ?? false,
      original: json["original"] ?? false,
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "isSuperUser": isSuperUser,
        "original": original,
      };
}
