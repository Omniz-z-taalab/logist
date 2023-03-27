class Viecle {
  int? id;
  String? sName;
  String? sDesc;
  String? sPic;

  Viecle({this.id, this.sName, this.sDesc, this.sPic});

  Viecle.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sName = json['_name'];
    sDesc = json['_desc'];
    sPic = json['_pic'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['_name'] = this.sName;
    data['_desc'] = this.sDesc;
    data['_pic'] = this.sPic;
    return data;
  }
}

class ViecleTypes {
  int? id;
  String? sName;

  ViecleTypes({this.id, this.sName});

  ViecleTypes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sName = json['vehicle_type_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['vehicle_type_name'] = sName;

    return data;
  }
}
