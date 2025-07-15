import 'package:nymph_assignment/features/history/data/repository/history_repository.dart';

class DeleteHistory{
  final HistoryRepository repository;
  DeleteHistory({required this.repository});

  Future<void> call({required int index}) => repository.delete(index: index);
}