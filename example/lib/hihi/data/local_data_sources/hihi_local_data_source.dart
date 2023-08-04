import '../models/models.dart';

class HihiLocalDataSource {
  HihiLocalDataSource();

  Future<HihiModel> get(String id) async {
    // if (instance == null) throw Exception('db null');
    // return instance!.hihiModels.filter().idEqualTo(id).findFirst();
    return HihiModel();
  }
}
