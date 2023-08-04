import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../data/local_data_sources/hihi_local_data_source.dart';
import '../../data/remote_data_sources/hihi_remote_data_source.dart';
import '../../data/models/models.dart';

@injectable
abstract class HihiRepository {
  @factoryMethod
  static HihiRepositoryImlp create(
    HihiRemoteDataSource remoteDataSource,
    HihiLocalDataSource localDataSource,
  ) =>
      HihiRepositoryImlp(remoteDataSource, localDataSource);

  Future<Either<String, HihiModel>> get(String id);
}

class HihiRepositoryImlp extends HihiRepository {
  HihiRepositoryImlp(
    this._remoteDataSource,
    this._localDataSource,
  ) : aaa = 1;

  // ignore: unused_field
  final HihiLocalDataSource _localDataSource;
  final int aaa;
  // ignore: unused_field
  final HihiRemoteDataSource _remoteDataSource;
  @override
  Future<Either<String, HihiModel>> get(String id) async {
    try {
      const a = 4;
      // final resultRemote = await _remoteDataSource.get(id);
      // final resultLocal = await _localDataSource.get(id);
      // final data = resultRemote.data;
      return Right(HihiModel());
    } catch (e) {
      return Left(e.toString());
    }
  }
}
