import 'package:dwm_bot/bloc/chat.bot.bloc.dart';
import 'package:dwm_bot/pages/chatbot.page.dart';
import 'package:dwm_bot/pages/login.page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => ChatBotBloc())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          "/": (context) => LoginPage(),
          "/bot": (context) => ChatbotPage(),
        },
        theme: ThemeData(
          primaryColor: Colors.teal,
          indicatorColor: Colors.white,
        ),
      ),
    );
  }
}
