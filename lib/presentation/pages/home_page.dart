import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:kantongku/common/gap.dart';
import 'package:kantongku/style/color.dart';
import 'package:kantongku/style/typography.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static const routeName = '/home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isHidden = true;
  bool _isMore = false;
  final List widgetIcons = const [
    Icons.send,
    Icons.move_to_inbox_outlined,
    Icons.outbox_outlined,
    Icons.shopping_basket_outlined,
  ];
  final List widgetTitles = const [
    'Send',
    'Receive',
    'Top Up',
    'Buy',
  ];
  final List timeTitle = const [
    'Day',
    'Week',
    'Month',
    'All',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: SingleChildScrollView(
          child: Column(
            children: [
              profileSection(),
              const VerticalGap20(),
              balanceSection(context),
              const VerticalGap10(),
              paymentSection(context),
              const VerticalGap10(),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: secondaryColor,
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: LineChart(
                  LineChartData(
                    gridData: FlGridData(show: false),
                    borderData: FlBorderData(show: false),
                    titlesData: FlTitlesData(
                      show: true,
                      rightTitles: AxisTitles(),
                      leftTitles: AxisTitles(),
                      topTitles: AxisTitles(
                        axisNameSize: 40,
                        axisNameWidget: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            crossAxisSpacing: 4,
                          ),
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          itemCount: 4,
                          itemBuilder: (context, index) {
                            return Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: primaryColor,
                                ),
                                borderRadius: BorderRadius.circular(10),
                                color: secondaryColor,
                              ),
                              child: Center(
                                child: Text(
                                  timeTitle[index],
                                  style: poppinsCaption.copyWith(
                                    color: textColor,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      bottomTitles: AxisTitles(
                          axisNameSize: 60,
                          axisNameWidget: Text(
                            'Month',
                            style: poppinsCaption.copyWith(
                              color: textColor,
                            ),
                          ),
                          sideTitles: SideTitles(
                            showTitles: true,
                            getTitlesWidget: (value, meta) {
                              return Text(
                                '${value.toInt()}',
                                style: poppinsCaption.copyWith(
                                  color: textColor,
                                ),
                              );
                            },
                          )),
                    ),
                    lineBarsData: [
                      LineChartBarData(
                        spots: [
                          const FlSpot(0, 1),
                          const FlSpot(1, 1.5),
                          const FlSpot(2, 1.4),
                          const FlSpot(3, 3.4),
                          const FlSpot(4, 2),
                          const FlSpot(5, 2.2),
                          const FlSpot(6, 1.8),
                        ],
                        color: buttonColor,
                        isCurved: true,
                        barWidth: 2,
                        dotData: FlDotData(
                          show: false,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container paymentSection(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: secondaryColor,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
        ),
        itemCount: 4,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {},
            splashColor: buttonColor,
            highlightColor: buttonColor,
            focusColor: buttonColor,
            child: Column(
              children: [
                Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: primaryColor,
                  ),
                  child: Icon(
                    widgetIcons[index],
                    color: textColor,
                  ),
                ),
                const VerticalGap5(),
                Expanded(
                  child: Text(
                    widgetTitles[index],
                    style: poppinsCaption.copyWith(
                      color: textColor.withOpacity(.75),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
        shrinkWrap: true,
        padding: EdgeInsets.zero,
      ),
    );
  }

  Container balanceSection(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: secondaryColor,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total Balance',
                style: poppinsBody2.copyWith(
                  color: textColor.withOpacity(.75),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    _isMore = !_isMore;
                  });
                },
                child: Icon(
                  Icons.info_outline_rounded,
                  color: textColor.withOpacity(.75),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                _isHidden ? 'Rp 1.000.000' : '---------',
                style: poppinsH1.copyWith(
                  color: buttonColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const HorizontalGap5(),
              InkWell(
                onTap: () {
                  setState(() {
                    _isHidden = !_isHidden;
                  });
                },
                child: Icon(
                  _isHidden
                      ? Icons.visibility_rounded
                      : Icons.visibility_off_rounded,
                  color: textColor.withOpacity(.75),
                  size: 20,
                ),
              ),
            ],
          ),
          AnimatedCrossFade(
            duration: const Duration(milliseconds: 300),
            crossFadeState:
                _isMore ? CrossFadeState.showFirst : CrossFadeState.showSecond,
            firstChild: const SizedBox(),
            secondChild: Column(
              children: [
                const VerticalGap10(),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 2,
                  color: textColor.withOpacity(.25),
                ),
                const VerticalGap10(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Investation (0,00%)',
                      style: poppinsH5.copyWith(
                        color: textColor.withOpacity(.75),
                      ),
                    ),
                    Text(
                      'Rp 0',
                      style: poppinsH5.copyWith(
                        color: textColor.withOpacity(.75),
                      ),
                    ),
                  ],
                ),
                const VerticalGap5(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.network(
                          'https://miro.medium.com/v2/resize:fit:2400/2*SIQCyWMSMRv5HkHdu5uuuw.png',
                          fit: BoxFit.cover,
                          width: 24,
                        ),
                        const HorizontalGap5(),
                        Text(
                          'Reksa Dana Bibit',
                          style: poppinsBody2.copyWith(
                            color: textColor.withOpacity(.75),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      'Rp 0',
                      style: poppinsBody2.copyWith(
                        color: textColor.withOpacity(.75),
                      ),
                    ),
                  ],
                ),
                const VerticalGap10(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Cash Money (100,00%)',
                      style: poppinsH5.copyWith(
                        color: textColor.withOpacity(.75),
                      ),
                    ),
                    Text(
                      'Rp 1.000.000',
                      style: poppinsH5.copyWith(
                        color: textColor.withOpacity(.75),
                      ),
                    ),
                  ],
                ),
                const VerticalGap5(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            color: Colors.white,
                            image: const DecorationImage(
                              image: NetworkImage(
                                  'https://cdn.dribbble.com/users/5534/screenshots/14230133/media/e2f853f8232acad78bf143c32f2f3a04.jpg?compress=1&resize=400x300'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const HorizontalGap5(),
                        Text(
                          'Saving Pocket',
                          style: poppinsBody2.copyWith(
                            color: textColor.withOpacity(.75),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      'Rp 0',
                      style: poppinsBody2.copyWith(
                        color: textColor.withOpacity(.75),
                      ),
                    ),
                  ],
                ),
                const VerticalGap5(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            color: Colors.white,
                            image: const DecorationImage(
                              image: NetworkImage(
                                  'https://cdn.dribbble.com/users/5534/screenshots/14230133/media/e2f853f8232acad78bf143c32f2f3a04.jpg?compress=1&resize=400x300'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const HorizontalGap5(),
                        Text(
                          'Payment Pocket',
                          style: poppinsBody2.copyWith(
                            color: textColor.withOpacity(.75),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      'Rp 1.000.000',
                      style: poppinsBody2.copyWith(
                        color: textColor.withOpacity(.75),
                      ),
                    ),
                  ],
                ),
                const VerticalGap5(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            color: Colors.white,
                            image: const DecorationImage(
                              image: NetworkImage(
                                  'https://scontent.fbdo9-1.fna.fbcdn.net/v/t1.6435-9/67402409_882353138799413_6733595150519369728_n.jpg?_nc_cat=1&ccb=1-7&_nc_sid=09cbfe&_nc_eui2=AeGvFVfdmZCXp8wLV4ZVnV4WQK28YY67ToZArbxhjrtOhuuBcL1zRHFxj3AsNB6sJgKSBXKNyOQkO7JoZa8q1YFl&_nc_ohc=RPinnsimenYAX_lUTM4&_nc_ht=scontent.fbdo9-1.fna&oh=00_AfAxmgUBSn3k1YeCuZQNS5S35KegBav766vJrkqP1DQGZg&oe=64A95520'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const HorizontalGap5(),
                        Text(
                          'Gopay',
                          style: poppinsBody2.copyWith(
                            color: textColor.withOpacity(.75),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      'Rp 0',
                      style: poppinsBody2.copyWith(
                        color: textColor.withOpacity(.75),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Row profileSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Good Evening!',
              style: poppinsBody2.copyWith(
                color: textColor.withOpacity(.75),
              ),
            ),
            Text(
              'Listyo Adi Pamungkas🎆',
              style: poppinsBody1.copyWith(
                color: textColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        InkWell(
          onTap: () {},
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              color: Colors.white,
              image: const DecorationImage(
                image: NetworkImage(
                    'https://cdn.dribbble.com/users/5534/screenshots/14230133/media/e2f853f8232acad78bf143c32f2f3a04.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            padding: const EdgeInsets.all(8),
          ),
        ),
      ],
    );
  }
}
