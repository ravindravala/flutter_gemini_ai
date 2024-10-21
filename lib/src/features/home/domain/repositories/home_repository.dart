import 'package:dartz/dartz.dart';
import 'package:gemini_ai/src/core/error/error.dart';
import 'package:gemini_ai/src/features/home/domain/entities/message.dart';

abstract class HomeRepository {
  Future<Either<Message, AppError>> fetchAnswer(String question);
}
