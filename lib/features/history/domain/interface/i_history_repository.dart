import 'package:nymph_assignment/features/history/domain/entities/history_entities.dart';

abstract class IHistoryRepository {
  Future<List<HistoryEntities>> getAll();
  Future<void> add({required HistoryEntities history});
  Future<void> update({required int index, required HistoryEntities history});
  Future<void> delete({required int index});
}
