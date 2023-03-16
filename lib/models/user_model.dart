class UserModel {
  dynamic? id;
  dynamic? avatar;
  dynamic? fullName;
  dynamic? phoneNumber;
  dynamic? gender;
  dynamic? birthDate;
  dynamic? adrress;
  dynamic? email;
  dynamic? userLocation;
  dynamic? createdDate;

  UserModel(
      {this.id,
      this.avatar,
      this.fullName,
      this.phoneNumber,
      this.gender,
      this.birthDate,
      this.adrress,
      this.email,
      this.userLocation,
      this.createdDate});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    avatar = json['avatar'];
    fullName = json['full_name'];
    phoneNumber = json['phone_number'];

    gender = json['gender'];
    birthDate = json['birth_date'];

    adrress = json['adrress'];
    email = json['email'];

    userLocation = json['user_location'];
    createdDate = json['created_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['avatar'] = this.avatar;
    data['full_name'] = this.fullName;
    data['phone_number'] = this.phoneNumber;
    data['gender'] = this.gender;
    data['birth_date'] = this.birthDate;
    data['adrress'] = this.adrress;
    data['email'] = this.email;
    data['user_location'] = this.userLocation;
    data['created_date'] = this.createdDate;
    return data;
  }
}
