class OrderModel {
  int? driverID;
  String? dateOfOrder;
  Distination? distination;
  Distination? location;
  int? viecleId;
  int? trailerId;
  Distination? currentLocation;
  String? orderType;
  String? orderStartTime;

  OrderModel(
      {this.driverID,
      this.dateOfOrder,
      this.distination,
      this.location,
      this.viecleId,
      this.trailerId,
      this.currentLocation,
      this.orderType,
      this.orderStartTime});

  OrderModel.fromJson(Map<String, dynamic> json) {
    driverID = json['Driver_ID'];
    dateOfOrder = json['Date_of_Order'];
    distination = json['Distination'] != null
        ?  Distination.fromJson(json['Distination'])
        : null;
    location = json['location'] != null
        ?  Distination.fromJson(json['location'])
        : null;
    viecleId = json['viecle_Id'];
    trailerId = json['trailer_id'];
    currentLocation = json['Current_Location'] != null
        ?  Distination.fromJson(json['Current_Location'])
        : null;
    orderType = json['Order_Type'];
    orderStartTime = json['Order_Start_Time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Driver_ID'] = this.driverID;
    data['Date_of_Order'] = this.dateOfOrder;
    if (this.distination != null) {
      data['Distination'] = this.distination!.toJson();
    }
    if (this.location != null) {
      data['location'] = this.location!.toJson();
    }
    data['viecle_Id'] = this.viecleId;
    data['trailer_id'] = this.trailerId;
    if (this.currentLocation != null) {
      data['Current_Location'] = this.currentLocation!.toJson();
    }
    data['Order_Type'] = this.orderType;
    data['Order_Start_Time'] = this.orderStartTime;
    return data;
  }
}

class Distination {
  double? lant;
  double? long;

  Distination({this.lant, this.long});

  Distination.fromJson(Map<String, dynamic> json) {
    lant = json['lant'];
    long = json['long'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lant'] = this.lant;
    data['long'] = this.long;
    return data;
  }
}
