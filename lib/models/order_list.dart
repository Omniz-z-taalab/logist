class AllOrders {
  var id;
  var driverID;
  var userId;
  String? dateOfOrder;
  var distination;
  var location;
  var paymentDone;
  var totalDistance;
  var price;
  var accepted;
  var canceled;
  var viecleId;
  var trailerId;
  var currentLocation;
  String? orderType;
  var orderComplited;
  var started;
  String? orderStartTime;
  String? orderEndTime;
  String? driverName;
  String? userName;
  String? status;
  var distinationLat;
  var distinationLong;
  var locationLat;
  var locationLong;
  var currentLocationLat;
  var currentLocationLong;
  String? trailerName;
  String? trailerPic;
  String? trailerDesc;

  int? vehicleTypeId;
  int? trailerTypeId;
  String? traillerTypeName;
  String? traillerTypePic;
  String? traillerTypeDesc;
  String? vehicleName;
  String? vehiclePic;
  String? vehicleDesc;
  String? vehicleTypeName;
  String? driverAvatar;

  AllOrders(
      {this.id,
      this.driverID,
      this.userId,
      this.dateOfOrder,
      this.distination,
      this.location,
      this.paymentDone,
      this.totalDistance,
      this.price,
      this.accepted,
      this.canceled,
      this.viecleId,
      this.trailerId,
      this.currentLocation,
      this.orderType,
      this.orderComplited,
      this.orderStartTime,
      this.orderEndTime,
      this.started,
      this.vehicleTypeId,
      this.trailerTypeId,
      this.driverName,
      this.userName,
      this.status,
      this.distinationLat,
      this.distinationLong,
      this.locationLat,
      this.locationLong,
      this.currentLocationLat,
      this.currentLocationLong,
      this.trailerName,
      this.trailerPic,
      this.trailerDesc,
      this.traillerTypeName,
      this.traillerTypePic,
      this.traillerTypeDesc,
      this.vehicleName,
      this.vehiclePic,
      this.vehicleDesc,
      this.vehicleTypeName,
      this.driverAvatar});

  AllOrders.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    driverID = json['Driver_ID'];
    userId = json['user_id'];
    dateOfOrder = json['Date_of_Order'];
    distination = json['Distination'];
    location = json['location'];
    paymentDone = json['payment_done'];
    totalDistance = json['total_distance'];
    price = json['price'];
    accepted = json['Accepted'];
    canceled = json['Canceled'];
    viecleId = json['viecle_Id'];
    trailerId = json['trailer_id'];
    currentLocation = json['Current_Location'];
    orderType = json['Order_Type'];
    orderComplited = json['Order_Complited'];
    orderStartTime = json['Order_Start_Time'];
    orderEndTime = json['Order_End_Time'];
    started = json['Started'];
    vehicleTypeId = json['vehicle_type_Id'];
    trailerTypeId = json['trailer_type_id'];
    driverName = json['Driver Name'];
    userName = json['User Name'];
    status = json['status'];
    distinationLat = json['Distination_lat'];
    distinationLong = json['Distination_long'];
    locationLat = json['location_lat'];
    locationLong = json['location_long'];
    currentLocationLat = json['Current_Location.lat'];
    currentLocationLong = json['Current_Location_long'];
    trailerName = json['trailer_name'];
    trailerPic = json['trailer_pic'];
    trailerDesc = json['trailer_desc'];
    traillerTypeName = json['trailler_type_name'];
    traillerTypePic = json['trailler_type_pic'];
    traillerTypeDesc = json['trailler_type_desc'];
    vehicleName = json['vehicle_name'];
    vehiclePic = json['vehicle_pic'];
    vehicleDesc = json['vehicle_desc'];
    vehicleTypeName = json['vehicle_type_name'];
    driverAvatar = json['Driver Avatar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['Driver_ID'] = driverID;
    data['user_id'] = userId;
    data['Date_of_Order'] = dateOfOrder;
    data['Distination'] = distination;
    data['location'] = location;
    data['payment_done'] = paymentDone;
    data['total_distance'] = totalDistance;
    data['price'] = price;
    data['Accepted'] = accepted;
    data['Canceled'] = canceled;
    data['viecle_Id'] = viecleId;
    data['trailer_id'] = trailerId;
    data['Current_Location'] = currentLocation;
    data['Order_Type'] = orderType;
    data['Order_Complited'] = orderComplited;
    data['Order_Start_Time'] = orderStartTime;
    data['Order_End_Time'] = orderEndTime;
    data['Started'] = started;
    data['vehicle_type_Id'] = vehicleTypeId;
    data['trailer_type_id'] = trailerTypeId;
    data['Driver Name'] = driverName;
    data['User Name'] = userName;
    data['status'] = status;
    data['Distination_lat'] = distinationLat;
    data['Distination_long'] = distinationLong;
    data['location_lat'] = locationLat;
    data['location_long'] = locationLong;
    data['Current_Location.lat'] = currentLocationLat;
    data['Current_Location_long'] = currentLocationLong;
    data['trailer_name'] = trailerName;
    data['trailer_pic'] = trailerPic;
    data['trailer_desc'] = trailerDesc;
    data['trailler_type_name'] = traillerTypeName;
    data['trailler_type_pic'] = traillerTypePic;
    data['trailler_type_desc'] = traillerTypeDesc;
    data['vehicle_name'] = vehicleName;
    data['vehicle_pic'] = vehiclePic;
    data['vehicle_desc'] = vehicleDesc;
    data['vehicle_type_name'] = vehicleTypeName;
    data['Driver Avatar'] = driverAvatar;
    return data;
  }
}

