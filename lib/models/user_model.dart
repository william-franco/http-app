class UserModel {
  late int id;
  late String firstName;
  late String lastName;
  late String email;
  late String profileUrl =
      'https://logowik.com/content/uploads/images/flutter5786.jpg';

  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.profileUrl,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['name'];
    lastName = json['username'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    // final Map<String, dynamic> data = Map<String, dynamic>();
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = firstName;
    data['username'] = lastName;
    data['email'] = email;
    return data;
  }

  static List<UserModel> jsonToList(List<dynamic> data) {
    return data.map((itens) => UserModel.fromJson(itens)).toList();
  }
}
