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
  String? userAvatar;
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
  String? viecleName;
  String? vieclePic;
  String? viecleDesc;
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
      this.started,
      this.orderStartTime,
      this.orderEndTime,
      this.driverName,
      this.userName,
      this.userAvatar,
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
      this.viecleName,
      this.vieclePic,
      this.viecleDesc});

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
    started = json['Started'];
    orderStartTime = json['Order_Start_Time'];
    orderEndTime = json['Order_End_Time'];
    driverName = json['Driver Name'];
    userName = json['User Name'];
    userAvatar = json['User Avatar'];
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
    viecleName = json['viecle_name'];
    vieclePic = json['viecle_pic'];
    viecleDesc = json['viecle_desc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
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
    data['Started'] = started;
    data['Order_Start_Time'] = orderStartTime;
    data['Order_End_Time'] = orderEndTime;
    data['Driver Name'] = driverName;
    data['User Name'] = userName;
    data['User Avatar'] = userAvatar;
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
    data['viecle_name'] = viecleName;
    data['viecle_pic'] = vieclePic;
    data['viecle_desc'] = viecleDesc;
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
    driverName = json['Driver Name'];
    distinationLat = json['Distination_lat'];
    distinationLong = json['Distination_long'];
    locationLat = json['location_lat'];
    locationLong = json['location_long'];
    currentLocationLat = json['Current_Location.lat'];
    currentLocationLong = json['Current_Location_long'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
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
    data['Driver Name'] = driverName;
    data['Distination_lat'] = distinationLat;
    data['Distination_long'] = distinationLong;
    data['location_lat'] = locationLat;
    data['location_long'] = locationLong;
    data['Current_Location.lat'] = currentLocationLat;
    data['Current_Location_long'] = currentLocationLong;
    return data;
  }
}
