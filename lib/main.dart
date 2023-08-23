import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fristproject/chat_cubit/cubit/chat_cubit.dart';
import 'package:fristproject/login_cubit/cubit/login_cubit.dart';
import 'package:fristproject/register_cubit/cubit/register_cubit.dart';
import 'package:fristproject/screens/chat.dart';
import 'package:fristproject/screens/login.dart';
import 'package:fristproject/screens/register.dart';
import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const scholarapp());
}

class scholarapp extends StatelessWidget {
  const scholarapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginCubit(),
        ),
        BlocProvider(
          create: (context) => RegisterCubit(),
        ),
          BlocProvider(
          create: (context) => ChatCubit(),
        )
      ],
      child: MaterialApp(
        routes: {
          'login': (context) => login(),
          Register.id: (context) => Register(),
          chatpage.id: (context) => chatpage(),
        },
        debugShowCheckedModeBanner: false,
        initialRoute: 'login',
      ),
    );
  }
}
