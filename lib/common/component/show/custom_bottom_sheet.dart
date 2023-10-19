import 'package:card_settlement/common/const/colors.dart';
import 'package:flutter/material.dart';

void showBottomWidget({
  required BuildContext context,
  required Widget bottomSheetWidget,
}) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return bottomSheetWidget; // CustomBottomSheet();
    },
    isDismissible: true,
    isScrollControlled: true,
    barrierColor: MyColor.barrier,
    backgroundColor: MyColor.empty,
  );
}

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Container(
              color: MyColor.empty,
            ),
          ),
        ),
        Container(
          decoration: const BoxDecoration(
            color: MyColor.scaffoldBackground,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(16.0),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: 32.0,
              horizontal: 16.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text('예시 제목'),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('아무 버튼'),
                ),
                const SizedBox(height: 12.0),
                const Text('예시 제목'),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('아무 버튼'),
                ),
                const SizedBox(height: 12.0),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
