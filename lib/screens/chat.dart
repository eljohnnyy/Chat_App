import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fristproject/chat_cubit/cubit/chat_cubit.dart';
import 'package:fristproject/component/message.dart';
import 'package:fristproject/component/text_filed.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fristproject/models/messagemodel.dart';
import '../const.dart';

class chatpage extends StatelessWidget {
  chatpage({super.key});
  static String id = 'chatpage';
  final _controller = ScrollController();
  List<Message> send = [];

  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    String email = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: kPrimaryColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              klogo,
              height: 50,
            ),
            Text('Chat'),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<ChatCubit, ChatState>(
              
              builder: (context, state) {
                  List<Message> send = BlocProvider.of<ChatCubit>(context).sendd;
                return ListView.builder(
                    reverse: true,
                    controller: _controller,
                    itemCount: send.length,
                    itemBuilder: (context, index) {
                      return send[index].id == email
                          ? message(messagee: send[index])
                          : messagefrind(messagee: send[index]);
                    });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: controller,
              onSubmitted: (value) {
                BlocProvider.of<ChatCubit>(context).send(email: email, message: value);
                controller.clear();
                _controller.animateTo(
                  0,
                  curve: Curves.fastOutSlowIn,
                  duration: const Duration(microseconds: 500),
                );
              },
              decoration: InputDecoration(
                  hintText: 'Send Message',
                  suffixIcon: Icon(
                    Icons.send,
                    color: kPrimaryColor,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(color: kPrimaryColor),
                  )),
            ),
          )
        ],
      ),
    );
  }
}