class OrderDitModel {
  dynamic id;
  dynamic driverID;
  dynamic userId;
  dynamic dateOfOrder;
  dynamic distination;
  dynamic location;
  dynamic paymentDone;
  dynamic totalDistance;
  dynamic price;
  dynamic accepted;
  dynamic canceled;
  dynamic viecleId;
  dynamic trailerId;
  dynamic currentLocation;
  dynamic orderType;
  dynamic orderComplited;
  dynamic orderStartTime;
  dynamic orderEndTime;
  dynamic started;
  dynamic driverName;
  dynamic distinationLat;
  dynamic distinationLong;
  dynamic locationLat;
  dynamic locationLong;
  dynamic currentLocationLat;
  dynamic currentLocationLong;
  dynamic vehicleTypeId;
  dynamic trailerTypeId;

  OrderDitModel(
      {this.id,
      this.driverID,
      this.userId,
      this.dateOfOrder,
      this.distination,
      this.location,
      this.paymentDone,
      this.totalDistance,
      this.price,
      this.accepted,
      this.canceled,
      this.viecleId,
      this.trailerId,
      this.currentLocation,
      this.orderType,
      this.orderComplited,
      this.orderStartTime,
      this.orderEndTime,
      this.started,
      this.vehicleTypeId,
      this.trailerTypeId,
      this.driverName,
      this.distinationLat,
      this.distinationLong,
      this.locationLat,
      this.locationLong,
      this.currentLocationLat,
      this.currentLocationLong});

  OrderDitModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    driverID = json['Driver_ID'];
    userId = json['user_id'];
    dateOfOrder = json['Date_of_Order'];
    distination = json['Distination'];
    location = json['location'];
    paymentDone = json['payment_done'];
    totalDistance = json['total_distance'];
    price = json['price'];
    accepted = json['Accepted'];
    canceled = json['Canceled'];
    viecleId = json['viecle_Id'];
    trailerId = json['trailer_id'];
    currentLocation = json['Current_Location'];
    orderType = json['Order_Type'];
    orderComplited = json['Order_Complited'];
    orderStartTime = json['Order_Start_Time'];
    orderEndTime = json['Order_End_Time'];
    started = json['Started'];
    vehicleTypeId = json['vehicle_type_Id'];
    trailerTypeId = json['trailer_type_id'];
    driverName = json['Driver Name'];
    distinationLat = json['Distination_lat'];
    distinationLong = json['Distination_long'];
    locationLat = json['location_lat'];
    locationLong = json['location_long'];
    currentLocationLat = json['Current_Location.lat'];
    currentLocationLong = json['Current_Location_long'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['Driver_ID'] = this.driverID;
    data['user_id'] = this.userId;
    data['Date_of_Order'] = this.dateOfOrder;
    data['Distination'] = this.distination;
    data['location'] = this.location;
    data['payment_done'] = this.paymentDone;
    data['total_distance'] = this.totalDistance;
    data['price'] = this.price;
    data['Accepted'] = this.accepted;
    data['Canceled'] = this.canceled;
    data['viecle_Id'] = this.viecleId;
    data['trailer_id'] = this.trailerId;
    data['Current_Location'] = this.currentLocation;
    data['Order_Type'] = this.orderType;
    data['Order_Complited'] = this.orderComplited;
    data['Order_Start_Time'] = this.orderStartTime;
    data['Order_End_Time'] = this.orderEndTime;
    data['Started'] = this.started;
    data['vehicle_type_Id'] = this.vehicleTypeId;
    data['trailer_type_id'] = this.trailerTypeId;
    data['Driver Name'] = this.driverName;
    data['Distination_lat'] = this.distinationLat;
    data['Distination_long'] = this.distinationLong;
    data['location_lat'] = this.locationLat;
    data['location_long'] = this.locationLong;
    data['Current_Location.lat'] = this.currentLocationLat;
    data['Current_Location_long'] = this.currentLocationLong;
    return data;
  }
}
