import 'package:flutter/material.dart';
import 'package:timerapp/shared/widgets.dart';
import 'package:timerapp/widgets/percent_indicator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
        ),
        home: TimerHomePage());
  }
}

class TimerHomePage extends StatelessWidget {
  ////below is the constant constructor to get the Timer Home Page
  const TimerHomePage({Key? key}) : super(key: key);

  ///separating the buttons by the certain margin
  final double defaultPadding = 5;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("My Work Timer"),
        ),
        body: LayoutBuilder(
          builder: (context, constraints) {
            final availableWidth = constraints.maxWidth;
            return Column(
              children: [
                ////3 buttons on the top of the app
                Row(
                  children: [
                    Padding(padding: EdgeInsets.all(defaultPadding)),
                    Expanded(
                      child: ProductivityButton(
                          color: const Color(0xff009688),
                          text: "Work",
                          size: 3,
                          onPressed: () {}),
                    ),
                    Padding(padding: EdgeInsets.all(defaultPadding)),
                    Expanded(
                      child: ProductivityButton(
                          color: const Color(0xff607D8B),
                          text: "Short Break",
                          size: 3,
                          onPressed: () {}),
                    ),
                    Padding(padding: EdgeInsets.all(defaultPadding)),
                    Expanded(
                      child: ProductivityButton(
                          color: const Color(0xff455A64),
                          text: "Long Break",
                          size: 3,
                          onPressed: () {}),
                    ),
                    Padding(padding: EdgeInsets.all(defaultPadding)),
                  ],
                ),

                ////the indicator which indicates the remaining time
                TimerIndicator(
                  availableWidth: availableWidth,
                ),

                ////below is the row shows 2 buttons indicates either stopping the
                ///timer or restarting the timer
                Row(
                  children: [
                    Padding(padding: EdgeInsets.all(defaultPadding)),
                    Expanded(
                      child: ProductivityButton(
                        color: const Color(0xff212121),
                        size: 2,
                        text: "Stop",
                        onPressed: () {},
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(defaultPadding)),
                    Expanded(
                        child: ProductivityButton(
                      color: const Color(0xff009688),
                      size: 2,
                      text: "Restart",
                      onPressed: () {},
                    )),
                    Padding(padding: EdgeInsets.all(defaultPadding)),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
