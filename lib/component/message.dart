import 'package:flutter/material.dart';

import '../const.dart';
import '../models/messagemodel.dart';

class message extends StatelessWidget {
  const message({super.key, required this.messagee});
  final Message messagee;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.only(left: 16, top: 30, bottom: 30, right: 25),
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32),
              topRight: Radius.circular(32),
              bottomRight: Radius.circular(32)),
          color: kPrimaryColor,
        ),
        child: Text(
          messagee.message,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
class messagefrind extends StatelessWidget {
  const messagefrind({super.key, required this.messagee});
  final Message messagee;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: EdgeInsets.only(left: 16, top: 30, bottom: 30, right: 25),
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32),
              topRight: Radius.circular(32),
              bottomLeft: Radius.circular(32)),
          color: Color.fromARGB(255, 33, 119, 218),
        ),
        child: Text(
          messagee.message,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
