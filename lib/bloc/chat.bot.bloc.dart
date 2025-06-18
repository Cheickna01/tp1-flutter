import 'package:bloc/bloc.dart';
import 'package:dwm_bot/model/chat.bot.model.dart';
import 'package:dwm_bot/repository/chat.bot.repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class ChatBotEvent {}

class askLLM extends ChatBotEvent {
  final String message;

  askLLM({required this.message});
}

abstract class ChatBotState {
  final List<Message> messages;

  ChatBotState({required this.messages});
}

class ChatBotPendingState extends ChatBotState {
  ChatBotPendingState({required super.messages});
}

class ChatBotSuccessState extends ChatBotState {
  ChatBotSuccessState({required super.messages});
}

class ChatBotErrorState extends ChatBotState {
  final String errorMessage;
  ChatBotErrorState({required super.messages, required this.errorMessage});
}

class ChatBotInitialState extends ChatBotState {
  ChatBotInitialState() : super(messages: []);
}

class ChatBotBloc extends Bloc<ChatBotEvent, ChatBotState> {
  final ChatBotRepository chatBotRepository = new ChatBotRepository();
  late ChatBotEvent lastEvent;
  ChatBotBloc() : super(ChatBotInitialState()) {
    List<Message> currentMessages = state.messages;
    on((askLLM event, emit) async {
      lastEvent = event;
      print(currentMessages);
      //emit(ChatBotPendingState(messages: state.messages));
      currentMessages.add(Message(message: event.message, role: "User"));
      emit(ChatBotSuccessState(messages: currentMessages));

      try {
        Message responseMessage = await chatBotRepository
            .askLargeLangageModelLama(event.message);
        currentMessages.add(responseMessage);
        emit(ChatBotSuccessState(messages: currentMessages));
      } on Exception catch (e) {
        emit(
          ChatBotErrorState(
            messages: state.messages,
            errorMessage: e.toString(),
          ),
        );
      }
    });
  }
}
