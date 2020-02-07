import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'package:first_app/model/chart/chart_data.dart';
import '../functions/get_bar_chart_data.dart';

class CustomBarChart extends StatefulWidget {
  final ChartData chartData;

  CustomBarChart({@required this.chartData});

  @override
  State<StatefulWidget> createState() => CustomBarChartState();
}

class CustomBarChartState extends State<CustomBarChart> {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.1,
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        color: const Color(0xff2c4260),
        child: BarChart(
          BarChartData(
            alignment: BarChartAlignment.spaceAround,
            maxY: 20,
            barTouchData: BarTouchData(
              enabled: false,
              touchTooltipData: BarTouchTooltipData(
                tooltipBgColor: Colors.transparent,
                tooltipPadding: const EdgeInsets.all(0),
                tooltipBottomMargin: 8,
                getTooltipItem: (
                  BarChartGroupData group,
                  int groupIndex,
                  BarChartRodData rod,
                  int rodIndex,
                ) {
                  return BarTooltipItem(
                    rod.y.round().toString(),
                    TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                },
              ),
            ),
            titlesData: FlTitlesData(
              show: true,
              bottomTitles: SideTitles(
                showTitles: true,
                textStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 10),
                margin: 20,
                getTitles: (double value) {
                  switch (value.toInt()) {
                    case 0:
                      return widget.chartData.labels[0];
                    case 1:
                      return widget.chartData.labels[1];
                    case 2:
                      return widget.chartData.labels[2];
                    case 3:
                      return widget.chartData.labels[3];
                    case 4:
                      return widget.chartData.labels[4];
                    case 5:
                      return widget.chartData.labels[5];
                    default:
                      return '';
                  }
                },
              ),
              leftTitles: const SideTitles(showTitles: false),
            ),
            borderData: FlBorderData(
              show: false,
            ),
            barGroups: getBarChartData(widget.chartData.data),
          ),
        ),
      ),
    );
  }
}
