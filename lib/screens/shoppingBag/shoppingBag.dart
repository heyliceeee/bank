import 'package:bank/components/navbar.dart';
import 'package:bank/components/topbarMyBudget.dart';
import 'package:bank/global.dart';
import 'package:bank/screens/bankCard/bankCard.dart';
import 'package:bank/screens/home/home.dart';
import 'package:bank/screens/message/message.dart';
import 'package:bank/screens/time/time.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class ShoppingBagScreen extends StatefulWidget {
  const ShoppingBagScreen({Key? key}) : super(key: key);

  @override
  _ShoppingBagState createState() => _ShoppingBagState();
}

class _ShoppingBagState extends State<ShoppingBagScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent, // 🔹 transparente
      extendBody: true, // 🔹 deixa o body “passar” por baixo do navbar
      body: Container(
        decoration: const BoxDecoration(gradient: Global.gray1),
        child: SafeArea(
          child: Column(
            children: [
              const TopbarMyBudget(),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: // Substitua o Row por uma Column para colocar o gráfico na linha seguinte ao card:
                    Column(
                      children: [
                        // Card de orçamento
                        Container(
                          height: 88,
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Color(0xFF212121),
                            borderRadius: BorderRadius.circular(25),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.2),
                                spreadRadius: 0,
                                blurRadius: 8,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Coluna 1: alinhado à esquerda
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "\$ 1,345",
                                    style: Global.semiboldLengthHealdine
                                        .copyWith(color: Colors.white),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    "September forecast \$2,010",
                                    style: Global.regular1Caption.copyWith(
                                      color: Colors.white,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                              // Coluna 2: alinhado à direita, centralizado verticalmente
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "June, 2020",
                                    style: Global.regular1Caption.copyWith(
                                      color: Colors.white,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 2),

                        // Gráfico de linhas
                        Container(
                          height: 245,
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          child: LineChart(
                            LineChartData(
                              gridData: FlGridData(show: false),
                              titlesData: FlTitlesData(
                                bottomTitles: AxisTitles(
                                  sideTitles: SideTitles(
                                    showTitles: true,
                                    reservedSize: 28,
                                    getTitlesWidget: (value, meta) {
                                      // Assumindo que value vai de 0 a 4 (Janeiro a Maio)
                                      const months = [
                                        'Apr',
                                        'May',
                                        'Jun',
                                        'Jul',
                                        'Aug',
                                        'Sep',
                                      ];
                                      String text = '';
                                      if (value >= 0 && value < months.length) {
                                        text = months[value.toInt()];
                                      }
                                      return Text(
                                        text,
                                        style: Global.regular1Caption.copyWith(
                                          color: Colors.white,
                                        ),
                                      );
                                    },
                                    interval: 1,
                                  ),
                                ),
                                leftTitles: AxisTitles(
                                  sideTitles: SideTitles(showTitles: false),
                                ),
                                topTitles: AxisTitles(
                                  sideTitles: SideTitles(showTitles: false),
                                ),
                                rightTitles: AxisTitles(
                                  sideTitles: SideTitles(showTitles: false),
                                ),
                              ),
                              borderData: FlBorderData(show: false),
                              lineBarsData: [
                                LineChartBarData(
                                  spots: [
                                    FlSpot(0, 1600),
                                    FlSpot(1, 1800),
                                    FlSpot(2, 1345),
                                    FlSpot(3, 1900),
                                    FlSpot(4, 1700),
                                    FlSpot(5, 2000),
                                  ],
                                  isCurved: true,
                                  color: Global.mint,
                                  barWidth: 3,
                                  dotData: FlDotData(show: false),
                                  showingIndicators: [
                                    2,
                                  ], // Mostra o popup do terceiro ponto (índice 2)
                                ),
                              ],
                              lineTouchData: LineTouchData(
                                enabled: true,
                                getTouchedSpotIndicator:
                                    (barData, spotIndexes) =>
                                        spotIndexes.map((index) {
                                          return TouchedSpotIndicatorData(
                                            FlLine(
                                              color: Global.mint,
                                              strokeWidth: 2,
                                            ),
                                            FlDotData(show: true),
                                          );
                                        }).toList(),
                                touchTooltipData: LineTouchTooltipData(
                                  tooltipBgColor: Colors.black87,
                                  getTooltipItems: (touchedSpots) {
                                    return touchedSpots.map((touchedSpot) {
                                      return LineTooltipItem(
                                        '${touchedSpot.y.toInt()}',
                                        const TextStyle(color: Colors.white),
                                      );
                                    }).toList();
                                  },
                                ),
                                // Mostra o popup do FlSpot(2, 1345) por padrão
                                handleBuiltInTouches: false,
                                touchCallback: (event, response) {},
                                // Para mostrar o tooltip por padrão, use initialSelection
                                // (disponível nas versões recentes do fl_chart)
                                // initialSelection: const FlTouchInput(data: FlSpot(2, 1345)),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Navbar(
        currentIndex: 1,
        onTap: (index) {
          Widget page;
          switch (index) {
            case 0:
              page = HomeScreen();
              break;
            case 1:
              page = ShoppingBagScreen();
              break;
            case 2:
              page = BankCardScreen();
              break;
            case 3:
              page = MessageScreen();
              break;
            case 4:
              page = TimeScreen();
              break;
            default:
              page = ShoppingBagScreen();
          }
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => page),
          );
        },
      ),
    );
  }
}
