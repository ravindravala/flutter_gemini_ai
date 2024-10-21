import 'package:dartz/dartz.dart';
import 'package:gemini_ai/src/core/error/error.dart';
import 'package:gemini_ai/src/features/home/data/sources/remote_source.dart';
import 'package:gemini_ai/src/features/home/domain/entities/message.dart';
import 'package:gemini_ai/src/features/home/domain/repositories/home_repository.dart';

class HomeRepositoryImp implements HomeRepository {
  final RemoteDataSource _remoteDataSource;

  HomeRepositoryImp({required RemoteDataSource remoteDataSource})
      : _remoteDataSource = remoteDataSource;
  @override
  Future<Either<Message, AppError>> fetchAnswer(String question) async {
    try {
      var response = await _remoteDataSource.fetchAnswer(question);
      return Left(Message(type: MessageType.answer, text: response.text));
    } catch (e) {
      return Right(AppError(error: e.toString()));
    }
  }
}
