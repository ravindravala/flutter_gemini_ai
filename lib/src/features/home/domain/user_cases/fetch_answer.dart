import 'package:dartz/dartz.dart';
import 'package:gemini_ai/src/core/error/error.dart';
import 'package:gemini_ai/src/features/home/domain/entities/message.dart';
import 'package:gemini_ai/src/features/home/domain/repositories/home_repository.dart';

class FetchAnswer {
  final HomeRepository _homeRepository;

  FetchAnswer({required HomeRepository homeRepository})
      : _homeRepository = homeRepository;
      
  Future<Either<Message, AppError>> execute(String text) async {
    return _homeRepository.fetchAnswer(text);
  }
}
