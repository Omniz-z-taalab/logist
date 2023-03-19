class AllOrders {
  dynamic? id;
  dynamic? driverID;
  dynamic? userId;
  dynamic? dateOfOrder;
  dynamic? distination;
  dynamic? location;
  dynamic? paymentDone;
  dynamic? totalDistance;
  dynamic? price;
  dynamic? accepted;
  dynamic? canceled;
  dynamic? viecleId;
  dynamic? trailerId;
  dynamic? currentLocation;
  dynamic? orderType;
  dynamic? orderComplited;
  dynamic? orderStartTime;
  dynamic? orderEndTime;
  dynamic? driverName;
  dynamic? userName;
  dynamic? status;
  dynamic? distinationLat;
  dynamic? distinationLong;
  dynamic? locationLat;
  dynamic? locationLong;
  dynamic? currentLocationLat;
  dynamic? currentLocationLong;

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
        this.driverName,
        this.userName,
        this.status,
        this.distinationLat,
        this.distinationLong,
        this.locationLat,
        this.locationLong,
        this.currentLocationLat,
        this.currentLocationLong});

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
    driverName = json['Driver Name'];
    userName = json['User Name'];
    status = json['status'];
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
    data['Driver Name'] = this.driverName;
    data['User Name'] = this.userName;
    data['status'] = this.status;
    data['Distination_lat'] = this.distinationLat;
    data['Distination_long'] = this.distinationLong;
    data['location_lat'] = this.locationLat;
    data['location_long'] = this.locationLong;
    data['Current_Location.lat'] = this.currentLocationLat;
    data['Current_Location_long'] = this.currentLocationLong;
    return data;
  }
}


class OrderDitModel {
  dynamic? id;
  dynamic? driverID;
  dynamic? userId;
  dynamic? dateOfOrder;
  dynamic? distination;
  dynamic? location;
  dynamic? paymentDone;
  dynamic? totalDistance;
  dynamic? price;
  dynamic? accepted;
  dynamic? canceled;
  dynamic? viecleId;
  dynamic? trailerId;
  dynamic? currentLocation;
  dynamic? orderType;
  dynamic? orderComplited;
  dynamic? orderStartTime;
  dynamic? orderEndTime;
  dynamic? started;
  dynamic? driverName;
  dynamic? distinationLat;
  dynamic? distinationLong;
  dynamic? locationLat;
  dynamic? locationLong;
  dynamic? currentLocationLat;
  dynamic? currentLocationLong;

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