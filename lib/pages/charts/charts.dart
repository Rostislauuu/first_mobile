import 'package:first_app/pages/charts/bar_chart/custom_bar_chart.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

import 'package:first_app/pages/charts/pie_chart/custom_pie_chart.dart';
import '../../model/chart/chart_data.dart';

class Charts extends StatefulWidget {
  @override
  _ChartsState createState() => _ChartsState();
}

class _ChartsState extends State<Charts> {
  ChartData chartData;
  int _selectedIndex = 0;

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

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
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
      body: chartData == null
          ? Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.white,
              ),
            )
          : Center(
              child: [
                CustomPieChart(
                  chartData: chartData,
                ),
                CustomBarChart(
                  chartData: chartData,
                )
              ].elementAt(_selectedIndex),
            ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.pie_chart,
            ),
            title: Text('Pie Chart'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.insert_chart,
            ),
            title: Text('Bar Chart'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue[800],
        onTap: _onItemTapped,
        iconSize: 35,
      ),
    );
  }
}
