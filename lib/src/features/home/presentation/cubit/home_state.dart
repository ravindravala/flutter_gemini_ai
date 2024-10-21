part of 'home_cubit.dart';

class HomeState extends Equatable {
  final bool isLoading;
  final String? error;
  final List<Message> chatMessages;

  const HomeState({
    required this.isLoading,
    this.error,
    required this.chatMessages,
  });

  factory HomeState.initial() {
    return const HomeState(
      isLoading: false,
      chatMessages: [],
    );
  }

  HomeState copyWith({
    bool? isLoading,
    String? error,
    List<Message>? chatMessages,
  }) {
    return HomeState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      chatMessages: chatMessages ?? this.chatMessages,
    );
  }

  @override
  List<Object?> get props => [isLoading, error, chatMessages];
}
