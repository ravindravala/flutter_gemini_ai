import 'package:flutter_dotenv/flutter_dotenv.dart'; // Import dotenv
import 'package:get_it/get_it.dart';
import 'package:gemini_ai/src/features/home/data/repositories/home_repository_imp.dart';
import 'package:gemini_ai/src/features/home/data/sources/remote_source_imp.dart';
import 'package:gemini_ai/src/features/home/domain/user_cases/fetch_answer.dart';
import 'package:gemini_ai/src/features/home/presentation/cubit/home_cubit.dart';
import 'package:gemini_ai/src/features/splash/cubit/splash_cubit.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

final GetIt getIt = GetIt.instance;

void setupLocator() {

  // Register the AI client
  getIt.registerSingleton<GenerativeModel>(
    GenerativeModel(
      model: 'gemini-1.5-flash-latest',
      apiKey: dotenv.env['API_KEY'] ?? '', // Use the API key from .env
    ),
  );

  // Register the remote data source
  getIt.registerSingleton<RemoteSourceImp>(
    RemoteSourceImp(aiClient: getIt<GenerativeModel>()),
  );

  // Register the home repository
  getIt.registerSingleton<HomeRepositoryImp>(
    HomeRepositoryImp(remoteDataSource: getIt<RemoteSourceImp>()),
  );

  // Register the fetch answer use case
  getIt.registerSingleton<FetchAnswer>(
    FetchAnswer(homeRepository: getIt<HomeRepositoryImp>()),
  );

  // Register the HomeCubit
  getIt.registerFactory<HomeCubit>(
    () => HomeCubit(getIt<FetchAnswer>()),
  );

  // Register the SplashCubit
  getIt.registerFactory<SplashCubit>(
    () => SplashCubit()..init(),
  );
}
