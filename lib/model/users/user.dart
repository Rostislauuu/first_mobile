class User {
  final String id;
  final String fullName;
  final String birthday;
  final String direction;
  final String subdirection;
  final String email;
  final String phone;
  final String img;

  User({
    this.id,
    this.fullName,
    this.birthday,
    this.direction,
    this.subdirection,
    this.email,
    this.phone,
    this.img,
  });

  User.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        fullName = json['fullName'],
        birthday = json['birthday'],
        direction = json['direction'],
        subdirection = json['subdirection'],
        email = json['email'],
        phone = json['phone'],
        img = json['img'];
}
