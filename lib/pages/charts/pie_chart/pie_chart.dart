import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import './pie_chart_data.dart';
import '../../../model/chart/chart_data.dart';
import 'package:first_app/pages/charts/pie_chart/indicator_column.dart';

class CustomPieChart extends StatefulWidget {
  final ChartData chartData;

  CustomPieChart({@required this.chartData});

  @override
  State<StatefulWidget> createState() => CustomPieChartState();
}

class CustomPieChartState extends State<CustomPieChart> {
  int touchedIndex;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.8,
      child: Card(
        color: Colors.grey[100],
        child: Row(
          children: <Widget>[
            const SizedBox(
              height: 18,
            ),
            Expanded(
              child: AspectRatio(
                aspectRatio: 1,
                child: PieChart(
                  PieChartData(
                    pieTouchData: PieTouchData(touchCallback: (pieTouchResponse) {
                      setState(() {
                        if (pieTouchResponse.touchInput is FlLongPressEnd || pieTouchResponse.touchInput is FlPanEnd) {
                          touchedIndex = -1;
                        } else {
                          touchedIndex = pieTouchResponse.touchedSectionIndex;
                        }
                      });
                    }),
                    borderData: FlBorderData(
                      show: false,
                    ),
                    sectionsSpace: 0,
                    centerSpaceRadius: 40,
                    sections: showingSections(touchedIndex, widget.chartData),
                  ),
                ),
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: indicatorColumn(widget.chartData),
            ),
            const SizedBox(
              width: 28,
            ),
          ],
        ),
      ),
    );
  }
}
