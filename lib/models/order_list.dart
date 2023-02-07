class Orders {
  int? id;
  int? driverID;
  int? userId;
  String? dateOfOrder;
  int? distination;
  int? location;
  int? accepted;
  int? canceled;
  int? viecleId;
  int? trailerId;
  int? currentLocation;
  String? orderType;
  int? orderComplited;
  String? orderStartTime;
  String? driverName;
  double? distinationLat;
  double? distinationLong;
  double? locationLat;
  double? locationLong;
  double? currentLocationLat;
  double? currentLocationLong;

  Orders(
      {this.id,
      this.driverID,
      this.userId,
      this.dateOfOrder,
      this.distination,
      this.location,
      this.accepted,
      this.canceled,
      this.viecleId,
      this.trailerId,
      this.currentLocation,
      this.orderType,
      this.orderComplited,
      this.orderStartTime,
      this.driverName,
      this.distinationLat,
      this.distinationLong,
      this.locationLat,
      this.locationLong,
      this.currentLocationLat,
      this.currentLocationLong});

  Orders.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    driverID = json['Driver_ID'];
    userId = json['user_id'];
    dateOfOrder = json['Date_of_Order'];
    distination = json['Distination'];
    location = json['location'];
    accepted = json['Accepted'];
    canceled = json['Canceled'];
    viecleId = json['viecle_Id'];
    trailerId = json['trailer_id'];
    currentLocation = json['Current_Location'];
    orderType = json['Order_Type'];
    orderComplited = json['Order_Complited'];
    orderStartTime = json['Order_Start_Time'];
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
    data['Accepted'] = this.accepted;
    data['Canceled'] = this.canceled;
    data['viecle_Id'] = this.viecleId;
    data['trailer_id'] = this.trailerId;
    data['Current_Location'] = this.currentLocation;
    data['Order_Type'] = this.orderType;
    data['Order_Complited'] = this.orderComplited;
    data['Order_Start_Time'] = this.orderStartTime;
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
