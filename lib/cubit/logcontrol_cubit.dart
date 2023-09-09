import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:call_log/call_log.dart';
import 'package:readcalllogs/module/logmodule.dart';

part 'logcontrol_state.dart';

class LogcontrolCubit extends Cubit<LogcontrolState> {
  LogcontrolCubit() : super(LogcontrolInitial());
  Iterable<CallLogEntry> _callLogEntries = <CallLogEntry>[];
  List<callmodule>? callslogitems;
  List<callmodule>? filteredcallslogitems;

  void start() async {
    _callLogEntries = <CallLogEntry>[];
    _callLogEntries = await CallLog.query();
    GetallcallLogs();
  }

  void GetallcallLogs() {
    emit(TryGetAllLogstate());
    callslogitems = [];
    for (CallLogEntry entry in _callLogEntries) {
      callslogitems?.add(callmodule(
          name: (entry.name!.isEmpty || entry.name == null)
              ? 'unknown'
              : entry.name!,
          number: entry.number ?? 'null',
          callType: entry.callType!,
          timpdate: entry.timestamp!,
          phoneAccountId: entry.phoneAccountId ?? "-1",
          simDisplayName: entry.simDisplayName ?? 'null',
          duration: entry.duration ?? 0));
    }
    emit(SucessGetAllLogstate());
  }

  void filterdate() {
    emit(TryGetAllLogstate());
    filteredcallslogitems =
        callslogitems!.where((i) => (i.name.contains('ahm'))).toList();

    emit(SucessGetAllLogstate());
  }
}
