import 'package:hive/hive.dart';
import 'package:nymph_assignment/features/history/domain/entities/history_entities.dart';

part 'history_model.g.dart';

@HiveType(typeId: 1)
class HistoryModel extends HiveObject {
  @HiveField(0)
  String text;

  @HiveField(1)
  int count;

  HistoryModel({required this.text, required this.count});

  HistoryEntities toEntity() => HistoryEntities(text: text, count: count);

  factory HistoryModel.fromEntity(HistoryEntities entity) =>
      HistoryModel(text: entity.text, count: entity.count);
}

