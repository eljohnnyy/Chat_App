import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fristproject/const.dart';
import 'package:fristproject/helper/show_snackbar.dart';
import 'package:fristproject/register_cubit/cubit/register_cubit.dart';
import 'package:fristproject/screens/chat.dart';
import 'package:fristproject/screens/login.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../chat_cubit/cubit/chat_cubit.dart';
import '../component/buttom.dart';
import '../component/text_filed.dart';

class Register extends StatelessWidget {
  String? email;
  static String id = 'register';
  String? password;

  bool isloading = false;

  GlobalKey<FormState> formkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterLoading) {
          isloading = true;
        } else if (state is RegisterSuccess) {
             BlocProvider.of<ChatCubit>(context).getmessages();
          Navigator.pushNamed(context, chatpage.id, arguments: email);
          isloading = false;
        } else if (state is RegisterFailure) {
          show_snackbar(context, state.message);
          isloading = false;
        }
      },
      builder: (context, state) =>
         ModalProgressHUD(
          inAsyncCall: isloading,
          child: Scaffold(
            backgroundColor: kPrimaryColor,
            body: Container(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Form(
                  key: formkey,
                  child: ListView(
                    children: [
                      SizedBox(
                        height: 75,
                      ),
                      Image.asset(
                        'assets/images/scholar.png',
                        height: 100,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Scholar Chat',
                            style: TextStyle(
                                fontSize: 32,
                                fontFamily: 'Pacifico',
                                color: Colors.white),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 75,
                      ),
                      Row(
                        children: [
                          Text(
                            'REGISTER',
                            style: TextStyle(fontSize: 24, color: Colors.white),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      textfiled(
                        obsecure: false,
                        hint: 'Email',
                        onChanged: (value) {
                          email = value;
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      textfiled(
                        obsecure: true,
                        hint: 'Password',
                        onChanged: (value) {
                          password = value;
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      buttom(
                        onTap: () async {
                          if (formkey.currentState!.validate()) {
                            BlocProvider.of<RegisterCubit>(context)
                                .Register_page(
                                    email: email!, password: password!);
                          }
                        },
                        text: 'REGISTER',
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'already have an account?  ',
                            style: TextStyle(color: Colors.white),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              'LOGIN',
                              style: TextStyle(color: Color(0xffC7EDE6)),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 75,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
      }
    
  
}
