import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import '../../../models/chat/content_message.dart';

import '../../../models/chat/inbox_model.dart';
import '../../../models/chat/message.dart';
import '../../utilities/api_path.dart';
import '../../utilities/dio_helper.dart';

class ChatProvider extends ChangeNotifier {
  late bool isGetInbox ;
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
        url: '${AppApiPaths.base}/api/v1/messenger/inbox?user_id=$userId');
       response.data.forEach((user) => inboxMessage!.add(ChatListResponse.fromJson(user)));
       print(userId);
       print(inboxMessage);
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
    print(senderId);
    print(recieveId);
    print('[[[[[[[[[[[[[');
    try {
      var response = await DioHelper.getData(
        url: '${AppApiPaths
            .base}/api/v1/messenger/Conversation?SenderId=$senderId&receiverId=$recieveId',
      );
      print('3432423432432432432');
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
  Future<void> sentMesages({ContentMessage? contentMessage,}) async {
    isSentMessage = true;
    notifyListeners();
    print('11111111111');
    print(contentMessage!.contentText);
    print(contentMessage!.receiverId);
    print(contentMessage!.senderId);

    try {
      var response = await DioHelper.postData(
          url: '${AppApiPaths.base}/api/v1/messenger/Send_message',
          data: {
            "contentText": contentMessage!.contentText,
            "SenderId": contentMessage!.senderId,
            "receiverId": contentMessage!.receiverId
          },);
      print('==============');

      print(contentMessage!.receiverId);
            print('==============');
          print(response.data);
    sendMassegeModel =  SendMassegeModel.fromJson(response.data);
      print(sendMassegeModel!.contentText);
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
          data: {"Hash_id": hash});
      print(response);
      isSentMessage = false;
      notifyListeners();
    } catch (error) {
      isGetConversation = false;
    }
  }
}