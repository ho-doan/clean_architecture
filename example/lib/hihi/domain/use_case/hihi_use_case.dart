import 'package:dartz/dartz.dart';
import 'dart:async';
import '../repositories/hihi_repository.dart';

class HihiUseCase {
  HihiUseCase(this._repository) : _localDataSource = '';

  final HihiRepository _repository;
  // ignore: unused_field
  final String _localDataSource;
  Future<Either<String, dynamic>> get(String id) => _repository.get(id);
}
