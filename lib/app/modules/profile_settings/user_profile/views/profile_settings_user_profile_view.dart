import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:victoria_game/app/controllers/app_controller.dart';
import 'package:victoria_game/app/global/widgets/list_tile/divider_list_tile.dart';
import 'package:victoria_game/app/routes/app_pages.dart';

import '../../../../global/icons/custom_icon_data_icons.dart';
import '../../../../global/themes/colors_theme.dart';
import '../../../../global/themes/typography_theme.dart';
import '../controllers/profile_settings_user_profile_controller.dart';

class ProfileSettingsUserProfileView
    extends GetView<ProfileSettingsUserProfileController> {
  ProfileSettingsUserProfileView({Key? key}) : super(key: key);

  final appController = Get.find<AppController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragUpdate: (details) {
        int sensitivity = 8;
        if (details.delta.dy > sensitivity) {
          // Down Swipe
          Get.back();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Akun'),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.close),
          ),
        ),
        body: ListView(
          padding: EdgeInsets.all(16.0),
          children: [
            Material(
              borderRadius: BorderRadius.circular(8.0),
              elevation: 4,
              child: Container(
                decoration: BoxDecoration(
                  color: ColorsTheme.neutralColor[900],
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 48,
                          width: 48,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: ColorsTheme.primaryColor,
                              width: 1,
                            ),
                            image: DecorationImage(
                              image: AssetImage(
                                  "assets/images/drawable/profile/avatar-profile-100.jpg"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(width: 16),
                        Text(
                          "Hi, John Doe",
                          style: TypographyTheme.bodyMedium,
                        ),
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: ColorsTheme.neutralColor[900],
                      ),
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          CustomIconData.pencil,
                          color: ColorsTheme.primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 16.0, 0, 16.0),
              child: AspectRatio(
                aspectRatio: 328 / 130,
                child: Material(
                  borderRadius: BorderRadius.circular(8),
                  elevation: 5,
                  child: Container(
                    width: Get.width,
                    // height: 64,5
                    decoration: BoxDecoration(
                      color: ColorsTheme.neutralColor[900],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Saldo Kamu",
                                    style: TypographyTheme.bodySmall,
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    "Rp 1.000.000",
                                    style: TypographyTheme.bodyMedium.copyWith(
                                      color: ColorsTheme.primaryColor,
                                      letterSpacing: 0.6,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 48,
                              child: VerticalDivider(
                                width: 20,
                                thickness: 1,
                                color: ColorsTheme.neutralColor[50],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Play Time Kamu",
                                    style: TypographyTheme.bodySmall,
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    "36 Jam",
                                    style: TypographyTheme.bodyMedium.copyWith(
                                      color: ColorsTheme.primaryColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        OutlinedButton.icon(
                          onPressed: () {},
                          icon: FaIcon(FontAwesomeIcons.whatsapp),
                          label: Text("Chat Admin untuk Top Up"),
                          style: OutlinedButton.styleFrom(
                            backgroundColor: Color(0xFF25D366),
                            foregroundColor: ColorsTheme.neutralColor[50],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0, top: 6.0),
              child: Text(
                "Pengaturan Aplikasi",
                style: TypographyTheme.titleSmall.copyWith(
                  color: ColorsTheme.primaryColor,
                ),
              ),
            ),
            DividerListTile(
              title: "Pengaturan Notifikasi",
              topBorder: true,
            ),
            DividerListTile(
              title: "Laporkan Masalah",
              topBorder: true,
              bottomBorder: true,
              trailing: Text("v${appController.packageInfo.version}"),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0, top: 24.0),
              child: Text(
                "Kebijakan Dan Pertanyaan",
                style: TypographyTheme.titleSmall.copyWith(
                  color: ColorsTheme.primaryColor,
                ),
              ),
            ),
            DividerListTile(
              title: "Kebijakan Aplikasi",
              topBorder: true,
            ),
            DividerListTile(
              title: "FaQ",
              topBorder: true,
              bottomBorder: true,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0, top: 24.0),
              child: Text(
                "Pengaturan Akun",
                style: TypographyTheme.titleSmall.copyWith(
                  color: ColorsTheme.primaryColor,
                ),
              ),
            ),
            DividerListTile(
              title: "Ubah Email",
              topBorder: true,
            ),
            DividerListTile(
              title: "Ubah Kata Sandi",
              bottomBorder: true,
              topBorder: true,
            ),
            DividerListTile(
              title: "Keluar",
              bottomBorder: true,
            ),
          ],
        ),
      ),
    );
  }
}
