class DriverModel {
  String? fullName;
  String? phonenumber;
  String? adrress;
  String? email;
  String? nationality;
  String? identityCard;
  String? license;
  String? vehicleRegisterNumber;
  String? plateNumber;
  String? identityCardPhotoFront;
  String? identityCardPhotoBack;
  String? lecensePhoto;
  int? vehicleTypeId;
  int? trailerIds;
  int? trailerTypeIds;

  DriverModel(
      {this.fullName,
      this.phonenumber,
      this.adrress,
      this.email,
      this.nationality,
      this.identityCard,
      this.license,
      this.vehicleRegisterNumber,
      this.plateNumber,
      this.identityCardPhotoFront,
      this.identityCardPhotoBack,
      this.lecensePhoto,
      this.vehicleTypeId,
      this.trailerIds,
      this.trailerTypeIds});

  DriverModel.fromJson(Map<String, dynamic> json) {
    fullName = json['FullName'];
    phonenumber = json['phonenumber'];
    adrress = json['adrress'];
    email = json['email'];
    nationality = json['nationality'];
    identityCard = json['identity_card'];
    license = json['license'];
    vehicleRegisterNumber = json['vehicle_register_number'];
    plateNumber = json['plate_number'];
    identityCardPhotoFront = json['identity_card_photo_front'];
    identityCardPhotoBack = json['identity_card_photo_back'];
    lecensePhoto = json['lecense_photo'];
    vehicleTypeId = json['vehicle_type_id'];
    trailerIds = json['TrailerIds'];
    trailerTypeIds = json['TrailerTypeIds'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['FullName'] = this.fullName;
    data['phonenumber'] = this.phonenumber;
    data['adrress'] = this.adrress;
    data['email'] = this.email;
    data['nationality'] = this.nationality;
    data['identity_card'] = this.identityCard;
    data['license'] = this.license;
    data['vehicle_register_number'] = this.vehicleRegisterNumber;
    data['plate_number'] = this.plateNumber;
    data['identity_card_photo_front'] = this.identityCardPhotoFront;
    data['identity_card_photo_back'] = this.identityCardPhotoBack;
    data['lecense_photo'] = this.lecensePhoto;
    data['vehicle_type_id'] = this.vehicleTypeId;
    data['TrailerIds'] = this.trailerIds;
    data['TrailerTypeIds'] = this.trailerTypeIds;
    return data;
  }
}
