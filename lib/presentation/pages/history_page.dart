import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kantongku/common/gap.dart';
import 'package:kantongku/data/repository/repository.dart';
import 'package:kantongku/style/color.dart';
import 'package:kantongku/style/typography.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});
  static const routeName = '/history-page';

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            children: [
              headerSection(),
              const VerticalGap10(),
              transactionSection(),
            ],
          ),
        ),
      ),
    );
  }

  Expanded transactionSection() {
    return Expanded(
      child: FutureBuilder(
        future: Repository().getTransaction(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.separated(
              separatorBuilder: (context, index) => const VerticalGap10(),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final data = snapshot.data;
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: secondaryColor,
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Stack(
                            children: [
                              Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40),
                                  color: primaryColor,
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      data![index].photoUrl,
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: Container(
                                  width: 20,
                                  height: 20,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(40),
                                    color: data[index].status == true
                                        ? Colors.green
                                        : Colors.red,
                                  ),
                                  child: Icon(
                                    data[index].status == false
                                        ? Icons.arrow_upward_rounded
                                        : Icons.arrow_downward_rounded,
                                    color: textColor,
                                    size: 16,
                                  ),
                                ),
                              )
                            ],
                          ),
                          const HorizontalGap10(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                data[index].name,
                                style: poppinsBody1.copyWith(
                                  color: textColor,
                                ),
                              ),
                              Text(
                                '${data[index].dateTransfer}, ${data[index].timeTransfer}',
                                style: poppinsCaption.copyWith(
                                  color: textColor.withOpacity(.75),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            data[index].status == false
                                ? '- \$${data[index].totalMoney}'
                                : '+ \$${data[index].totalMoney}',
                            style: poppinsH3.copyWith(
                              color: data[index].status == false
                                  ? Colors.red
                                  : Colors.green,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Row headerSection() {
    return Row(
      children: [
        const Icon(
          Icons.history_edu_rounded,
          size: 28,
          color: textColor,
        ),
        const HorizontalGap5(),
        Text(
          'Transaction History',
          style: poppinsH1.copyWith(color: textColor),
        ),
      ],
    );
  }
}
