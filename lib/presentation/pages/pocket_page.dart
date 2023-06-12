import 'package:flutter/material.dart';
import 'package:kantongku/common/function/card_number_gap.dart';
import 'package:kantongku/common/gap.dart';
import 'package:kantongku/common/static.dart';
import 'package:kantongku/data/repository/repository.dart';
import 'package:kantongku/style/color.dart';
import 'package:kantongku/style/typography.dart';

class PocketPage extends StatefulWidget {
  const PocketPage({Key? key}) : super(key: key);
  static const routeName = '/pocket';

  @override
  State<PocketPage> createState() => _PocketPageState();
}

class _PocketPageState extends State<PocketPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                headerSection(),
                const VerticalGap10(),
                cardListSection(context),
                const VerticalGap10(),
                balanceSection(context),
                const VerticalGap10(),
                pocketSection(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container pocketSection(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 2,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: FutureBuilder(
        future: Repository().getPocket(),
        builder: (context, snapshot) {
          return GridView.builder(
            padding: const EdgeInsets.only(bottom: 24),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
            ),
            itemCount: snapshot.data?.length ?? 0,
            itemBuilder: (context, index) {
              final data = snapshot.data![index];
              return InkWell(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                    color: data.typePocket == 3
                        ? Colors.blue.shade800
                        : (data.typePocket == 2
                            ? Colors.green.shade700
                            : secondaryColor),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            color: data.typePocket == 3
                                ? Colors.blue.shade900
                                : (data.typePocket == 2
                                    ? Colors.green.shade900
                                    : primaryColor),
                          ),
                          padding: const EdgeInsets.all(8),
                          child: data.typePocket == 3 || data.typePocket == 2
                              ? Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(40),
                                      image: DecorationImage(
                                        image: data.typePocket == 3
                                            ? const AssetImage(
                                                'lib/assets/images/gopay.jpg')
                                            : const AssetImage(
                                                'lib/assets/images/bibit.jpg'),
                                        fit: BoxFit.cover,
                                      )),
                                )
                              : const Icon(
                                  Icons.account_balance_wallet_rounded,
                                  color: Colors.white,
                                  size: 40,
                                )),
                      const VerticalGap5(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            data.pocket,
                            style: poppinsBody2.copyWith(
                              color:
                                  data.typePocket == 3 || data.typePocket == 2
                                      ? Colors.white
                                      : textColor.withOpacity(.75),
                            ),
                          ),
                          Text(
                            '\$ ${data.totalMoney}',
                            style: poppinsH2.copyWith(
                              color:
                                  data.typePocket == 3 || data.typePocket == 2
                                      ? Colors.white
                                      : buttonColor,
                            ),
                          ),
                          Text(
                            data.typePocket == 3
                                ? 'Gopay'
                                : (data.typePocket == 2 ? 'Bibit' : 'Pocket'),
                            style: poppinsCaption.copyWith(
                              color: textColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  Container balanceSection(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: secondaryColor,
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Total Balance',
              style: poppinsBody2.copyWith(
                color: textColor.withOpacity(.75),
              ),
            ),
            const VerticalGap5(),
            Text(
              '\$ 590.00',
              style: poppinsH1.copyWith(color: buttonColor),
            ),
          ],
        ),
      ),
    );
  }

  SizedBox cardListSection(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 4.5,
      child: FutureBuilder(
        future: Repository().getCreditCard(),
        builder: (context, snapshot) {
          return ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) => const HorizontalGap10(),
            itemCount: snapshot.data?.length ?? 0,
            itemBuilder: (context, index) {
              final data = snapshot.data![index];
              String separatedNumber = separateNumber(data.cardNumber);
              String hiddenNumber = hideAndSeparateNumber(data.cardNumber);

              return InkWell(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16),
                      ),
                    ),
                    builder: (context) => Container(
                      height: MediaQuery.of(context).size.height / 2,
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                        color: secondaryColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width / 4,
                            height: 10,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(16),
                                bottomRight: Radius.circular(16),
                              ),
                              color: buttonColor,
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Cardholder Name',
                                  style:
                                      poppinsBody2.copyWith(color: textColor),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      data.name,
                                      style:
                                          poppinsH4.copyWith(color: textColor),
                                    ),
                                    InkWell(
                                      onTap: () {},
                                      child: const Icon(
                                        Icons.copy_all_rounded,
                                        color: textColor,
                                        size: 24,
                                      ),
                                    )
                                  ],
                                ),
                                Divider(
                                  color: textColor.withOpacity(0.5),
                                  thickness: 1,
                                ),
                                const VerticalGap5(),
                                Text(
                                  'Card Number',
                                  style:
                                      poppinsBody2.copyWith(color: textColor),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      separatedNumber,
                                      style:
                                          poppinsH4.copyWith(color: textColor),
                                    ),
                                    InkWell(
                                      onTap: () {},
                                      child: const Icon(
                                        Icons.copy_all_rounded,
                                        color: textColor,
                                        size: 24,
                                      ),
                                    )
                                  ],
                                ),
                                Divider(
                                  color: textColor.withOpacity(0.5),
                                  thickness: 1,
                                ),
                                const VerticalGap5(),
                                Text(
                                  'Expired Date',
                                  style:
                                      poppinsBody2.copyWith(color: textColor),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      data.expirationDate,
                                      style:
                                          poppinsH4.copyWith(color: textColor),
                                    ),
                                    InkWell(
                                      onTap: () {},
                                      child: const Icon(
                                        Icons.copy_all_rounded,
                                        color: textColor,
                                        size: 24,
                                      ),
                                    )
                                  ],
                                ),
                                Divider(
                                  color: textColor.withOpacity(0.5),
                                  thickness: 1,
                                ),
                                const VerticalGap5(),
                                Text(
                                  'CVV',
                                  style:
                                      poppinsBody2.copyWith(color: textColor),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      data.cv,
                                      style:
                                          poppinsH4.copyWith(color: textColor),
                                    ),
                                    InkWell(
                                      onTap: () {},
                                      child: const Icon(
                                        Icons.copy_all_rounded,
                                        color: textColor,
                                        size: 24,
                                      ),
                                    )
                                  ],
                                ),
                                Divider(
                                  color: textColor.withOpacity(0.5),
                                  thickness: 1,
                                ),
                                const VerticalGap5(),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                            child: InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: buttonColor,
                                ),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 8,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      Icons.close_rounded,
                                      color: text2Color,
                                    ),
                                    Text(
                                      'Close',
                                      style: poppinsBody1,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
                child: Container(
                  width: MediaQuery.of(context).size.width / 1.25,
                  height: MediaQuery.of(context).size.height / 1.75,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: primaryColor,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: data.status == 1
                              ? secondaryColor
                              : (data.status == 2
                                  ? Colors.blue.shade900
                                  : text2Color),
                        ),
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: 40,
                                  height: 40,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(imgChip),
                                    ),
                                  ),
                                ),
                                Text(
                                  data.visa == true ? 'VISA' : 'GPN',
                                  style: poppinsH2.copyWith(
                                    color: data.visa == true
                                        ? buttonColor
                                        : textColor,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: 16,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    snapshot.data![index].name,
                                    style: poppinsBody1.copyWith(
                                      color: textColor,
                                    ),
                                  ),
                                  const VerticalGap5(),
                                  Text(
                                    hiddenNumber,
                                    style: poppinsBody1.copyWith(
                                      color: textColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '\$ ${data.balance}',
                                  style: poppinsH3.copyWith(
                                    color: textColor,
                                  ),
                                ),
                                Text(
                                  data.expirationDate,
                                  style: poppinsBody2.copyWith(
                                    color: textColor,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  Container headerSection() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          const Icon(
            Icons.wallet_rounded,
            size: 28,
            color: textColor,
          ),
          const HorizontalGap5(),
          Text(
            'My Pockets',
            style: poppinsH1.copyWith(color: textColor),
          ),
        ],
      ),
    );
  }
}
