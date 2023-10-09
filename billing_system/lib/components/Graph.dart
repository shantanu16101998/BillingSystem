import 'package:billing_system/Configs/Constants.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';



class Graph extends StatelessWidget {
  const Graph({super.key});

  @override
  Widget build(BuildContext context) {

    final List<String> monthsText = ['Jan','Feb','Mar'];
    return LineChart(

      LineChartData(

        gridData: FlGridData(show: false),
        titlesData: FlTitlesData(
          show: true, // Show title data
          leftTitles: SideTitles(
            showTitles: true,
            getTitles: (value) {
              // Customize the bottom titles using your own text
             return value.toInt().toString();
            },
          ),
          bottomTitles: SideTitles(
            showTitles: true,
            getTitles: (value) {
              // Customize the bottom titles using your own text
              if (value == 0 || value == 1 || value == 2) {
                return monthsText[value.toInt()];
              }
              return '';
            },
          ),
          topTitles: SideTitles(showTitles: false), // Hide top titles
          rightTitles: SideTitles(showTitles: false), // Hide right titles
        ),
        borderData: FlBorderData(
          show: true, // Show chart border
          border: const Border(
            left: BorderSide(color: Colors.black, width: 1), // Customize left border
            bottom: BorderSide(color: Colors.black, width: 1), // Customize bottom border
          ),
        ),
        minX: -0.2,
        maxX: 2.2,
        minY: 5,
        maxY: 75,
        lineBarsData: [
          LineChartBarData(
            spots: [
              FlSpot(0, 50),
              FlSpot(1, 20),
              FlSpot(2, 60),
            ],
            isCurved: false,
            colors: [Colors.black],
            dotData: FlDotData(show: true),
            belowBarData: BarAreaData(show: true, colors: [figmaCyan.withOpacity(0.2)]),

          ),
        ],
      ),
    );
  }
}

