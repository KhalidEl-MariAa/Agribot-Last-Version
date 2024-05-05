import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/account_data.dart';
import 'package:flutter_application_1/add_figma/scanning.dart';
import 'package:flutter_application_1/sensor.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:percent_indicator/percent_indicator.dart';

class Test extends StatelessWidget {
  const Test({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Liquid Pull To Refresh'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<LiquidPullToRefreshState> _refreshIndicatorKey =
      GlobalKey<LiquidPullToRefreshState>();

  static int refreshNum = 10; // number that changes when refreshed
  Stream<int> counterStream =
      Stream<int>.periodic(const Duration(seconds: 3), (x) => refreshNum);

  ScrollController? _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  double percentage = 0.7;
  List<Sensor> sensor = [
    Sensor(
        name: 'Ph sensor',
        description:
            'It is a miniature computer with standard credit card dimensions ',
        reading: 0),
    Sensor(
        name: 'Soil moisture sensor',
        description:
            'It is a device for monitoring moisture levels in the soil',
        reading: 0),
    Sensor(
        name: 'Soil temperature sensor',
        description:
            'They are devices used to measure the temperature of the soil or ground.',
        reading: 0)
  ];

  Future<void> _handleRefresh() {
    final Completer<void> completer = Completer<void>();
    Timer(const Duration(seconds: 3), () {
      completer.complete();
    });
    setState(() {
      refreshNum = Random().nextInt(100);
    });
    return completer.future.then<void>((_) {
      ScaffoldMessenger.of(_scaffoldKey.currentState!.context).showSnackBar(
        SnackBar(
          content: const Text('Refresh complete'),
          action: SnackBarAction(
            label: 'RETRY',
            onPressed: () {
              _refreshIndicatorKey.currentState!.show();
            },
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.greenAccent,
          leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
          title: const Text(
            'sensor',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const Account(),
                  ));
                },
                icon: const Icon(
                  Icons.account_circle_outlined,
                  size: 35,
                ))
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.greenAccent,
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const Scanning()));
          },
          child: const Icon(Icons.add),
        ),
        body: Column(children: [
          const Text(
            'Iot Monitoring',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          CircularPercentIndicator(
            radius: 150.0, // قطر الدائرة
            lineWidth: 12.0, // عرض الخط الذي يحيط بالدائرة
            percent: percentage, // النسبة المئوية
            center: Text("${(percentage * 100).toStringAsFixed(1)}%",
                style: const TextStyle(fontSize: 20.0)),
            circularStrokeCap: CircularStrokeCap.round,
            backgroundColor: Colors.grey,
            progressColor: Colors.blue,
          ),
          Expanded(
            child: LiquidPullToRefresh(
              key: _refreshIndicatorKey,
              onRefresh: _handleRefresh,
              showChildOpacityTransition: false,
              child: StreamBuilder<int>(
                stream: counterStream,
                builder: (context, snapshot) {
                  return ListView.separated(
                      itemBuilder: (context, indexe) {
                        return Container(
                          alignment: Alignment.topLeft,
                          height: 200,
                          decoration: BoxDecoration(
                              color: Colors.greenAccent,
                              borderRadius: BorderRadius.circular(40)),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 15.0, left: 12),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Sensor : ${sensor[indexe].name}',
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'description of Sensor : ${sensor[indexe].description}',
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Center(
                                    child: Text(
                                      'Sensor readers at the present time : ${sensor[indexe].reading}',
                                      style: const TextStyle(fontSize: 18),
                                    ),
                                  )
                                ]),
                          ),
                        );
                      },
                      separatorBuilder: (context, indexe) {
                        return const SizedBox(
                          height: 20,
                        );
                      },
                      itemCount: sensor.length);
                },
              ),
            ),
          ),
        ]));
  }
}
