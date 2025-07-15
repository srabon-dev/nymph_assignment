import 'package:nymph_assignment/features/history/data/model/history_model.dart';
import 'package:nymph_assignment/features/history/domain/entities/history_entities.dart';
import 'package:nymph_assignment/features/history/domain/interface/i_history_repository.dart';

import '../../../../core/core_export.dart';

class HistoryRepository implements IHistoryRepository {
  final HistoryLocalDataSource localDataSource;

  HistoryRepository(this.localDataSource);

  @override
  Future<void> add({required HistoryEntities history}) => localDataSource.add(HistoryModel.fromEntity(history));

  @override
  Future<void> update({required int index, required HistoryEntities history}) =>
      localDataSource.update(index, HistoryModel.fromEntity(history));

  @override
  Future<void> delete({required int index}) => localDataSource.delete(index);

  @override
  Future<List<HistoryEntities>> getAll() async {
    final models = await localDataSource.getAll();
    return models.map((e) => e.toEntity()).toList();
  }
}
