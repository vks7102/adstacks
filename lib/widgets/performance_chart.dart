import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../utils/responsive.dart';

class PerformanceChart extends StatelessWidget {
  const PerformanceChart({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return Container(
      height: isMobile ? 300 : 400,
      padding: EdgeInsets.all(isMobile ? 16 : 24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(28),
        border: Border.all(
          color: Colors.grey.shade200,
        ),
      ),
      child: Column(
        children: [
          /// Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Over All Performance\nThe Years",
                style: TextStyle(
                  fontSize: isMobile ? 20 : 28,
                  fontWeight: FontWeight.bold,
                  height: 1.3,
                ),
              ),
              if (!isMobile)
                Row(
                  children: [
                    _legend(
                      const Color(0xFFE6A5B3),
                      "Pending\nDone",
                    ),
                    const SizedBox(width: 30),
                    _legend(
                      const Color(0xFF4C3CC9),
                      "Project\nDone",
                    ),
                  ],
                ),
            ],
          ),

          const SizedBox(height: 20),

          /// Chart
          Expanded(
            child: LineChart(
              LineChartData(
                minX: 0,
                maxX: 5,
                minY: 0,
                maxY: 50,

                gridData: FlGridData(
                  show: true,
                  drawVerticalLine: false,
                  horizontalInterval: 10,
                  getDrawingHorizontalLine: (value) {
                    return FlLine(
                      color: Colors.grey.shade200,
                      strokeWidth: 1,
                    );
                  },
                ),

                borderData: FlBorderData(
                  show: true,
                  border: Border(
                    left: BorderSide(
                      color: Colors.grey.shade300,
                    ),
                    bottom: BorderSide(
                      color: Colors.grey.shade300,
                    ),
                  ),
                ),

                titlesData: FlTitlesData(
                  topTitles: const AxisTitles(),
                  rightTitles: const AxisTitles(),

                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      interval: 10,
                      reservedSize: 35,
                    ),
                  ),

                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 40,
                      interval: 1,
                      getTitlesWidget: (value, meta) {
                        const years = [
                          '2021',
                          '2022',
                          '2023',
                          '2024',
                          '2025',
                          '2026'
                        ];

                        return Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text(
                            years[value.toInt()],
                            style: TextStyle(
                              fontSize: isMobile ? 11 : 14,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),

                lineTouchData: LineTouchData(
                  touchTooltipData: LineTouchTooltipData(
                    getTooltipItems: (touchedSpots) {
                      const years = [
                        '2021', '2022', '2023',
                        '2024', '2025', '2026'
                      ];
                      return touchedSpots.map((spot) {
                        final year = years[spot.x.toInt()];
                        return LineTooltipItem(
                          '$year: ${spot.y.toInt()}',
                          const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 13,
                          ),
                        );
                      }).toList();
                    },
                  ),
                ),

                lineBarsData: [
                  /// Pink Line
                  LineChartBarData(
                    isCurved: true,
                    color: const Color(0xFFE6A5B3),
                    barWidth: 4,
                    dotData: const FlDotData(show: false),
                    spots: const [
                      FlSpot(0, 32),
                      FlSpot(1, 18),
                      FlSpot(2, 14),
                      FlSpot(3, 42),
                      FlSpot(4, 10),
                      FlSpot(5, 48),
                    ],
                  ),

                  /// Purple Line
                  LineChartBarData(
                    isCurved: true,
                    color: const Color(0xFF4C3CC9),
                    barWidth: 5,
                    dotData: const FlDotData(show: false),

                    belowBarData: BarAreaData(
                      show: true,
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          const Color(0xFF4C3CC9).withOpacity(.25),
                          const Color(0xFF4C3CC9).withOpacity(.02),
                        ],
                      ),
                    ),

                    spots: const [
                      FlSpot(0, 23),
                      FlSpot(1, 18),
                      FlSpot(2, 25),
                      FlSpot(3, 44),
                      FlSpot(4, 15),
                      FlSpot(5, 39),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _legend(Color color, String title) {
    return Row(
      children: [
        CircleAvatar(
          radius: 6,
          backgroundColor: color,
        ),
        const SizedBox(width: 8),
        Text(
          title,
          style: TextStyle(
            color: Colors.grey.shade600,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
