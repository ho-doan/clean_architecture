import 'package:dartz/dartz.dart';
import 'dart:async';
import '../../data/remote_data_sources/hihi_remote_data_source.dart';
import '../repositories/hihi_repository.dart';

class HihiUseCase {
  HihiUseCase(this._repository) : _localDataSource = '';

  final HihiRepository _repository;
  // ignore: unused_field
  final String _localDataSource;
  Future<Either<String, dynamic>> get(String id) {
    const a = 1;
    final bbb = getRM(
      //TODO: hodoan
      '',
    );
    return _repository.get(id);
  }
}

HihiRemoteDataSource getRM(String aa) => HihiRemoteDataSource();
