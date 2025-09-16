// ignore_for_file: unused_local_variable

import 'package:a_chat/constants/my_string.dart';
import 'package:a_chat/layers/data/model/massage_model.dart';
import 'package:a_chat/layers/ui/widgets/custom_appbar.dart';
import 'package:a_chat/layers/ui/widgets/widgets_of_home_page.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// ignore: must_be_immutable
class HomePageScreen extends StatelessWidget {
  final TextEditingController messageController =
      TextEditingController();

  HomePageScreen({super.key});
    final CollectionReference messagesCollection =
      FirebaseFirestore.instance.collection('messages');
final messagesQuery  = FirebaseFirestore.instance
    .collection('messages')
    .orderBy('createdAt',descending: false);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: messagesQuery .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<MassageModel> massageList = [];
          for (
            int i = 0;
            i < snapshot.data!.docs.length;
            i++
          ) {
            massageList.add(
              MassageModel.fromjson(
                snapshot.data!.docs[i],
              ),
            );
          }
          return Scaffold(
            appBar: CustomAppbar(
              appBarTitle: appName,
            ),
            body: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: massageList.length,
                    itemBuilder: (context, index) {
                      return WidgetsOfHomePage()
                          .buildBubbleMassage(
                            message:
                                massageList[index],
                            isMe: true,
                          );
                    },
                  ),
                ),
                WidgetsOfHomePage().buildMassageTextField(
                  controller: messageController,
                  onPressed: () async {
                    if (messageController
                        .text
                        .isNotEmpty) {
                      await messagesCollection.add({
                        'message':
                            messageController
                                .text,
                        'createdAt':
                            FieldValue.serverTimestamp(),
                      });
                      messageController
                          .clear(); // يمسح التكست بعد الإرسال
                    }
                  },
                ),
              ],
            ),
          );
        } else {
          return Center(
            child: Text('Loading...'),
          );
        }
      },
    );
  }
}
