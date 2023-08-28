import 'package:booking/constants/notosansthai.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';
import '../controllers/home_controller.dart';
import '../widgets/add_information.dart';
import '../widgets/custom_dialog_widget.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Palette.grey1,
        body: Align(
          alignment: Alignment.topCenter,
          child: SingleChildScrollView(
            controller: controller.vertical,
            child: SingleChildScrollView(
              controller: controller.horizontal,
              scrollDirection: Axis.horizontal,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    constraints:
                        const BoxConstraints(maxWidth: 1200, maxHeight: 400),
                    // width: 1600,
                    // height: 400,
                    child: Image.network(
                      'https://marketplace.canva.com/EAE9QjX6rhA/1/0/1600w/canva-blue-pink-gradient-fashion-banner-cVzLo3B1IHE.jpg',
                      fit: BoxFit.fill,
                    ),
                  ),
                  const SizedBox(height: 32),
                  Container(),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Column(
                        children: [],
                      ),
                      Obx(
                        () => controller.isLoading.value
                            ? const Center(
                                child: CircularProgressIndicator(),
                              )
                            : ConstrainedBox(
                                constraints: const BoxConstraints(
                                  maxHeight: 1000,
                                  maxWidth: 1000,
                                ),
                                child: Column(
                                  children: [
                                    for (var i = 0; i < 11; i++)
                                      i == 5
                                          ? const SizedBox(
                                              height: 58,
                                            )
                                          : Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                for (var j = 1; j <= 11; j++)
                                                  j == 6
                                                      ? const SizedBox(
                                                          width: 58,
                                                        )
                                                      : Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: InkWell(
                                                            onTap: () async {
                                                              controller.checkEmptyTable(
                                                                      index: i < 5
                                                                          ? j < 6
                                                                              ? j + (i * 10)
                                                                              : j + (i * 10 - 1)
                                                                          : j < 6
                                                                              ? j + ((i - 1) * 10)
                                                                              : j - 1 + ((i - 1) * 10))
                                                                  ? AddInformationPopup().add(
                                                                      index: i < 5
                                                                          ? j < 6
                                                                              ? j + (i * 10)
                                                                              : j + (i * 10 - 1)
                                                                          : j < 6
                                                                              ? j + ((i - 1) * 10)
                                                                              : j - 1 + ((i - 1) * 10))
                                                                  : Get.dialog(const CustomDialogWidget(
                                                                      dialogTpye:
                                                                          DialogTpye
                                                                              .error,
                                                                    ));
                                                            },
                                                            child: Container(
                                                              width: 50,
                                                              height: 50,
                                                              color:
                                                                  Palette.black,
                                                              child: Text(
                                                                (i < 5
                                                                        ? j < 6
                                                                            ? j +
                                                                                (i * 10)
                                                                            : j + (i * 10 - 1)
                                                                        : j < 6
                                                                            ? j + ((i - 1) * 10)
                                                                            : j - 1 + ((i - 1) * 10))
                                                                    .toString(),
                                                                style: NotoSansThai
                                                                    .h4
                                                                    .copyWith(
                                                                        color: Palette
                                                                            .white),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                              ],
                                            ),
                                  ],
                                )),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
