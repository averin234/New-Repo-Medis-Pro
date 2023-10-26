import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:medispro/app/endpoint/data/publics.dart';

import '../../../generated/assets.dart';
import '../../endpoint/data/data_respons/data_hutang_chart.dart';
import '../../endpoint/data/fetch_data.dart';
import '../../modules/home/controllers/home_controller.dart';
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
        image: DecorationImage(
          image: AssetImage(Assets.imagesGroup),
          fit: BoxFit.cover,
        ),
        color: Colors.grey.shade200,
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
            Text('Data Hutang 3 Bulan Terakhir', style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(
              height: 10,
            ),
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
            centerSpaceRadius: 40,
            sections: showingSections(),
          ),
        ),
      ),
        ),
            SizedBox(
              height: 18,
            ),
        Container(
          decoration: BoxDecoration(
            color:  Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
            child: Column(
              children: [
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
            FutureBuilder<data_hutang_chart>(
              future: API.data_chart,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  if (snapshot.data != null) {
                    final hutang = snapshot.data!.hutang; // Ambil data hutang dari objek respons.
                    final bayar = snapshot.data!.bayar; // Ambil data bayar dari objek respons.
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Rp. $hutang', style: TextStyle(color: Colors.green),),
                        SizedBox(
                          width: 40,
                        ),
                        Text('Rp. $bayar', style: TextStyle(color: Colors.green),),
                      ],
                    );
                  } else {
                    return Text('Tidak ada data');
                       }
                     }
                    },
                  ),
                SizedBox(
                  height: 10,
                ),
                ]
              )
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