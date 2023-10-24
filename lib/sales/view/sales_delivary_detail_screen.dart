import 'package:card_settlement/common/component/custom_loading.dart';
import 'package:card_settlement/common/const/colors.dart';
import 'package:card_settlement/common/const/text_style.dart';
import 'package:card_settlement/common/layout/default_appbar.dart';
import 'package:card_settlement/common/layout/default_layout.dart';
import 'package:card_settlement/common/util/datetime.dart';
import 'package:card_settlement/common/util/map_with_index.dart';
import 'package:card_settlement/common/util/money_format.dart';
import 'package:card_settlement/data/delivery/count_success.dart';
import 'package:card_settlement/data/delivery/date_success.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

import '../../common/component/custom_container_button.dart';

class SalesDeliveryDetailScreen extends StatefulWidget {
  const SalesDeliveryDetailScreen({
    super.key,
  });

  @override
  State<SalesDeliveryDetailScreen> createState() =>
      _SalesDeliveryDetailScreenState();
}

class _SalesDeliveryDetailScreenState extends State<SalesDeliveryDetailScreen> {
  final double itemWidth = 120.0;
  bool isFirst = true;

  Future<String> yourAsyncFunction() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return "작업 완료!";
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      appbar: const DefaultAppBar(title: "배달어플 상세 매출"),
      child: FutureBuilder<String>(
        future: yourAsyncFunction(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CustomLoadingScreen(),
            ); // 로딩 중일 때 보여줄 위젯
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {}
          return Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: CustomContainerButton(
                        title: '승인 일자별',
                        isSelected: isFirst,
                        onTap: () {
                          isFirst = true;
                          setState(() {});
                        },
                      ),
                    ),
                    const SizedBox(width: 16.0),
                    Expanded(
                      child: CustomContainerButton(
                        title: '승인 건별',
                        isSelected: !isFirst,
                        onTap: () {
                          isFirst = false;
                          setState(() {});
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24.0),
                if (isFirst)
                  Expanded(
                    child: DataTable2(
                      headingRowDecoration: BoxDecoration(
                        color: MyColor.primary,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      columnSpacing: 12,
                      horizontalMargin: 12,
                      minWidth: dateSuccessTitle.length * itemWidth,
                      columns: List.generate(
                        dateSuccessTitle.length,
                        (index) => DataColumn2(
                          label: SizedBox(
                            width: itemWidth,
                            child: Text(
                              dateSuccessTitle[index],
                              style: MyTextStyle.bodyBold.copyWith(
                                color: MyColor.whiteText,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          size: ColumnSize.L,
                        ),
                      ),
                      rows: List<DataRow>.generate(
                        dateSuccess.length,
                        growable: false,
                        (index) => DataRow(
                          cells: dateSuccess[index].mapWithIndex<DataCell>(
                            (element, index) {
                              if (index == 1) {
                                DateTime time = element as DateTime;
                                return DataCell(
                                  SizedBox(
                                    width: itemWidth,
                                    child: Text(
                                      time.convertDateTimeToDateString(),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                );
                              } else if (index == 7 ||
                                  index == 8 ||
                                  index == 9) {
                                int number = element as int;
                                return DataCell(
                                  SizedBox(
                                    width: itemWidth - 20,
                                    child: Text(
                                      "${number.convertIntToMoneyString()} 원",
                                      textAlign: TextAlign.end,
                                    ),
                                  ),
                                );
                              }
                              return DataCell(
                                SizedBox(
                                  width: itemWidth,
                                  child: Text(
                                    element.toString(),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                if (!isFirst)
                  Expanded(
                    child: DataTable2(
                      headingRowDecoration: BoxDecoration(
                        color: MyColor.primary,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      columnSpacing: 12,
                      horizontalMargin: 12,
                      minWidth: countSuccessTitle.length * itemWidth,
                      columns: List.generate(
                        countSuccessTitle.length,
                        (index) => DataColumn2(
                          label: SizedBox(
                            width: itemWidth,
                            child: Text(
                              countSuccessTitle[index],
                              style: MyTextStyle.bodyBold.copyWith(
                                color: MyColor.whiteText,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          size: ColumnSize.L,
                        ),
                      ),
                      rows: List<DataRow>.generate(
                        countSuccess.length,
                        growable: false,
                        (index) => DataRow(
                          cells: countSuccess[index].mapWithIndex<DataCell>(
                            (element, index) {
                              if (index == 7 || index == 8 || index == 9) {
                                int number = element as int;
                                return DataCell(
                                  SizedBox(
                                    width: itemWidth - 20,
                                    child: Text(
                                      "${number.convertIntToMoneyString()} 원",
                                      textAlign: TextAlign.end,
                                    ),
                                  ),
                                );
                              }
                              return DataCell(
                                SizedBox(
                                  width: itemWidth,
                                  child: Text(
                                    element.toString(),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }

  String formatDate(String inputDate) {
    String year = inputDate.substring(0, 4);
    String month = inputDate.substring(4, 6);
    String day = inputDate.substring(6, 8);

    return "$year-$month-$day";
  }
}
