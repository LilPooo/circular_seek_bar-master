import 'package:circular_seek_bar/circular_seek_bar.dart';
// import 'package:circular_seek_bar_example/util/text_style.dart';
import 'package:flutter/material.dart';
import 'custom_circular.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter circular_seek_bar example',
      theme: ThemeData(
        primaryColor: Colors.blue,
        brightness: Brightness.dark,
      ),
      home: const CircularSeekBarExamplePage(),
    );
  }
}

class CircularSeekBarExamplePage extends StatefulWidget {
  const CircularSeekBarExamplePage({Key? key}) : super(key: key);

  @override
  State<CircularSeekBarExamplePage> createState() =>
      _CircularSeekBarExamplePageState();
}

class _CircularSeekBarExamplePageState
    extends State<CircularSeekBarExamplePage> {
  final ValueNotifier<double> _valueNotifier = ValueNotifier(0);

  double _progress = 90;
  double _startAngle = 45;
  double _sweepAngle = 270;
  double _dashWidth = 0;
  double _dashGap = 0;
  double _barWidth = 8.0;
  bool _useGradient = true;
  bool _rounded = true;
  bool _animation = true;
  bool _thumbVisible = true;
  bool _interactive = true;

  @override
  void dispose() {
    _valueNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.blue,
      appBar: AppBar(
        title: const Text('Flutter circular_seek_bar example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CircularCustom()));
              },
              child: const Text('Test'),
            ),

            // first circle
            CircularSeekBar(
              width: 400,
              height: 320,
              progress: _progress,
              barWidth: 8,
              startAngle: 60,
              sweepAngle: 240,
              strokeCap: StrokeCap.butt,
              progressGradientColors: const [
                Colors.red,
                Colors.red,
              ],
              //dashWidth + dashGap : Divide Circle into many parts
              dashWidth: 1,
              dashGap: 5,
              animation: true,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 55, 0, 0),
                    //second circle
                    child: CircularSeekBar(
                      width: 164,
                      height: 164,
                      progress: _progress,
                      barWidth: 4,
                      startAngle: 60,
                      sweepAngle: 240,
                      strokeCap: StrokeCap.butt,
                      progressGradientColors: const [
                        Colors.red,
                        Colors.red,
                      ],
                      outerThumbStrokeWidth: 10,
                      outerThumbColor: Colors.blueAccent,
                      animation: true,
                      child: const Column(
                        // mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 24, 0, 0),
                            child: Icon(Icons.download),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 16, 0, 16),
                            child: Text('97'),
                          ),
                          Text('mbps'),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                            child: Text('Ping: 5 ms'),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            ///Circle can change the value
            CircularSeekBar(
              width: double.infinity,
              progress: _progress,
              height: 250,
              barWidth: _barWidth,
              startAngle: _startAngle,
              sweepAngle: _sweepAngle,
              strokeCap: _rounded ? StrokeCap.round : StrokeCap.butt,
              progressGradientColors: _useGradient
                  ? [
                      Colors.red,
                      Colors.orange,
                      Colors.yellow,
                      Colors.green,
                      Colors.blue,
                      Colors.indigo,
                      Colors.purple
                    ]
                  : [],
              dashWidth: _dashWidth,
              dashGap: _dashGap,
              animation: _animation,
              curves: Curves.linear,
              innerThumbRadius: _thumbVisible ? 5 : 0,
              innerThumbStrokeWidth: _thumbVisible ? 3 : 0,
              outerThumbRadius: _thumbVisible ? 5 : 0,
              outerThumbStrokeWidth: _thumbVisible ? 10 : 0,
              valueNotifier: _valueNotifier,
              interactive: _interactive,
              child: Center(
                child: ValueListenableBuilder(
                    valueListenable: _valueNotifier,
                    builder: (_, double value, __) => Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              '${value.round()}',
                            ),
                            Text(
                              'progress',
                            ),
                            Text('hi'),
                            Text('Stupid')
                          ],
                        )),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        children: [
                          Text(
                            'progress: ',
                          ),
                          Slider(
                            min: 0.0,
                            max: 100.0,
                            value: _progress,
                            onChanged: (value) {
                              setState(() {
                                _progress = value;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        children: [
                          //change the angle
                          Text(
                            'startAngle: ',
                          ),
                          Slider(
                            min: 0.0,
                            max: 360.0,
                            value: _startAngle,
                            onChanged: (value) {
                              setState(() {
                                _startAngle = value;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        children: [
                          Text(
                            'sweepAngle: ',
                          ),
                          Slider(
                            min: 0.0,
                            max: 360.0,
                            value: _sweepAngle,
                            onChanged: (value) {
                              setState(() {
                                _sweepAngle = value;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        children: [
                          Text(
                            'dashWidth: ',
                          ),
                          Slider(
                            min: 0.0,
                            max: 40.0,
                            value: _dashWidth,
                            onChanged: (value) {
                              setState(() {
                                _dashWidth = value;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        children: [
                          Text(
                            'dashGap: ',
                          ),
                          Slider(
                            min: 0.0,
                            max: 10.0,
                            value: _dashGap,
                            onChanged: (value) {
                              setState(() {
                                _dashGap = value;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        children: [
                          Text(
                            'barWidth: ',
                          ),
                          Slider(
                            min: 1.0,
                            max: 10,
                            value: _barWidth,
                            onChanged: (value) {
                              setState(() {
                                _barWidth = value;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        children: [
                          Text(
                            'useGradient: ',
                          ),
                          Switch(
                              value: _useGradient,
                              onChanged: (value) {
                                setState(() {
                                  _useGradient = value;
                                });
                              }),
                          Text(
                            'rounded: ',
                          ),
                          Switch(
                              value: _rounded,
                              onChanged: (value) {
                                setState(() {
                                  _rounded = value;
                                });
                              }),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        children: [
                          Text(
                            'animation: ',
                          ),
                          Switch(
                              value: _animation,
                              onChanged: (value) {
                                setState(() {
                                  _animation = value;
                                });
                              }),
                          Text(
                            'thumbVisible: ',
                          ),
                          Switch(
                              value: _thumbVisible,
                              onChanged: (value) {
                                setState(() {
                                  _thumbVisible = value;
                                });
                              }),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        children: [
                          Text(
                            'interactive: ',
                          ),
                          Switch(
                              value: _interactive,
                              onChanged: (value) {
                                setState(() {
                                  _interactive = value;
                                });
                              }),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
