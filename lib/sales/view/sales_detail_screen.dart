import 'package:card_settlement/common/const/colors.dart';
import 'package:card_settlement/common/const/text_style.dart';
import 'package:card_settlement/common/layout/default_appbar.dart';
import 'package:card_settlement/common/layout/default_layout.dart';
import 'package:card_settlement/common/util/map_with_index.dart';
import 'package:card_settlement/common/util/money_format.dart';
import 'package:card_settlement/data.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

class SalesDetailScreen extends StatelessWidget {
  final String title;

  const SalesDetailScreen({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      appbar: DefaultAppBar(
        title: title,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
        child: DataTable2(
          headingRowDecoration: BoxDecoration(
            color: MyColor.primary,
            borderRadius: BorderRadius.circular(8.0),
          ),
          columnSpacing: 12,
          horizontalMargin: 12,
          minWidth: 13 * 120,
          columns: List.generate(
            cardSalesDataTitle.length,
            (index) => DataColumn2(
              label: SizedBox(
                width: 120.0,
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
                (element, index) {
                  if (index == 0) {
                    return DataCell(
                      SizedBox(
                        width: 100.0,
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
                        width: 100.0,
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
