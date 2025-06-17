import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ChatbotPage extends StatefulWidget {
  ChatbotPage({super.key});

  @override
  State<ChatbotPage> createState() => _ChatbotPageState();
}

class _ChatbotPageState extends State<ChatbotPage> {
  TextEditingController messageController = TextEditingController();
  ScrollController scrollController = ScrollController();
  var messages = [];

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
          Expanded(
            child: ListView.builder(
              controller: scrollController,
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Row(
                      children: [
                        messages[index]["role"] == "user"
                            ? SizedBox(width: 0)
                            : SizedBox(width: 80),
                        Expanded(
                          child: Card.outlined(
                            margin: EdgeInsets.all(6),
                            color:
                                (messages[index]["role"] == "assistant"
                                    ? Colors.white
                                    : Color.fromARGB(100, 0, 255, 0)),
                            child: ListTile(
                              title: Text("${messages[index]["content"]}"),
                            ),
                          ),
                        ),
                        messages[index]["role"] == "assistant"
                            ? SizedBox(width: 0)
                            : SizedBox(width: 80),
                      ],
                    ),
                    Divider(),
                  ],
                );
              },
            ),
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
                    setState(() {
                      messages.add({"role": "user", "content": message});
                    });
                    scrollController.jumpTo(
                      scrollController.position.maxScrollExtent + 800,
                    );
                    // pour openAI Uri uri = Uri.parse("http://api.openai.com/v1/chat/completions",);
                    Uri uri = Uri.parse(
                      "http://localhost:11434/v1/chat/completions",
                    );
                    var headers = {"Content-Type": "application/json"};
                    // pour openAI var body = {"model": "gpt-4o", "messages": messages};
                    var body = {"model": "llama3.2", "messages": messages};

                    http
                        .post(uri, headers: headers, body: json.encode(body))
                        .then((res) {
                          var aiResponse = json.decode(res.body);
                          String reponse =
                              aiResponse["choices"][0]["message"]["content"];
                          setState(() {
                            messages.add({
                              "role": "assistant",
                              "content": reponse,
                            });
                          });
                          scrollController.jumpTo(
                            scrollController.position.maxScrollExtent + 800,
                          );
                        })
                        .catchError((e) {
                          print(e);
                        });
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
