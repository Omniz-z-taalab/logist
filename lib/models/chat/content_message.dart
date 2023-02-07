class ContentMessage {
  String? contentText;
  String? contentImage;
  String? contentAudio;
  int? senderId;
  int? receiverId;

  ContentMessage(
      {this.contentText,
      this.contentImage,
      this.contentAudio,
      this.senderId,
      this.receiverId});

  ContentMessage.fromJson(Map<String, dynamic> json) {
    contentText = json['contentText'];
    contentImage = json['contentImage'];
    contentAudio = json['contentAudio'];
    senderId = json['SenderId'];
    receiverId = json['receiverId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['contentText'] = this.contentText;
    data['contentImage'] = this.contentImage;
    data['contentAudio'] = this.contentAudio;
    data['SenderId'] = this.senderId;
    data['receiverId'] = this.receiverId;
    return data;
  }
}
