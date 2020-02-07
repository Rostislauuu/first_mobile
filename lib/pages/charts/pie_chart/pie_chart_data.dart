import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../model/chart/chart_data.dart';
import '../functions/convert_num_from_rgb.dart';

List<PieChartSectionData> showingSections(int touchedIndex, ChartData chartData) {
  final List<PieChartSectionData> finalSectionData = [];

  List<List<int>> rgb = convertRGBToNum(chartData.backgroundColor);
  List<Color> convertedToColor = rgb.map((color) => Color.fromRGBO(color[0], color[1], color[2], 1)).toList();

  chartData.data.asMap().forEach(
    (index, value) {
      final isTouched = index == touchedIndex;
      final double fontSize = isTouched ? 25 : 16;
      final double radius = isTouched ? 60 : 50;
      finalSectionData.add(
        PieChartSectionData(
          color: convertedToColor[index],
          value: chartData.data[index].toDouble(),
          title: '${chartData.data[index]}',
          radius: radius,
          titleStyle: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            color: const Color(0xffffffff),
          ),
        ),
      );
    },
  );

  return finalSectionData;
}
