import 'dart:convert';

import 'package:dwm_bot/bloc/chat.bot.bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class ChatbotPage extends StatelessWidget {
  ChatbotPage({super.key});

  TextEditingController messageController = TextEditingController();
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "DWM chatbot",
          style: TextStyle(color: Theme.of(context).indicatorColor),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.pushNamed(context, "/");
            },
            icon: Icon(Icons.logout, color: Theme.of(context).indicatorColor),
          ),
        ],
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<ChatBotBloc, ChatBotState>(
            builder: (context, state) {
              if (state is ChatBotPendingState) {
                return CircularProgressIndicator();
              } else if (state is ChatBotErrorState) {
                return Column(
                  children: [
                    Text(
                      state.errorMessage,
                      style: TextStyle(color: Colors.red),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        ChatBotEvent evt =
                            context.read<ChatBotBloc>().lastEvent;
                        context.read<ChatBotBloc>().add(evt);
                      },
                      child: Text("Retry"),
                    ),
                  ],
                );
              } else if (state is ChatBotSuccessState ||
                  state is ChatBotInitialState) {
                return Expanded(
                  child: ListView.builder(
                    controller: scrollController,
                    itemCount: state.messages.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Row(
                            children: [
                              state.messages[index].role == "user"
                                  ? SizedBox(width: 80)
                                  : SizedBox(width: 0),
                              Expanded(
                                child: Card.outlined(
                                  margin: EdgeInsets.all(6),
                                  color:
                                      (state.messages[index].role == "assistant"
                                          ? Colors.white
                                          : Color.fromARGB(100, 0, 255, 0)),
                                  child: ListTile(
                                    title: Text(
                                      "${state.messages[index].message}",
                                    ),
                                  ),
                                ),
                              ),
                              state.messages[index].role == "assistant"
                                  ? SizedBox(width: 0)
                                  : SizedBox(width: 80),
                            ],
                          ),
                          Divider(),
                        ],
                      );
                    },
                  ),
                );
              } else {
                return Container();
              }
            },
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: messageController,
                    decoration: InputDecoration(
                      label: Text("Message"),
                      suffixIcon: Icon(Icons.message),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          width: 1,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    String message = messageController.text;
                    context.read<ChatBotBloc>().add(askLLM(message: message));
                    messageController.text = "";
                    scrollController.jumpTo(
                      scrollController.position.maxScrollExtent + 800,
                    );
                  },
                  icon: Icon(Icons.send),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
