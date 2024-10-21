import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_generative_ai/google_generative_ai.dart'; // Import the package

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final GenerativeModel _aiClient;
  final List<GenerateContentResponse> _responses = []; // Make the list final

  HomeCubit(String apiKey)
      : _aiClient = GenerativeModel(
          model: 'gemini-1.5-flash-latest', // Specify the model
          apiKey: apiKey, // Pass the API key
        ),
        super(HomeState.initial());

  // New method to fetch data from Google Generative AI
  Future<void> fetchGenerativeAIResponse(String prompt) async {
    final currentState = state.copyWith(isLoading: true); // Set loading state
    emit(currentState);

    try {
      final response = await _aiClient.generateContent([Content.text(prompt)]); // Use the package to generate text

      // Store the response in the list
      _responses.add(response); // Add response to the list
      emit(currentState.copyWith(data: response, isLoading: false, responses: _responses)); // Emit loaded state with data
    } catch (e) {
      emit(currentState.copyWith(error: e.toString(), isLoading: false)); // Emit error state
    }
  }
}
