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
  const ShoppingBagScreen({super.key});

  @override
  _ShoppingBagState createState() => _ShoppingBagState();
}

class _ShoppingBagState extends State<ShoppingBagScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1E1E1E),
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
                    child: // Column para colocar o gráfico na linha seguinte ao card:
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
                                    "June, 2025",
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

                        const SizedBox(height: 10),

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
                                          fontSize: 13,
                                          color: Global.mint,
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
                                    FlSpot(0, 1400),
                                    FlSpot(1, 1200),
                                    FlSpot(2, 1345),
                                    FlSpot(3, 1100),
                                    FlSpot(4, 1500),
                                    FlSpot(5, 1300),
                                  ],
                                  isCurved: true,
                                  color: Global.mint,
                                  barWidth: 3,
                                  // Mostra o dot apenas no terceiro ponto
                                  dotData: FlDotData(
                                    show: true,
                                    checkToShowDot: (spot, barData) =>
                                        spot.x == 2,
                                    getDotPainter:
                                        (spot, percent, barData, index) =>
                                            FlDotCirclePainter(
                                              radius: 6,
                                              color: Global.mint,
                                              strokeWidth: 0,
                                            ),
                                  ),
                                  showingIndicators: [
                                    2,
                                  ], // Mostra o popup do terceiro ponto (índice 2)
                                  // Adiciona linhas verticais tracejadas do eixo até cada ponto
                                  belowBarData: BarAreaData(
                                    show: true,
                                    spotsLine: BarAreaSpotsLine(
                                      show: true,
                                      flLineStyle: FlLine(
                                        color: Global.mint.withOpacity(0.5),
                                        strokeWidth: 2,
                                        dashArray: [6, 6],
                                      ),
                                      checkToShowSpotLine: (spot) =>
                                          true, // linha tracejada para todos os pontos
                                    ),
                                    gradient: LinearGradient(
                                      colors: [
                                        Colors.transparent,
                                        Colors.transparent,
                                      ],
                                    ),
                                  ),
                                ),
                              ],

                              lineTouchData: LineTouchData(
                                enabled: true,
                                getTouchedSpotIndicator:
                                    (barData, spotIndexes) => spotIndexes.map((
                                      index,
                                    ) {
                                      // Retorna apenas o dot, sem linha vertical
                                      return TouchedSpotIndicatorData(
                                        FlLine(
                                          color: Colors.transparent,
                                          strokeWidth: 0,
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

                        const SizedBox(height: 10),

                        // Histórico de transações
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            decoration: const BoxDecoration(
                              color: Color(0xFF252626),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(25),
                                topRight: Radius.circular(25),
                                bottomLeft: Radius.circular(25),
                                bottomRight: Radius.circular(25),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                top: 8.0,
                                left: 12.0,
                                right: 12.0,
                              ),
                              child: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    const SizedBox(height: 15),

                                    Text(
                                      'June 15, 2025',
                                      style: Global.semiboldLengthHealdine
                                          .copyWith(color: Colors.white),
                                    ),

                                    const SizedBox(height: 15),

                                    _buildTransitionsBox(
                                      "webflow.png",
                                      "Webflow",
                                      "Outcoming transfer",
                                      "- \$45",
                                      removeLeftMargin: false,
                                      removeRightMargin: false,
                                    ),
                                    _buildTransitionsBox(
                                      "sketch.png",
                                      "Sketch",
                                      "Annual withdrawal of funds",
                                      "- \$79",
                                      removeLeftMargin: false,
                                      removeRightMargin: false,
                                    ),
                                    _buildTransitionsBox(
                                      "youtube.png",
                                      "YouTube",
                                      "Annual withdrawal of funds",
                                      "- \$15",
                                      removeLeftMargin: false,
                                      removeRightMargin: false,
                                    ),
                                    _buildTransitionsBox(
                                      "unsplash.png",
                                      "Unsplash",
                                      "Outcoming transfer",
                                      "- \$9",
                                      removeLeftMargin: false,
                                      removeRightMargin: false,
                                    ),

                                    _buildTransitionsBox(
                                      "spotify.webp",
                                      "Spotify",
                                      "Annual withdrawal of funds",
                                      "- \$11",
                                      removeLeftMargin: false,
                                      removeRightMargin: false,
                                    ),
                                  ],
                                ),
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

  // Funcao para criar cada item de transação
  Widget _buildTransitionsBox(
    String image,
    String title,
    String subtitle,
    String price, {
    bool removeLeftMargin = false,
    bool removeRightMargin = false,
  }) {
    EdgeInsets margin;
    if (removeLeftMargin) {
      margin = const EdgeInsets.only(right: 8);
    } else if (removeRightMargin) {
      margin = const EdgeInsets.only(left: 8);
    } else {
      margin = const EdgeInsets.symmetric(horizontal: 8);
    }

    return Container(
      height: 60, // 🔹 controla a altura do container
      margin: margin,
      padding: const EdgeInsets.all(0),
      decoration: BoxDecoration(color: Colors.transparent),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Coluna 1: circle avatar
          SizedBox(
            width: 32,
            height: 32,
            child: CircleAvatar(
              radius: 16, // metade de 32
              backgroundColor: Colors.white, // cor de fundo
              backgroundImage: AssetImage("assets/$image"),
            ),
          ),

          const SizedBox(width: 12),

          // Coluna 2: título e subtítulo
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: Global.mediumLengthBody.copyWith(color: Colors.white),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: Global.regularCaption.copyWith(color: Global.gray3),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),

          const SizedBox(width: 12),

          // Coluna 3: preço
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                price,
                style: Global.mediumLengthBody.copyWith(color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
