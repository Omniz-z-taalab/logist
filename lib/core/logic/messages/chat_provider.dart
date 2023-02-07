import 'package:flutter/foundation.dart';
import '../../../models/chat/content_message.dart';

import '../../../models/chat/inbox_model.dart';
import '../../../models/chat/message.dart';
import '../../utilities/api_path.dart';
import '../../utilities/api_service.dart';

class ChatProvider extends ChangeNotifier {
  bool isGetInbox = false;
  bool isGetConversation = false;
  bool isSentMessage = false;
  bool isReadMessage = false;
  List<Inbox> inboxMessage = [];
  Future<void> getInbox({int? userId}) async {
    isGetInbox = true;
    // notifyListeners();

    try {
      var response = await DioManager().get(
        '${AppApiPaths.base}/api/v1/messenger/inbox?user_id=2',
      );
      print(response);
      inboxMessage =
          (response as List<dynamic>).map((e) => Inbox.fromJson(e)).toList();

      isGetInbox = false;
      notifyListeners();
    } catch (error) {
      isGetInbox = false;
    }
  }

  List<Message> messages = [];
  Future<void> getMesages({int? senderId, recieveId}) async {
    isGetConversation = true;
    // notifyListeners();

    try {
      var response = await DioManager().get(
        '${AppApiPaths.base}/api/v1/messenger/Conversation?SenderId=1&receiverId=2',
      );

      messages =
          (response as List<dynamic>).map((e) => Message.fromJson(e)).toList();

      isGetConversation = false;
      notifyListeners();
    } catch (error) {
      isGetConversation = false;
    }
  }

  Future<void> sentMesages({ContentMessage? contentMessage}) async {
    isSentMessage = true;
    notifyListeners();

    try {
      var response = await DioManager().post(
          '${AppApiPaths.base}/api/v1/messenger/Send_message',
          data: contentMessage!.toJson());
      print(response);
      getMesages(
          senderId: contentMessage.senderId,
          recieveId: contentMessage.receiverId);
      getInbox(userId: 2);

      isSentMessage = false;
      notifyListeners();
    } catch (error) {
      isGetConversation = false;
    }
  }

  Future<void> readMesages(
      {int? senderId, recieveId, ContentMessage? contentMessage}) async {
    isSentMessage = true;
    notifyListeners();

    try {
      var response = await DioManager().post(
          '${AppApiPaths.base}/api/v1/messenger/Read_message',
          data: {"Hash_id": "1-2-2023-01-15 00:18:40"});
      print(response);

      isSentMessage = false;
      notifyListeners();
    } catch (error) {
      isGetConversation = false;
    }
  }
}
