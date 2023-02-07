import 'package:flutter/material.dart';
import '../models/chat/message.dart';

import 'app_message.dart';

class RecieveMessage extends StatelessWidget {
  final Message? message;

  const RecieveMessage({Key? key, this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: <Widget>[
            message!.contentText != null
                // Text
                ? AppMessage(
                    message: message!.contentText!,
                  )
                :
                // message!.contentImage!=null
                //     // Image
                //     ?
                Container(
                    child: OutlinedButton(
                      child: Material(
                        child: Image.network(
                          message!.contentImage!,
                          loadingBuilder: (BuildContext context, Widget child,
                              ImageChunkEvent? loadingProgress) {
                            if (loadingProgress == null) return child;
                            return Container(
                              decoration: const BoxDecoration(
                                color: Colors.white10,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8),
                                ),
                              ),
                              width: 200,
                              height: 200,
                              child: Center(
                                child: CircularProgressIndicator(
                                  color: Colors.white10,
                                  value: loadingProgress.expectedTotalBytes !=
                                          null
                                      ? loadingProgress.cumulativeBytesLoaded /
                                          loadingProgress.expectedTotalBytes!
                                      : null,
                                ),
                              ),
                            );
                          },
                          errorBuilder: (context, object, stackTrace) {
                            return Material(
                              child: Image.asset(
                                'images/img_not_available.jpeg',
                                width: 200,
                                height: 200,
                                fit: BoxFit.cover,
                              ),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(8),
                              ),
                              clipBehavior: Clip.hardEdge,
                            );
                          },
                          width: 200,
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        clipBehavior: Clip.hardEdge,
                      ),
                      onPressed: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => FullPhotoPage(
                        //       url: messageChat.content,
                        //     ),
                        //   ),
                        // );
                      },
                      style: ButtonStyle(
                          padding: MaterialStateProperty.all<EdgeInsets>(
                              const EdgeInsets.all(0))),
                    ),
                    margin: const EdgeInsets.only(bottom: 20, right: 10),
                  )
            // // Sticker
            // : Container(
            //     child: Image.asset(
            //       'images/${messageChat.content}.gif',
            //       width: 100,
            //       height: 100,
            //       fit: BoxFit.cover,
            //     ),
            //     margin: EdgeInsets.only(bottom: isLastMessageRight(index) ? 20 : 10, right: 10),
            //   ),
          ],
          // crossAxisAlignment: CrossAxisAlignment.start,
        ),
        // Container(
        //   child: Text(
        //     message!.readTime ?? "",
        //     style: const TextStyle(
        //         color: Colors.grey, fontSize: 10, fontStyle: FontStyle.italic),
        //   ),
        //   margin: const EdgeInsets.only(left: 50, bottom: 5),
        // )
      ],
      crossAxisAlignment: CrossAxisAlignment.start,
    );
  }
}
