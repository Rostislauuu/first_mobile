import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

List<BarChartGroupData> getBarChartData(data) {
  List<BarChartGroupData> finalData = List<BarChartGroupData>.from(data.map((item) => BarChartGroupData(
      x: 0, barRods: [BarChartRodData(y: item.toDouble(), color: Colors.white)], showingTooltipIndicators: [0])));

  return finalData;
}
