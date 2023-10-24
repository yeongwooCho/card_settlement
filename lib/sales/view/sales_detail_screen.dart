import 'package:card_settlement/common/const/colors.dart';
import 'package:card_settlement/common/const/text_style.dart';
import 'package:card_settlement/common/layout/default_appbar.dart';
import 'package:card_settlement/common/layout/default_layout.dart';
import 'package:card_settlement/common/util/map_with_index.dart';
import 'package:card_settlement/common/util/money_format.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

import '../../common/component/custom_loading.dart';
import '../../data/card/card_data.dart';

class SalesDetailScreen extends StatefulWidget {
  const SalesDetailScreen({
    super.key,
  });

  @override
  State<SalesDetailScreen> createState() => _SalesDetailScreenState();
}

class _SalesDetailScreenState extends State<SalesDetailScreen> {
  final double itemWidth = 120.0;

  Future<String> yourAsyncFunction() async {
    // 비동기 작업을 수행하는 함수

    // 예시: 2초 동안 대기 후에 "작업 완료!" 반환
    await Future.delayed(const Duration(milliseconds: 300));
    return "작업 완료!";
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      appbar: const DefaultAppBar(title: "카드사 상세 매출"),
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
            child: DataTable2(
              headingRowDecoration: BoxDecoration(
                color: MyColor.primary,
                borderRadius: BorderRadius.circular(8.0),
              ),
              columnSpacing: 12,
              horizontalMargin: 12,
              minWidth: cardSalesDataTitle.length * itemWidth,
              columns: List.generate(
                cardSalesDataTitle.length,
                (index) => DataColumn2(
                  label: SizedBox(
                    width: itemWidth,
                    child: Text(
                      cardSalesDataTitle[index],
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
                cardSalesData.length,
                (index) => DataRow(
                  cells: cardSalesData[index].mapWithIndex<DataCell>(
                    (element, ind) {
                      if (ind == 0) {
                        return DataCell(
                          SizedBox(
                            width: itemWidth - 20,
                            child: Text(
                              formatDate(
                                element.toString(),
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        );
                      } else {
                        return DataCell(
                          SizedBox(
                            width: itemWidth - 20,
                            child: Text(
                              "${element.convertIntToMoneyString()} 원",
                              textAlign: TextAlign.end,
                            ),
                          ),
                        );
                      }
                    },
                  ),
                ),
              ),
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
