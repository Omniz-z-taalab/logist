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
