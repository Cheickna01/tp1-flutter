import 'dart:convert';

import 'package:dwm_bot/model/chat.bot.model.dart';
import 'package:http/http.dart' as http;

class ChatBotRepository {
  Future<Message> askLargeLangageModelLama(String prompt) async {
    Uri uri = Uri.parse("http://localhost:11434/v1/chat/completions");
    var headers = {"Content-Type": "application/json"};
    var body = {
      "model": "llama3.2",
      "messages": [
        {"role": "user", "content": prompt},
      ],
    };

    try {
      http.Response response = await http.post(
        uri,
        headers: headers,
        body: json.encode(body),
      );
      if (response.statusCode == 200) {
        Map<String, dynamic> result = jsonDecode(response.body);
        Message message = new Message(
          message: result["choices"][0]["message"]["content"],
          role: "assistant",
        );
        return message;
      } else {
        return throw ("Error ${response.statusCode}");
      }
    } catch (e) {
      return throw ("Error ${e.toString()}}");
    }
  }
}
