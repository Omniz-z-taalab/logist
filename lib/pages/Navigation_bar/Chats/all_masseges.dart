import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logist/models/chat/inbox_model.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../../core/logic/layout/profile/profile_provider.dart';
import '../../../core/logic/messages/chat_provider.dart';
import '../../../models/user_model.dart';
import '../../../others/variables.dart';
import '../../Order_Setup/messages.dart';


class conversationsList extends StatefulWidget {
  int? id;
   conversationsList(this.id) ;

  @override
  State<conversationsList> createState() => _conversationsListState();
}

class _conversationsListState extends State<conversationsList> {
  final ApanelController = PanelController();

  void Open() {
    ApanelController.isPanelClosed ? ApanelController.open() : null;
  }
var  usermodel;
  @override
  void initState() {
    super.initState();
    print(widget.id);
    context.read<ChatProvider>().getInbox(userId: widget.id);
    done();
  }

  void done() async {
    print(widget!.id);
    await Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        // isLoading = false;
      });
    });
  }

  Widget build(BuildContext context) {
    var response = context.watch<ChatProvider>().inboxMessage ;
    print(response![0].name);
    return Scaffold(
        backgroundColor: Color(0xffFAFBFB),
        appBar: AppBar(
          backgroundColor: Color(0xffFAFBFB),
          centerTitle: true,
          elevation: 0,
          title: Text(
            'الرسائل',
            style: TextStyle(
              fontSize: 16,
              fontFamily: 'Shamel',
              color: ATcolor,
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
        body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Center(
            child: Column(
              children: [
                Expanded(
                    flex: 4,
                    child: SizedBox(
                      height: 300,
                      child: context.watch<ChatProvider>().inboxMessage == 0
                          ? const Center(child: Text('لا توجد رسائل',style: TextStyle(color: Colors.black),))
                          : context.watch<ChatProvider>().isGetInbox ==true
                          ? _buildShimmerListView()
                          :ListView.builder(
                        itemBuilder: (context,index) =>_buildListView(response![index]),
                        itemCount: response!.length),
                    )),
              ],
            ),
          ),
        ));
  }
  //Profile picture

  Widget _buildListView(ChatListResponse response) {
    return Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: ListTile(
            tileColor: Colors.white,
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            leading: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                response!.unseenNumber == 0 ? Container(
                  height: 12,
                  width: 12,
                  decoration:const  BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                )
                    : Container(
                  height: 18,
                  width: 18,
                  decoration:const  BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red,
                  ),
                  child:  Center(child: Text('${response!.unseenNumber!}',style: TextStyle(color: Colors.white),)),
                ),
              ],
            ),
            // : null,
            title: Text(
              response!.name!,
              style: const TextStyle(fontSize: 14, fontFamily: 'ArabotoFat'),
              textDirection: TextDirection.rtl,
            ),
            subtitle: Text(
              response!.lastMessage!,
              style: const TextStyle(
                  fontSize: 10,
                  fontFamily: 'Araboto',
                  color: Color(0xff909090)),
              textDirection: TextDirection.rtl,
            ),
            trailing: CircleAvatar(
              backgroundImage: NetworkImage(response!.profileImage!),
            ),
            onTap: () {

              Get.to(
                      () => conversation(
                    inbox: response,
                  ),
                  transition: Transition.rightToLeft);
              //ApanelController.isPanelOpen ? ApanelController.close() : ApanelController.open();
            },
          ),
        );

  }

  ListView _buildShimmerListView() {
    Random random = new Random();
    int randomwidth1 = 59 + random.nextInt(50);
    int randomwidth2 = 59 + random.nextInt(50);

    print(randomwidth1);
    print(randomwidth2);

    return ListView.builder(
      shrinkWrap: true,
      itemCount: 4,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: ListTile(
              tileColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 10,
                    width: 92,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color(0xffcecece),
                    ),
                  ),
                ],
              ),
              subtitle: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 9,
                    width: randomwidth1 + 0.00,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color(0xffcecece),
                    ),
                  ),
                  Container(
                    height: 9,
                    width: 10,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  Container(
                    height: 9,
                    width: randomwidth2 + 0.00,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color(0xffcecece),
                    ),
                  ),
                ],
              ),
              trailing: Container(
                height: 35,
                width: 35,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Color(0xffcecece),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
