import 'package:dartz/dartz.dart';
import 'package:example/hihi/data/local_data_sources/hihi_local_data_source.dart';
import 'package:example/hihi/domain/repositories/hihi_repository.dart';
import '../models/models.dart';

class HihiRemoteDataSource {
  HihiRemoteDataSource(/*this._apiClient*/)
      : ggg = HihiRepositoryImlp(
          HihiRemoteDataSource(),
          HihiLocalDataSource(),
        );
  // final ApiClient _apiClient;
  final HihiRepositoryImlp ggg;

  Future<Either<String, HihiModel>> get(String id) async {
    try {
      // final result = await _apiClient.get(id);
      // if (result.response.statusCode == 200) {
      //   final resultLocal = await _localDataSource.get(id);
      //   final data = resultRemote.data;
      //   return Right(data);
      // }
      // return Left('${result.response.statusCode}:${result.response.statusMessage}');
      return Right(HihiModel());
    } catch (e) {
      return Left(e.toString());
    }
  }
}
