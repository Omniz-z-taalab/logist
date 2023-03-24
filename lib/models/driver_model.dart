class DriversModel {
  int? id;
  int? userId;
  String? nationality;
  String? identityCard;
  String? license;
  String? vehicleRegisterNumber;
  String? plateNumber;
  String? identityCardPhotoFront;
  String? identityCardPhotoBack;
  String? lecensePhoto;
  int? vehicleTypeId;
  String? verified;
  String? avatar;
  String? status;
  int? numberOfShipments;
  String? phoneNumber;
  String? fullName;
  String? adrress;

  DriversModel(
      {this.id,
        this.userId,
        this.nationality,
        this.identityCard,
        this.license,
        this.vehicleRegisterNumber,
        this.plateNumber,
        this.identityCardPhotoFront,
        this.identityCardPhotoBack,
        this.lecensePhoto,
        this.avatar,
        this.vehicleTypeId,
        this.verified,
        this.status,
        this.numberOfShipments,
        this.phoneNumber,
        this.fullName,
        this.adrress});

  DriversModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    nationality = json['nationality'];
    identityCard = json['identity_card'];
    license = json['license'];
    avatar = json['avatar'];
    vehicleRegisterNumber = json['vehicle_register_number'];
    plateNumber = json['plate_number'];
    identityCardPhotoFront = json['identity_card_photo_front'];
    identityCardPhotoBack = json['identity_card_photo_back'];
    lecensePhoto = json['lecense_photo'];
    vehicleTypeId = json['vehicle_type_id'];
    verified = json['verified'];
    status = json['status'];
    numberOfShipments = json['number_of_shipments'];
    phoneNumber = json['phone_number'];
    fullName = json['full_name'];
    adrress = json['adrress'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['nationality'] = this.nationality;
    data['identity_card'] = this.identityCard;
    data['license'] = this.license;
    data['avatar'] = this.avatar;
    data['vehicle_register_number'] = this.vehicleRegisterNumber;
    data['plate_number'] = this.plateNumber;
    data['identity_card_photo_front'] = this.identityCardPhotoFront;
    data['identity_card_photo_back'] = this.identityCardPhotoBack;
    data['lecense_photo'] = this.lecensePhoto;
    data['vehicle_type_id'] = this.vehicleTypeId;
    data['verified'] = this.verified;
    data['status'] = this.status;
    data['number_of_shipments'] = this.numberOfShipments;
    data['phone_number'] = this.phoneNumber;
    data['full_name'] = this.fullName;
    data['adrress'] = this.adrress;
    return data;
  }
}


// class DriverModel {
//   int? id;
//   int? userId;
//   String? nationality;
//   String? identityCard;
//   String? license;
//   String? avatar;
//   String? vehicleRegisterNumber;
//   String? plateNumber;
//   String? identityCardPhotoFront;
//   String? identityCardPhotoBack;
//   String? lecensePhoto;
//   int? vehicleTypeId;
//   String? verified;
//   String? status;
//   int? numberOfShipments;
//   String? rejectionReason;
//   String? dateOfBirth;
//   String? phoneNumber;
//   String? fullName;
//   String? adrress;
//
//   DriverModel(
//       {this.id,
//         this.userId,
//         this.nationality,
//         this.identityCard,
//         this.license,
//         this.vehicleRegisterNumber,
//         this.plateNumber,
//         this.identityCardPhotoFront,
//         this.identityCardPhotoBack,
//         this.lecensePhoto,
//         this.vehicleTypeId,
//         this.verified,
//         this.status,
//         this.numberOfShipments,
//         this.rejectionReason,
//         this.dateOfBirth,
//         this.phoneNumber,
//         this.fullName,
//         this.adrress});
//
//   DriverModel.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     userId = json['user_id'];
//     nationality = json['nationality'];
//     identityCard = json['identity_card'];
//     license = json['license'];
//     vehicleRegisterNumber = json['vehicle_register_number'];
//     plateNumber = json['plate_number'];
//     identityCardPhotoFront = json['identity_card_photo_front'];
//     identityCardPhotoBack = json['identity_card_photo_back'];
//     lecensePhoto = json['lecense_photo'];
//     vehicleTypeId = json['vehicle_type_id'];
//     verified = json['verified'];
//     status = json['status'];
//     numberOfShipments = json['number_of_shipments'];
//     rejectionReason = json['rejection_reason'];
//     dateOfBirth = json['date_of_birth'];
//     phoneNumber = json['phone_number'];
//     fullName = json['full_name'];
//     adrress = json['adrress'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['user_id'] = this.userId;
//     data['nationality'] = this.nationality;
//     data['identity_card'] = this.identityCard;
//     data['license'] = this.license;
//     data['vehicle_register_number'] = this.vehicleRegisterNumber;
//     data['plate_number'] = this.plateNumber;
//     data['identity_card_photo_front'] = this.identityCardPhotoFront;
//     data['identity_card_photo_back'] = this.identityCardPhotoBack;
//     data['lecense_photo'] = this.lecensePhoto;
//     data['vehicle_type_id'] = this.vehicleTypeId;
//     data['verified'] = this.verified;
//     data['status'] = this.status;
//     data['number_of_shipments'] = this.numberOfShipments;
//     data['rejection_reason'] = this.rejectionReason;
//     data['date_of_birth'] = this.dateOfBirth;
//     data['phone_number'] = this.phoneNumber;
//     data['full_name'] = this.fullName;
//     data['adrress'] = this.adrress;
//     return data;
//   }
// }