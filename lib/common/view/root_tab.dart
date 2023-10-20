import 'package:card_settlement/common/const/colors.dart';
import 'package:card_settlement/common/layout/default_layout.dart';
import 'package:card_settlement/calculate/view/calculate_screen.dart';
import 'package:card_settlement/my_page/view/my_page_screen.dart';
import 'package:flutter/material.dart';

import '../../sales/view/sales_screen.dart';

class RootTab extends StatefulWidget {
  const RootTab({Key? key}) : super(key: key);

  @override
  State<RootTab> createState() => _RootTabState();
}

class _RootTabState extends State<RootTab> with TickerProviderStateMixin {
  TabController? controller;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    controller = TabController(
      length: getItems().length,
      vsync: this,
    );
    controller?.addListener(tabListener);
  }

  @override
  void dispose() {
    controller?.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      isLoading: isLoading,
      bottomNavigationBar: SizedBox(
        child: renderBottomNavigationBar(),
      ),
      child: Center(
        child: TabBarView(
          controller: controller,
          children: [
            SalesScreen(),
            CalculateScreen(),
            MyPageScreen(),
          ],
        ),
      ),
    );
  }

  BottomNavigationBar renderBottomNavigationBar() {
    return BottomNavigationBar(
      elevation: 1.0,
      backgroundColor: MyColor.scaffoldBackground,
      selectedItemColor: MyColor.defaultText,
      selectedFontSize: 12.0,
      unselectedItemColor: MyColor.middleGrey,
      unselectedFontSize: 12.0,
      onTap: (int index) {
        controller?.animateTo(index);
      },
      items: getItems(),
      currentIndex: controller!.index,
    );
  }

  List<BottomNavigationBarItem> getItems() {
    return const [
      BottomNavigationBarItem(
        icon: Icon(
          Icons.show_chart,
          size: 32.0,
        ),
        label: '매출 조회',
      ),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.payments_rounded,
          size: 32.0,
        ),
        label: '정산 조회',
      ),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.person_outline_rounded,
          size: 32.0,
        ),
        label: '마이페이지',
      ),
    ];
  }

  void tabListener() {
    setState(() {});
  }
}
