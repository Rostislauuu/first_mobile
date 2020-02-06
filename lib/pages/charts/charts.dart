import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

import 'package:first_app/pages/charts/pie_chart/pie_chart.dart';
import '../../model/chart/chart_data.dart';
import 'package:first_app/nav_bar/nav_bar.dart';

class Charts extends StatefulWidget {
  @override
  _ChartsState createState() => _ChartsState();
}

class _ChartsState extends State<Charts> {
  ChartData chartData;

  Future<ChartData> fetchChartData() async {
    String _chartDataAPI = 'https://test-api-vakoms.herokuapp.com/charts/data';
    Response _response;
    Dio _dio = new Dio();

    try {
      _response = await _dio.get(_chartDataAPI);
      ChartData finalChartData = ChartData.fromJson(_response.data);

      return finalChartData;
    } catch (e) {
      throw Exception(e);
    }
  }

  void initChartData() async {
    ChartData fetchedData = await fetchChartData();

    setState(() {
      chartData = fetchedData;
    });
  }

  @override
  void initState() {
    super.initState();

    initChartData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[400],
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Charts',
          style: TextStyle(
            fontFamily: 'Inconsolata',
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            NavBar(),
            Container(
              child: chartData != null
                  ? CustomPieChart(
                      chartData: chartData,
                    )
                  : CircularProgressIndicator(),
            ),
          ],
        ),
      ),
    );
  }
}
