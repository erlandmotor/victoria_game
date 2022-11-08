import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:victoria_game/app/modules/main_page/controllers/main_page_index_controller.dart';

import '../../../icons/custom_icon_data_icons.dart';

class MainBottomNavigation extends StatelessWidget {
  MainBottomNavigation({super.key});

  MainPageIndexController controller = Get.find<MainPageIndexController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() => BottomNavigationBar(
          currentIndex: controller.pageIndex.value,
          onTap: (value) {
            controller.onTappedItem(value);
          },
          enableFeedback: false,
          unselectedFontSize: 12,
          selectedFontSize: 12,
          items: [
            BottomNavigationBarItem(
              icon: Icon(CustomIconData.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(CustomIconData.joystick),
              label: "Sewa",
            ),
            BottomNavigationBarItem(
              icon: Icon(CustomIconData.service),
              label: "Servis PS",
            ),
            BottomNavigationBarItem(
              icon: Icon(CustomIconData.historyReceipt),
              label: "Riwayat",
            ),
          ],
        ));
  }
}