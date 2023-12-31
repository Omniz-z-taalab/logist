class Message {
  int? id;
  String? sendTime;
  String? readTime;
  String? contentImage;
  String? contentText;
  String? contentAudio;
  int? senderId;
  String? deleteId;
  String? hashId;
  int? callsDuration;

  Message(
      {this.id,
      this.sendTime,
      this.readTime,
      this.contentImage,
      this.contentText,
      this.contentAudio,
      this.senderId,
      this.deleteId,
      this.hashId,
      this.callsDuration});

  Message.fromJson(Map<String, dynamic> json) {
    print('rrrrrrrrrrrrr');
    id = json['id'];
    sendTime = json['sendTime'];
    readTime = json['readTime'];
    contentImage = json['contentImage'];
    contentText = json['contentText'];
    contentAudio = json['contentAudio'];
    senderId = json['SenderId'];
    deleteId = json['Delete_id'];
    hashId = json['Hash_id'];
    callsDuration = json['CallsDuration'];
    print('rrrrrrrrrrrrrrrrrr');
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['sendTime'] = this.sendTime;
    data['readTime'] = this.readTime;
    data['contentImage'] = this.contentImage;
    data['contentText'] = this.contentText;
    data['contentAudio'] = this.contentAudio;
    data['SenderId'] = this.senderId;
    data['Delete_id'] = this.deleteId;
    data['Hash_id'] = this.hashId;
    data['CallsDuration'] = this.callsDuration;
    return data;
  }
}
class SendMassegeModel {
  bool? success;
  String? contentText;
  int? senderId;
  int? receiverId;

  SendMassegeModel(
      {this.success, this.contentText, this.senderId, this.receiverId});

  SendMassegeModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    contentText = json['contentText'];
    senderId = json['SenderId'];
    receiverId = json['receiverId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['contentText'] = this.contentText;
    data['SenderId'] = this.senderId;
    data['receiverId'] = this.receiverId;
    return data;
  }
}