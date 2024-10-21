part of 'home_cubit.dart';

class HomeState extends Equatable {
  final bool isLoading;
  final String? error;
  final List<GenerateContentResponse> responses;

  HomeState({
    required this.isLoading,
    this.error,
    required this.responses,
  });

  factory HomeState.initial() {
    return HomeState(
      isLoading: false,
      responses: [],
    );
  }

  HomeState copyWith({
    bool? isLoading,
    GenerateContentResponse? data,
    String? error,
    List<GenerateContentResponse>? responses,
  }) {
    return HomeState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      responses: responses ?? this.responses,
    );
  }

  @override
  List<Object?> get props => [isLoading, error, responses];
}
