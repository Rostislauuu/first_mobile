import 'package:flutter/material.dart';

import 'package:first_app/model/chart/chart_data.dart';
import 'package:first_app/pages/charts/indicator.dart';
import 'convert_num_from_rgb.dart';

List<Indicator> indicatorColumn(ChartData chartData) {
  final List<Indicator> finalIndicators = [];

  dynamic rgb = convertRGBToNum(chartData.backgroundColor);
  dynamic convertedToColor = rgb.map((color) => Color.fromRGBO(color[0], color[1], color[2], 1)).toList();

  chartData.data.asMap().forEach(
    (index, value) {
      finalIndicators.add(
        Indicator(
          textColor: Colors.grey[600],
          color: convertedToColor[index],
          text: chartData.labels[index],
          size: 12,
          isSquare: true,
        ),
      );
    },
  );

  return finalIndicators;
}
