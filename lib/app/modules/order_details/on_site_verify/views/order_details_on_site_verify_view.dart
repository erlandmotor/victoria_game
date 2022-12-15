import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rive/rive.dart';
import 'package:victoria_game/app/global/themes/colors_theme.dart';
import 'package:victoria_game/app/global/themes/typography_theme.dart';
import 'package:victoria_game/app/global/widgets/text_field/password_text_field/views/password_text_field_widget.dart';

import '../controllers/order_details_on_site_verify_controller.dart';

class OrderDetailsOnSiteVerifyView
    extends GetView<OrderDetailsOnSiteVerifyController> {
  const OrderDetailsOnSiteVerifyView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text('Verifikasi Order'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: CustomScrollView(
          scrollDirection: Axis.vertical,
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Container(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                            height: 328,
                            width: 328,
                            child: RiveAnimation.asset(
                                "assets/rive/order-verify.riv")),
                        Text(
                          "Harap verifikasi bahwa transaksi ini dibuat olehmu ya!",
                          style: TypographyTheme.bodyMedium
                              .copyWith(fontWeight: FontWeight.w600),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 16),
                        PasswordTextField(
                            textEditingController:
                                controller.passwordController),
                      ],
                    ),
                    SizedBox(height: 32),
                    OutlinedButton(
                      onPressed: () {
                        controller.submitVerifyOrder();
                      },
                      child: Text("Verifikasi Order"),
                      style: OutlinedButton.styleFrom(
                        backgroundColor: ColorsTheme.primaryColor,
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}