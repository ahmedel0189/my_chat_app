// ignore_for_file: unused_local_variable

import 'package:a_chat/constants/my_string.dart';
import 'package:a_chat/layers/data/model/massage_model.dart';
import 'package:a_chat/layers/ui/widgets/custom_appbar.dart';
import 'package:a_chat/layers/ui/widgets/widgets_of_home_page.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// ignore: must_be_immutable
class HomePageScreen extends StatelessWidget {
  final String email;
  final TextEditingController messageController =
      TextEditingController();
  final ScrollController scrollController =
      ScrollController();

  HomePageScreen({super.key, required this.email});
  final CollectionReference messagesCollection =
      FirebaseFirestore.instance.collection(
        'messages',
      );
  final messagesQuery = FirebaseFirestore.instance
      .collection('messages')
      .orderBy('createdAt', descending: false);
  void scrollToBottom() {
    // عشان يدي فرصة للـ ListView يبني الأول
    Future.delayed(
      const Duration(milliseconds: 300),
      () {
        if (scrollController.hasClients) {
          scrollController.animateTo(
            scrollController
                .position
                .maxScrollExtent,
            duration: const Duration(
              milliseconds: 300,
            ),
            curve: Curves.easeOut,
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: messagesQuery.snapshots(),
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
          WidgetsBinding.instance
              .addPostFrameCallback(
                (_) => scrollToBottom(),
              );
          return Scaffold(
            appBar: CustomAppbar(
              appBarTitle: appName,
            ),
            body: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    controller: scrollController,
                    itemCount: massageList.length,
                    itemBuilder: (context, index) {
                      return WidgetsOfHomePage()
                          .buildBubbleMassage(
                            message:
                                massageList[index],
                            isMe: massageList[index].id == email,
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
                          'id':email
                      });
                      messageController.clear();
                      scrollToBottom();
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
