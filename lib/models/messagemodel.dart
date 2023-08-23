import 'package:fristproject/const.dart';

class Message{
final String message;
final String id;
  Message(this.message, this.id);
factory Message.fromjson(jsondata){
return Message( jsondata[knum],jsondata[kid]);
}

}