import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';

import 'package:get/get.dart';
import 'package:victoria_game/app/core/network/response/game_center/game_centers_list_res.dart';

import 'package:victoria_game/app/core/network/response/game_center/game_centers_res.dart';
import 'package:victoria_game/app/core/repository/game_center_repository.dart';
import 'package:victoria_game/app/core/repository/user_repository.dart';
import 'package:victoria_game/app/global/widgets/alert_dialog/single_action_dialog/single_action_dialog.dart';
import 'package:victoria_game/app/routes/app_pages.dart';

import 'package:victoria_game/utils/secure_storage.dart';

class MainPageHomeController extends GetxController {
  final storage = SecureStorage();

  late UserRepository userRepository;
  late GameCenterRepository gameCenterRepository;

  late String authAccessToken;

  List<int> imageByte = [];

  String username = "John Doe";
  int ballance = 1000;
  int playTime = 0;

  RxString locationMessage = "Belum mendapat Lat dan Long".obs;
  RxString addressMessage = "Mencari Lokasi".obs;

  late Position myPosition;

  List<GameCenters> gameCenterList = [];

  Future<bool> requestLocationPermission() async {
    var locationPermission = await userRepository.handleLocationPermission();

    userRepository.printLog.d(locationPermission);

    if (!locationPermission) {
      Get.dialog(
        SingleActionDialog(
          title: "Akses Lokasi Ditolak",
          description:
              "Kami membutuhkan akses lokasi untuk mengetahui jarak kamu dengan game center terdekat.",
          buttonFunction: () async {
            await userRepository.requestOpenAppSettings();
            Get.back();
          },
        ),
      );

      return false;
    }

    myPosition = await Geolocator.getCurrentPosition();

    return locationPermission;
  }

  void onSelectedGameCenter(int index) {
    Get.toNamed(Routes.DETAIL_GAME_CENTER,
        arguments: {"location": gameCenterList[index].id});
  }

  Future<Uint8List> fetchUserImage() async {
    authAccessToken = await storage.readDataFromStrorage("token") ?? "";
    var result = await userRepository.getMethodRaw("/api/user/image",
        headers: {userRepository.authorization: authAccessToken});

    imageByte = [...result.bodyBytes];

    return result.bodyBytes;
  }

  Future<void> fetchUserData() async {
    var userData = await userRepository.fetchUserData(authAccessToken);

    username = userData.data?.username ?? "";
    ballance = userData.data?.ballance ?? 1;
    playTime = userData.data?.playTime ?? 1;
  }

  Future<void> fetchGameCenters() async {
    String authToken = await storage.readDataFromStrorage("token") ?? "";

    var gameCenterData =
        await gameCenterRepository.fetchGameCentersList(authToken: authToken);

    gameCenterList = gameCenterData.data ?? [];
  }

  Future<bool> requestCameraGaleryPermissions() async {
    var cameraGaleryPermission =
        await userRepository.handleCameraGaleryPermission();

    userRepository.printLog.d(cameraGaleryPermission);

    if (!cameraGaleryPermission) {
      Get.dialog(
        SingleActionDialog(
          title: "Akses Kamera Dan Galeri Ditolak",
          description:
              "Kami membutuhkan akses kamera serta galeri untuk mengupdate profile kamu.",
          buttonFunction: () async {
            await userRepository.requestOpenAppSettings();
            Get.back();
          },
        ),
      );

      return false;
    }

    return cameraGaleryPermission;
  }

  Future<void> initData() async {
    imageByte = await fetchUserImage();
    await fetchUserData();
    await fetchGameCenters();
  }

  @override
  void onInit() {
    userRepository = UserRepository.instance;
    gameCenterRepository = GameCenterRepository.instance;
    requestLocationPermission();
    requestCameraGaleryPermissions();
    initData();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
