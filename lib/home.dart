import 'package:flutter/material.dart';
import 'package:readcalllogs/cubit/logcontrol_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:readcalllogs/module/logmodule.dart';

class calllogview extends StatelessWidget {
  const calllogview({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LogcontrolCubit()..start(),
      child: BlocConsumer<LogcontrolCubit, LogcontrolState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          final blocprovider = BlocProvider.of<LogcontrolCubit>(context);
          return Scaffold(
            appBar: AppBar(
              title: const Text('Mobile log calls'),
            ),
            body: blocprovider.callslogitems == null
                ? const CircularProgressIndicator()
                : ListView.separated(
                    itemBuilder: (context, index) {
                      callmodule temp = blocprovider.callslogitems![index];
                      return CallLogWidget(
                        calllog: temp,
                      );
                    },
                    itemCount: blocprovider.callslogitems!.length,
                    separatorBuilder: (BuildContext context, int index) {
                      return const Divider();
                    },
                  ),
          );
        },
      ),
    );
  }
}

class CallLogWidget extends StatelessWidget {
  final callmodule calllog;
  const CallLogWidget({super.key, required this.calllog});

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 110,
      child: Row(
        children: [
          const SizedBox(width: 12),
          const CircleAvatar(
            radius: 25,
            backgroundColor: Colors.orange,
            child: Icon(
              Icons.person,
              size: 35,
            ),
          ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              calllog.name == 'unknown'
                  ? Text(calllog.number)
                  : Text(calllog.name),
              Row(
                children: [
                  Text(calllog.callType.name),
                  const SizedBox(width: 6),
                  Text(
                    calllog.date(),
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              Text(calllog.durationString()),
            ],
          )
        ],
      ),
    );
  }
}
