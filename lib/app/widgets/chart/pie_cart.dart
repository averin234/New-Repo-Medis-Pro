import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../generated/assets.dart';
import '../../endpoint/data/data_respons/data_hutang_chart.dart';
import '../../endpoint/data/fetch_data.dart';
import '../color/appcolor.dart';
import 'indikator.dart';

class PieChartSample2 extends StatefulWidget {
  const PieChartSample2({super.key});

  @override
  State<StatefulWidget> createState() => PieChart2State();
}

class PieChart2State extends State {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
      padding: const EdgeInsets.all(10),
      height: 320,
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: AssetImage(Assets.imagesGroup),
          fit: BoxFit.cover,
        ),
        color: Colors.grey.shade200,
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            spreadRadius: 5,
            blurRadius: 70,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: AspectRatio(
        aspectRatio: 1.5,
        child: Column(children: [
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Data Hutang 3 Bulan Terakhir',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Expanded(
            child: AspectRatio(
              aspectRatio: 1,
              child: Chartz(),
            ),
          ),
          const SizedBox(
            height: 18,
          ),
          Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(children: [
                const Row(
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
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.only(left: 10),
                              padding: const EdgeInsets.only(
                                  left: 20, right: 20, top: 5, bottom: 5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: AppColors.shammerColor,
                              ),
                              child: const Center(
                                child: Text('',
                                    style: TextStyle(color: Colors.white)),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 40,
                          ),
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.only(right: 10),
                              padding: const EdgeInsets.only(
                                  left: 20, right: 20, top: 5, bottom: 5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: AppColors.shammerColor,
                              ),
                              child: const Center(
                                child: Text('',
                                    style: TextStyle(color: Colors.white)),
                              ),
                            ),
                          ),
                        ],
                      );
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      if (snapshot.data != null) {
                        final hutang = snapshot.data!
                            .hutang; // Ambil data hutang dari objek respons.
                        final bayar = snapshot.data!
                            .bayar; // Ambil data bayar dari objek respons.
                        return Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Rp. $hutang' ',00',
                              style: const TextStyle(color: Colors.green),
                            ),
                            const SizedBox(
                              width: 40,
                            ),
                            Text(
                              'Rp. $bayar' ',00',
                              style: const TextStyle(color: Colors.green),
                            ),
                          ],
                        );
                      } else {
                        return const Text('Tidak ada data');
                      }
                    }
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
              ])),
        ]),
      ),
    );
  }
}

class Chartz extends StatefulWidget {
  const Chartz({super.key});

  @override
  State<Chartz> createState() => _ChartzState();
}

class _ChartzState extends State<Chartz> {
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: API.data_chart,
        builder: (context, snapshot) {
          if (snapshot.hasData &&
              snapshot.connectionState != ConnectionState.waiting &&
              snapshot.data != null) {
            final data = snapshot.data!;
            return PieChart(
              PieChartData(
                pieTouchData: PieTouchData(),
                borderData: FlBorderData(
                  show: false,
                ),
                sectionsSpace: 5,
                centerSpaceRadius: 40,
                sections: showingSections(data),
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }

  List<PieChartSectionData> showingSections(data_hutang_chart data) {
    final bayar = double.parse((data.bayar ?? '').split('.').join());
    final hutang = double.parse((data.hutang ?? '').split('.').join());
    return List.generate(2, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 60.0 : 50.0;
      const shadows = [Shadow(color: Colors.black, blurRadius: 2)];
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: AppColors.contentColorBlue,
            value: hutang,
            title: "${((hutang / (hutang + bayar)) * 100).toStringAsFixed(2)}%",
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
            value: bayar,
            title: "${((bayar / (hutang + bayar)) * 100).toStringAsFixed(2)}%",
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
