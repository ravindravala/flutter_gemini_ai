import 'package:gemini_ai/src/features/home/data/sources/remote_source.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class RemoteSourceImp implements RemoteDataSource {
  final GenerativeModel _aiClient;

  RemoteSourceImp({required GenerativeModel aiClient}) : _aiClient = aiClient;

  @override
  Future<GenerateContentResponse> fetchAnswer(String text) async {
    try {
      return await _aiClient.generateContent([Content.text(text)]);
    } catch (e) {
      rethrow;
    }
  }
}
