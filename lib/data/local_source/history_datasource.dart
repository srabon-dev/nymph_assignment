import 'package:hive/hive.dart';
import 'package:nymph_assignment/features/history/data/model/history_model.dart';

abstract class HistoryLocalDataSource {
  Future<List<HistoryModel>> getAll();
  Future<void> add(HistoryModel model);
  Future<void> update(int index, HistoryModel model);
  Future<void> delete(int index);
}

class HistoryLocalDataSourceImpl implements HistoryLocalDataSource {
  final Box<HistoryModel> box;

  HistoryLocalDataSourceImpl(this.box);

  @override
  Future<List<HistoryModel>> getAll() async => box.values.toList();

  @override
  Future<void> add(HistoryModel model) async => await box.add(model);

  @override
  Future<void> update(int index, HistoryModel model) async {
    final item = box.getAt(index);
    if (item != null) {
      item.text = model.text;
      item.count = model.count;
      await item.save();
    }
  }

  @override
  Future<void> delete(int index) async => await box.deleteAt(index);
}