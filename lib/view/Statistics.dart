import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class Statistics extends StatefulWidget {
  @override
  _StatisticsState createState() => _StatisticsState();
}

class _StatisticsState extends State<Statistics> {
  final List<List<double>> dataSets = [
    [1, 0.1, 0.44, 0.23, 0.8],
    [0.65, 0.88, 0.34, 0.57, 0.25],
    [0.15, 0.28, 0.64, 0.37, 0.75],
    [0.55, 0.18, 0.24, 0.37, 0.95],
    [0.75, 0.08, 0.34, 0.47, 0.55],
  ];
  final List<Color> lineColors = [
    Colors.blue,
    Colors.red,
    Colors.green,
    Colors.orange,
    Colors.purple,
  ];
  late List<List<double>> activeData;
  final tips = [
    'Stop automatic video playback on social media platforms.',
    'Use a browser that supports data saving, or enable data compression in your browser settings.',
    'Disable background app updates for applications that do not require real-time updates.',
    'Set a data usage limit in your phone settings to receive alerts as you approach the limit.',
    'Download large files and videos only when connected to Wi-Fi.',
    'Restrict video streaming quality to save data.',
    'Close unused apps running in the background.',
    'Use offline mode for apps that support it, like music and navigation apps.',
  ];

  final List<IconData> icons = [
    Icons.video_call,
    Icons.language,
    Icons.refresh,
    Icons.phone_android,
    Icons.offline_pin,
  ];

  List<Item> _data = [];


  final List<String> titles = [
    'Stop Autoplay Videos',
    'Use Data Saving Browser',
    'Disable Background App Refresh',
    'Set Data Usage Limit',
    'Download Large Files on Wi-Fi',
    'Limit Video Streaming Quality',
    'Close Unused Apps',
    'Use Offline Mode When Available',
  ];

  @override
  void initState() {
    super.initState();
    activeData = dataSets;
    Timer.periodic(Duration(seconds: 2), (timer) {
      setState(() {
        activeData = dataSets.sublist(timer.tick % dataSets.length);
      });
    });

    for (var i = 0; i < tips.length; i++) {
      _data.add(Item(
        headerValue: 'Tip ${i + 1}',
        title: titles[i],
        expandedValue: tips[i],
      ));
    }
  }

  List<FlSpot> getSpots(List<double> values) {
    List<FlSpot> spots = [];
    for (var i = 0; i < values.length; i++) {
      spots.add(FlSpot(i.toDouble(), values[i]));
    }
    return spots;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/background.jpeg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, top: 50.0),
                  child: Text(
                    "Your internet consumption over the past month:",
                    style: TextStyle(fontSize: 17),
                    textAlign: TextAlign.left,
                  ),
                ),
                Container(
                  height: 200,
                  padding: EdgeInsets.all(20),
                  margin: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(0),
                  ),
                  child: LineChart(
                    LineChartData(
                      borderData: FlBorderData(show: false),
                      lineBarsData: activeData.map((data) {
                        int index = activeData.indexOf(data);
                        return LineChartBarData(
                          spots: getSpots(data),
                          isCurved: true,
                          color: lineColors[index % lineColors.length],
                          barWidth: 5,
                          belowBarData: BarAreaData(show: false),
                        );
                      }).toList(),
                      titlesData: FlTitlesData(show: false),
                    ),
                  ),
                ),
                Container(
                  height: 200,
                  padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 20.0),
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: buildStatCard(
                            "Peak Consumption", "400 MB", Icons.arrow_upward),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: buildStatCard(
                            "Average Consumption", "250 MB", Icons.show_chart),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: buildStatCard(
                            "Total Consumption", "12 GB", Icons.import_export),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: ExpansionPanelList(
                      expansionCallback: (int index, bool isExpanded) {
                        setState(() {
                          _data[index].isExpanded = !isExpanded;
                        });
                      },
                      children: _data.map<ExpansionPanel>((Item item) {
                        return ExpansionPanel(
                          headerBuilder:
                              (BuildContext context, bool isExpanded) {
                            return ListTile(
                              leading: Icon(
                                  icons[_data.indexOf(item) % icons.length]),
                              title: Text(item.title),
                            );
                          },
                          body: ListTile(
                            title: Text(item.expandedValue),
                          ),
                          isExpanded: item.isExpanded,
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildStatCard(String title, String count, IconData iconData) {
    return Container(
      width: 200,
      child: Card(
        elevation: 3.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: Container(
          padding: EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Icon(
                    iconData,
                    color: Colors.blue,
                  ),
                  Expanded(
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.black,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.0),
              Text(
                count,
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
class Item {
  Item({
    required this.expandedValue,
    required this.headerValue,
    required this.title,
    this.isExpanded = false,
  });

  String expandedValue;
  String headerValue;
  String title;
  bool isExpanded;
}