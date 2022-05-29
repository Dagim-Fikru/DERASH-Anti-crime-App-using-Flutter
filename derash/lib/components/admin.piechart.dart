import 'dart:html';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class AdminPiechart extends StatelessWidget {
  const AdminPiechart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = [
      ChartData('David', 5, Color.fromARGB(255, 0, 0, 0)),
      ChartData('Steve', 38, Color.fromARGB(244, 117, 176, 91)),
      ChartData('Jack', 24, Color.fromARGB(244, 173, 30, 173)),
      ChartData('Others', 12, Color.fromARGB(244, 75, 4, 255))
    ];
    return Container(
                  height: 250,
                  margin: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ]),
                  child: SfCircularChart(series: <CircularSeries>[
                    // Render pie chart
                    PieSeries<ChartData, String>(
                        dataSource: chartData,
                        pointColorMapper: (ChartData data, _) => data.color,
                        xValueMapper: (ChartData data, _) => data.x,
                        yValueMapper: (ChartData data, _) => data.y,
                        // radius: '70%',
                        // startAngle: 270,
                        // endAngle: 90,
                        explode: true,
                        explodeIndex: 1,
                        explodeGesture: ActivationMode.singleTap)
                  ]));
  }
  }
  class ChartData {
  ChartData(this.x, this.y, this.color);
  final String x;
  final double y;
  final Color color;
}