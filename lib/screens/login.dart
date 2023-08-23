import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fristproject/chat_cubit/cubit/chat_cubit.dart';
import 'package:fristproject/component/buttom.dart';
import 'package:fristproject/component/text_filed.dart';
import 'package:fristproject/const.dart';
import 'package:fristproject/login_cubit/cubit/login_cubit.dart';
import 'package:fristproject/screens/chat.dart';
import 'package:fristproject/screens/register.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../helper/show_snackbar.dart';

class login extends StatelessWidget {
  String? email;

  String? password;

  bool isloading = false;

  GlobalKey<FormState> formkey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if(state is LoginLoading){
          isloading=true;
        }
        else if(state is LoginSuccess){
          BlocProvider.of<ChatCubit>(context).getmessages();
           Navigator.pushNamed(context, chatpage.id,
                                  arguments: email);
                                  isloading=false;
        }
        else if(state is LoginFailure){
          show_snackbar(context, state.message);
          isloading=false;
        }
        
      },
     builder:(context, state) =>  ModalProgressHUD(
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
                          'LOGIN',
                          style: TextStyle(fontSize: 24, color: Colors.white),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    textfiled(
                      hint: 'Email',
                      obsecure: false,
                      onChanged: (p0) {
                        email = p0;
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    textfiled(
                      obsecure: true,
                      hint: 'Password',
                      onChanged: (p0) {
                        password = p0;
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    buttom(
                        onTap: () async {
                          if (formkey.currentState!.validate()) {
                          BlocProvider.of<LoginCubit>(context).login_page(email: email!, password: password!);
                          }
                        },
                        text: 'LOGIN'),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'dont have an account?  ',
                          style: TextStyle(color: Colors.white),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, Register.id);
                          },
                          child: Text(
                            'REGISTER',
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
      ),
    );
  }

  Future<void> login_page() async {
    UserCredential userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email!, password: password!);
  }
}
