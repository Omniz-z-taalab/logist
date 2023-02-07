import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../core/logic/layout/profile/profile_provider.dart';
import '../../models/chat/content_message.dart';
import '../../others/variables.dart';
import '../../widgets/recieve_message.dart';
import '../../widgets/send_message.dart';
import 'package:provider/provider.dart';

import '../../core/logic/messages/chat_provider.dart';
import '../../models/chat/inbox_model.dart';
import '../../models/chat/message.dart';

class conversation extends StatefulWidget {
  const conversation({Key? key, required this.inbox}) : super(key: key);
  final Inbox? inbox;

  @override
  State<conversation> createState() => _conversationState();
}

class _conversationState extends State<conversation> {
  final TextEditingController textEditingController = TextEditingController();
  final ScrollController listScrollController = ScrollController();
  final FocusNode focusNode = FocusNode();
  int _limit = 30;
  int _limitIncrement = 80;
  File? imageFile;
  bool isLoading = false;
  bool isShowSticker = false;
  String imageUrl = "";

  @override
  void initState() {
    context.read<ChatProvider>().getMesages(
        senderId: widget.inbox!.senderId, recieveId: widget.inbox!.receiverId);
    listScrollController.addListener(_scrollListener);
    super.initState();
  }

  _scrollListener() {
    if (!listScrollController.hasClients) return;
    if (listScrollController.offset >=
            listScrollController.position.maxScrollExtent &&
        !listScrollController.position.outOfRange) {
      setState(() {
        _limit += _limitIncrement;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Message> messages =
        context.watch<ChatProvider>().messages.reversed.toList();
    return Scaffold(
        backgroundColor: Obackground,
        appBar: AppBar(
          toolbarHeight: 100,
          backgroundColor: Obackground,
          elevation: 0,
          centerTitle: true,
          title: Container(
            // width: 220,
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  // crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      widget.inbox!.name!,
                      style: const TextStyle(
                          fontSize: 12,
                          fontFamily: 'Montserrat',
                          color: Color(0xff191F28)),
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      'سائق شاحنة كبيرة الحجم',
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        fontSize: 10,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w300,
                        color: Color(0xff909090),
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 10),
                CircleAvatar(
                  radius: 22,
                  backgroundImage: NetworkImage(widget.inbox!.profileImage!),
                ),
              ],
            ),
          ),
          leadingWidth: 80,
          leading: Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Image.asset(
              'assets/pics/Call.png',
              height: 60,
              width: 60,
            ),
          ),
          actions: [
            SizedBox(
              height: 52,
              width: 52,
              child: Container(
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.white),
                child: IconButton(
                  color: const Color(0xff323232),
                  icon: const Icon(CupertinoIcons.chevron_forward),
                  iconSize: 25,
                  onPressed: () {
                    Get.back();
                  },
                ),
              ),
            ),
            const SizedBox(width: 20),
          ],
        ),
        body: SafeArea(
          child: Column(
            children: [
              //
              Flexible(
                child: ListView.builder(
                  padding: const EdgeInsets.all(10),
                  itemBuilder: (context, index) {
                    if (messages[index].senderId == widget.inbox!.senderId) {
                      return SendMessageWidget(
                        message: messages[index],
                      );
                    }
                    return RecieveMessage(
                      message: messages[index],
                    );
                  },
                  itemCount: messages.length,
                  reverse: true,
                  // controller: listScrollController,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: (() async {
                        await getImage();
                      }),
                      child: Container(
                        width: 55,
                        height: 55,
                        decoration: BoxDecoration(
                            color: Color(0xffF8FAFC),
                            borderRadius: BorderRadius.circular(100)),
                        child: Image.asset('assets/pics/attachment.png',
                            width: 18),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: TextField(
                        controller: textEditingController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(46.0),
                          ),
                          filled: true,
                          hintTextDirection: TextDirection.rtl,
                          hintStyle: const TextStyle(
                            fontSize: 12,
                            fontFamily: 'Araboto',
                            color: Color(0xffB4B4B4),
                          ),
                          hintText: "أكتب رسالة نصية",
                          fillColor: Color(0xffF8FAFC),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: (() {
                        if (textEditingController.text.isNotEmpty) {
                          context
                              .read<ChatProvider>()
                              .sentMesages(
                                  // senderId: widget.inbox!.senderId!,
                                  // recieveId: widget.inbox!.receiverId,
                                  contentMessage: ContentMessage(
                                      senderId: widget.inbox!.senderId!,
                                      receiverId: widget.inbox!.receiverId,
                                      contentText: textEditingController.text))
                              .then((value) {
                            textEditingController.clear();
                          });
                        }
                      }),
                      child: Container(
                        width: 55,
                        height: 55,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(100)),
                        child: SizedBox(
                            // width: 9,
                            // height: 9,
                            child: Image.asset(
                          'assets/pics/ChatArrow.png',
                          scale: 2,
                        )),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  Future getImage() async {
    ImagePicker imagePicker = ImagePicker();
    PickedFile? pickedFile;

    pickedFile = await imagePicker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      imageFile = File(pickedFile.path);
      if (imageFile != null) {
        setState(() {
          isLoading = true;
        });
        uploadFile();
      }
    }
  }

  void uploadFile() {
    context.read<ProfileProvider>().uploadDocs(file: imageFile).then((value) {
      context.read<ChatProvider>().sentMesages(
          // senderId: widget.inbox!.senderId!,
          // recieveId: widget.inbox!.receiverId,
          contentMessage: ContentMessage(
              senderId: widget.inbox!.senderId!,
              receiverId: widget.inbox!.receiverId,
              contentImage: value));
    });
  }
}
//   void getSticker() {
//     // Hide keyboard when sticker appear
//     focusNode.unfocus();
//     setState(() {
//       isShowSticker = !isShowSticker;
//     });
//   }

//   Future uploadFile() async {
//     String fileName = DateTime.now().millisecondsSinceEpoch.toString();
//     UploadTask uploadTask = chatProvider.uploadFile(imageFile!, fileName);
//     try {
//       TaskSnapshot snapshot = await uploadTask;
//       imageUrl = await snapshot.ref.getDownloadURL();
//       setState(() {
//         isLoading = false;
//         onSendMessage(imageUrl, TypeMessage.image);
//       });
//     } on FirebaseException catch (e) {
//       setState(() {
//         isLoading = false;
//       });
//       Fluttertoast.showToast(msg: e.message ?? e.toString());
//     }
//   }

//   void onSendMessage(String content, int type) {
//     if (content.trim().isNotEmpty) {
//       textEditingController.clear();
//       chatProvider.sendMessage(content, type, groupChatId, currentUserId, widget.arguments.peerId);
//       if (listScrollController.hasClients) {
//         listScrollController.animateTo(0, duration: Duration(milliseconds: 300), curve: Curves.easeOut);
//       }
//     } else {
//       Fluttertoast.showToast(msg: 'Nothing to send', backgroundColor: ColorConstants.greyColor);
//     }
//   }
