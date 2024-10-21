import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gemini_ai/src/features/home/domain/entities/message.dart';
import 'package:gemini_ai/src/features/home/domain/user_cases/fetch_answer.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final FetchAnswer _fetchAnswer;

  final List<Message> _messages;

  HomeCubit(this._fetchAnswer)
      : _messages = [],
        super(HomeState.initial());

  Future<void> submitQuestion(String text) async {
    _messages.add(Message(type: MessageType.question, text: text));
    emit(state.copyWith(isLoading: true, chatMessages: _messages));

    var response = await _fetchAnswer.execute(text);

    response.fold((message) {
      _messages.add(message);
      emit(state.copyWith(isLoading: false, chatMessages: _messages));
    }, (error) {
      emit(state.copyWith(error: error.error, isLoading: false));
    });
  }
}


