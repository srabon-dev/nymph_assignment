import 'package:nymph_assignment/features/history/domain/usecase/get_history.dart';

import '../../../core/core_export.dart';
import '../domain/entities/history_entities.dart';
import '../domain/usecase/add_history.dart';
import '../domain/usecase/delete_history.dart';

part 'history_event.dart';

part 'history_state.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  final GetHistory getHistory;
  final AddHistory addHistory;
  final DeleteHistory deleteHistory;

  final List<HistoryEntities> historyList = [];
  HistoryBloc({
    required this.getHistory,
    required this.addHistory,
    required this.deleteHistory,
  }) : super(const HistoryUpdateState(historyList: [])) {

    on<HistoryLoadEvent>(_onLoad);
    on<HistoryAddEvent>(_onAdd);
    on<HistoryDeleteEvent>(_onDelete);

  }

  Future<void> _onLoad(HistoryLoadEvent event, Emitter<HistoryState> emit) async{
    try{
      final List<HistoryEntities> historyList = await getHistory.call();
      emit(HistoryUpdateState(historyList: historyList));
    }catch(_){
      debugPrint("Get data error");
    }
  }

  Future<void> _onAdd(HistoryAddEvent event, Emitter<HistoryState> emit) async{
    if (state is! HistoryUpdateState) return;
    try{
      await addHistory.call(history: HistoryEntities(text: event.text, count: event.count));
      final currentList = List<HistoryEntities>.from(
        (state as HistoryUpdateState).historyList,
      );

      currentList.insert(0, HistoryEntities(text: event.text, count: event.count));

      emit(HistoryUpdateState(historyList: currentList));
    }catch(_){
      debugPrint("Add data error");
    }
  }

  Future<void> _onDelete(HistoryDeleteEvent event, Emitter<HistoryState> emit) async{
    try{
      await deleteHistory(index: event.index);

      final currentList = List<HistoryEntities>.from(
        (state as HistoryUpdateState).historyList,
      );

      if (event.index >= 0 && event.index < currentList.length) {
        currentList.removeAt(event.index);
      }

      emit(HistoryUpdateState(historyList: currentList));
    }catch(_){
      debugPrint("Delete data error");
    }
  }
}
