import 'package:nymph_assignment/features/history/data/repository/history_repository.dart';
import 'package:nymph_assignment/features/history/domain/entities/history_entities.dart';

class AddHistory{
  final HistoryRepository repository;
  AddHistory({required this.repository});

  Future<void> call({required HistoryEntities history}) => repository.add(history: history);
}