import 'package:call_log/call_log.dart';
import 'package:meta/meta.dart';
import 'package:intl/intl.dart';

class callmodule {
  late String name;
  late String number;
  late CallType callType;
  late int timpdate;
  late int duration;
  late String phoneAccountId;
  late String simDisplayName;

  callmodule({
    required this.name,
    required this.number,
    required this.callType,
    required this.timpdate,
    required this.duration,
    required this.phoneAccountId,
    required this.simDisplayName,
  });

  String date() {
    DateTime calldate = DateTime.fromMillisecondsSinceEpoch(timpdate);

    final now = DateTime.now();
    final difference = now.difference(calldate);
    // If the last seen datetime is today, return the time
    if (now.year == calldate.year &&
        now.month == calldate.month &&
        now.day == calldate.day) {
      return ' ${DateFormat.jm().format(calldate)}';
    }

    if (difference.inDays < 7) {
      return ' ${DateFormat('EEEE').format(calldate)}';
    } else {
      return ' ${DateFormat('MMM d, y').format(calldate)}';
    }
  }

  String durationString() {
    if (duration == 0) return 'haven\'t answered';
    if (duration < 60) return '$duration sec';
    if (duration > 60 && duration < 3600) {
      int min = duration ~/ 60;
      return '$min min';
    } else {
      double hour = duration / 3600;
      hour = double.parse(hour.toStringAsFixed(2));
      return '$hour hour';
    }
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'number': number,
      'callType': callType,
      'timpdate': timpdate,
      'duration': duration,
      'phoneAccountId': phoneAccountId,
      'simDisplayName': simDisplayName,
    };
  }

  String tostring() {
    String res = "name: $name ,number: $number ";
    return res;
  }
}
