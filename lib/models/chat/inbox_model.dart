class ChatListResponse {
  int? receiverId;
  int? senderId;
  String? lastMessage;
  int? seen;
  int? unseenNumber;
  String? hash;
  String? name;
  String? profileImage;

  ChatListResponse(
      {this.receiverId,
        this.senderId,
        this.lastMessage,
        this.seen,
        this.unseenNumber,
        this.hash,
        this.name,
        this.profileImage});

  ChatListResponse.fromJson(Map<String, dynamic> json) {
    receiverId = json['receiverId'];
    senderId = json['SenderId'];
    lastMessage = json['lastMessage'];
    seen = json['seen'];
    unseenNumber = json['unseenNumber'];
    hash = json['Hash'];
    name = json['name'];
    profileImage = json['profileImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['receiverId'] = this.receiverId;
    data['SenderId'] = this.senderId;
    data['lastMessage'] = this.lastMessage;
    data['seen'] = this.seen;
    data['unseenNumber'] = this.unseenNumber;
    data['Hash'] = this.hash;
    data['name'] = this.name;
    data['profileImage'] = this.profileImage;
    return data;
  }
}