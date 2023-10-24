import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../color/appcolor.dart';
import 'indikator.dart';

class PieChartSample2 extends StatefulWidget {
  const PieChartSample2({super.key});

  @override
  State<StatefulWidget> createState() => PieChart2State();
}

class PieChart2State extends State {
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(left: 20, right: 20, top: 20),
      padding: EdgeInsets.all(10),
      height: 320,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10)
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            spreadRadius: 5,
            blurRadius: 70,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
        child: AspectRatio(
      aspectRatio: 1.5,
      child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Text('Data Hutang 3 Bulan Terakhir'),
      Expanded(
      child: AspectRatio(
      aspectRatio: 1,
        child: PieChart(
          PieChartData(
            pieTouchData: PieTouchData(
              touchCallback: (FlTouchEvent event, pieTouchResponse) {
                setState(() {
                  if (!event.isInterestedForInteractions ||
                      pieTouchResponse == null ||
                      pieTouchResponse.touchedSection == null) {
                    touchedIndex = -1;
                    return;
                  }
                  touchedIndex = pieTouchResponse
                      .touchedSection!.touchedSectionIndex;
                });
              },
            ),
            borderData: FlBorderData(
              show: false,
            ),
            sectionsSpace: 5,
            centerSpaceRadius: 20,
            sections: showingSections(),
          ),
        ),
      ),
        ),
            SizedBox(
              height: 18,
            ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Indicator(
              color: AppColors.contentColorBlue,
              text: 'Jumlah Hutang',
              isSquare: true,
            ),
            SizedBox(
              width: 20,
            ),
            Indicator(
              color: AppColors.contentColorYellow,
              text: 'Jumlah Sudah Dibayar',
              isSquare: true,
            ),
            SizedBox(
              height: 40,
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('0'),
                SizedBox(
                  width: 130,
                ),
                Text('0'),
                SizedBox(
                  height: 40,
                ),
              ],
            ),
          ]
        ),
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(2, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 60.0 : 50.0;
      const shadows = [Shadow(color: Colors.black, blurRadius: 2)];
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: AppColors.contentColorBlue,
            value: 40,
            title: '40%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: AppColors.mainTextColor1,
              shadows: shadows,
            ),
          );
        case 1:
          return PieChartSectionData(
            color: AppColors.contentColorYellow,
            value: 30,
            title: '30%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: AppColors.mainTextColor1,
              shadows: shadows,
            ),
          );
        default:
          throw Error();
      }
    });
  }
}