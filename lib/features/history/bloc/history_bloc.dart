import 'package:nymph_assignment/features/history/domain/usecase/get_history.dart';

import '../../../core/core_export.dart';
import '../domain/usecase/add_history.dart';
import '../domain/usecase/delete_history.dart';

part 'history_event.dart';

part 'history_state.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  final GetHistory getHistory;
  final AddHistory addHistory;
  final DeleteHistory deleteHistory;

  HistoryBloc({required this.getHistory, required this.addHistory, required this.deleteHistory})
    : super(HistoryInitial()) {
    on<HistoryEvent>((event, emit) {});
  }
}
