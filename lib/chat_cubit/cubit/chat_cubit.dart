import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fristproject/models/messagemodel.dart';
import 'package:meta/meta.dart';

import '../../const.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());
      List<Message>sendd=[];
    CollectionReference messages =
      FirebaseFirestore.instance.collection(kmessage);
      void send({required String email,required String message}){
          messages.add({'message':message,
               'create':DateTime.now(),
               'id':email,
               
               });
      }
      void getmessages(){
        messages.orderBy('create',descending: true).snapshots().listen((event) {
      sendd.clear();
          for( var doc in event.docs){
            sendd.add(Message.fromjson(doc));
          }
          emit(ChatSuccess(send: sendd));
        });
      }
}
