import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import '../../../models/chat/content_message.dart';

import '../../../models/chat/inbox_model.dart';
import '../../../models/chat/message.dart';
import '../../utilities/api_path.dart';
import '../../utilities/dio_helper.dart';

class ChatProvider extends ChangeNotifier {
  bool isGetInbox = false;
  bool isGetConversation = false;
  bool isSentMessage = false;
  bool isReadMessage = false;
  List<ChatListResponse>? inboxMessage = [];

  Future<void> getInbox({int? userId}) async {
    isGetInbox = true;
    notifyListeners();
    inboxMessage = [];
    try {
      var response = await DioHelper.getData(
        url: '${AppApiPaths.base}/api/v1/messenger/inbox?user_id=2');

       response.data.forEach((user) => inboxMessage!.add(ChatListResponse.fromJson(user)));
       print(inboxMessage![0].unseenNumber);
       print(inboxMessage!.length);
       print('wwwwwwwwwww');
      isGetInbox = false;
      notifyListeners();
    } catch (error) {
      print(error);
      isGetInbox = false;
    }
  }

  List<Message>? messages =[];

  Future<void> getMesages({int? senderId, recieveId}) async {
    isGetConversation = true;
    // notifyListeners();
    messages = [];
    try {
      var response = await DioHelper.getData(
        url: '${AppApiPaths
            .base}/api/v1/messenger/Conversation?SenderId=80&receiverId=1',
      );
      print(response.data);
     response.data.forEach((user) => messages!.add(Message.fromJson(user)));

      // messages = (response.data).map((e) => Message.fromJson(e)).toList();
       isGetConversation = false;
      notifyListeners();
    } catch (error) {
      print(error);
      isGetConversation = false;
    }
  }
  SendMassegeModel? sendMassegeModel;
  Future<void> sentMesages({ContentMessage? contentMessage}) async {
      messages = [];
    isSentMessage = true;
    notifyListeners();
    print('11111111111');
    print(contentMessage!.contentText);

    try {
      var response = await DioHelper.postData(
          url: '${AppApiPaths.base}/api/v1/messenger/Send_message',
          data: {
            "contentText": contentMessage!.contentText,
            "SenderId": contentMessage!.senderId,
            "receiverId": contentMessage!.receiverId
          },);

          print('222222222222');
          print(response.data);
    sendMassegeModel =  SendMassegeModel.fromJson(response.data);
      print(sendMassegeModel!.contentText);
      print('332222222');
      isSentMessage = false;
      notifyListeners();
    } catch (error) {
      isGetConversation = false;
    }
  }

  Future<void> readMesages(
      String? hash) async {
    isSentMessage = true;
    notifyListeners();

    try {
      var response = await DioHelper.postData(
          url: '${AppApiPaths.base}/api/v1/messenger/Read_message',
          data: {"Hash_id": "80-2-2023-02-21 18:12:07"});
      print(response);

      isSentMessage = false;
      notifyListeners();
    } catch (error) {
      isGetConversation = false;
    }
  }
}