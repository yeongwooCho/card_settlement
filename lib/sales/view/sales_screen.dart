import 'package:flutter/material.dart';

import '../../common/layout/default_appbar.dart';
import '../../common/layout/default_layout.dart';

class SalesScreen extends StatelessWidget {
  const SalesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      appbar: const DefaultAppBar(title: '매출 조회'),
      child: Column(
        children: [
          Text('asfd'),
        ],
      ),
    );
  }
}
