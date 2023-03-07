import 'package:flutter/material.dart';
import 'app_message.dart';
import 'full_photo.dart';

import '../models/chat/message.dart';

class SendMessageWidget extends StatelessWidget {
  SendMessageWidget({Key? key, this.message}) : super(key: key);
  final Message? message;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(children: <Widget>[
          message!.contentText != "null"
              // Text
              ? AppMessage(
                  message: message!.contentText!,
                )
              : Container(
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FullPhotoScreen(
                            imageUrl: message!.contentImage!,
                          ),
                        ),
                      );
                    },
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsets>(
                            const EdgeInsets.all(0))),
                  ),
                  margin: const EdgeInsets.only(bottom: 20, right: 10),
                )

        ], mainAxisAlignment: MainAxisAlignment.end),
        // Container(
        //   child: Text(
        //     message!.sendTime ?? "",
        //     style: const TextStyle(
        //         color: Colors.grey, fontSize: 10, fontStyle: FontStyle.italic),
        //   ),
        //   margin: const EdgeInsets.only(right: 40, bottom: 5),
        // )
      ],
      crossAxisAlignment: CrossAxisAlignment.end,
    );
  }
}
