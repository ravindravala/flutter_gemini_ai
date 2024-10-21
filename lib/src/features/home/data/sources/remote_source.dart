import 'package:google_generative_ai/google_generative_ai.dart';

abstract class RemoteDataSource {
  Future<GenerateContentResponse> fetchAnswer(String text);
}
