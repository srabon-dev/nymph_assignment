import 'package:nymph_assignment/features/history/data/repository/history_repository.dart';
import 'package:nymph_assignment/features/history/domain/entities/history_entities.dart';

class GetHistory{
  final HistoryRepository repository;
  GetHistory({required this.repository});

  Future<List<HistoryEntities>> call() => repository.getAll();
}