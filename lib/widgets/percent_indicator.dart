import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:timerapp/models/CountDownTimer.dart';

class TimerIndicator extends StatefulWidget {
  final double availableWidth;
  const TimerIndicator({Key? key, required this.availableWidth})
      : super(key: key);

  @override
  State<TimerIndicator> createState() => _TimerIndicatorState();
}

class _TimerIndicatorState extends State<TimerIndicator> {
  CountDownTimer tr = CountDownTimer(work: 65);
  int i = 0;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      initialData: 0,
      stream: tr.countDown(),
      builder: (context, snapshot) {
        return Expanded(
          child: CircularPercentIndicator(
            radius: widget.availableWidth / 4,
            lineWidth: 10,
            percent: double.parse(snapshot.data.toString()) / tr.work,
            progressColor: const Color(0xff009688),
            center: Text(
              formattedTime(snapshot.data.toString()),
              style: Theme.of(context).textTheme.displayMedium,
            ),
          ),
        );
      },
    );
  }
}

String formattedTime(String initialTimeinSeconds) {
  ////getting the minute from the time passed
  String minutes = (int.parse(initialTimeinSeconds) ~/ 60) > 10
      ? (int.parse(initialTimeinSeconds) ~/ 60).toString()
      : ("0" + (int.parse(initialTimeinSeconds) ~/ 60).toString());

  ///getting the seconds from the time passed
  String seconds =
      (int.parse(initialTimeinSeconds) - int.parse(minutes) * 60) >= 10
          ? (int.parse(initialTimeinSeconds) - int.parse(minutes) * 60)
              .toString()
          : "0" +
              (int.parse(initialTimeinSeconds) - int.parse(minutes) * 60)
                  .toString();
  ;

  return minutes + ":" + seconds;
}
