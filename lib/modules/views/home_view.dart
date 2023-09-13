import 'package:booking/constants/notosansthai.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';
import '../controllers/home_controller.dart';
import '../widgets/add_information.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  static const side = Color(0xff94A684);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xffE4E4D0),
      body: GestureDetector(
        child: InteractiveViewer(
          constrained: MediaQuery.of(context).size.width > 450 ? true : false,
          trackpadScrollCausesScale: true,
          minScale: .1,
          maxScale: 1.5,
          scaleEnabled: MediaQuery.of(context).size.width > 450 ? false : true,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Align(
              alignment: Alignment.topCenter,
              child: SingleChildScrollView(
                controller: controller.horizontal,
                scrollDirection: Axis.horizontal,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                        constraints: const BoxConstraints(maxHeight: 560),
                        width: 1200,
                        child: Image.asset(
                          'assets/image/banner.jpg',
                          fit: BoxFit.fill,
                        )),
                    const SizedBox(height: 48),
                    Container(
                      constraints: const BoxConstraints(maxWidth: 1200),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Container(
                                width: 100,
                                height: 160,
                                color: side,
                              ),
                              Container(
                                alignment: Alignment.center,
                                height: 140,
                                child: Text(
                                  'ทางเข้า/ทางออก',
                                  style: NotoSansThai.h3
                                      .copyWith(color: Palette.black),
                                ),
                              ),
                              Container(
                                width: 100,
                                height: 460,
                                color: side,
                              ),
                              Container(
                                alignment: Alignment.center,
                                height: 140,
                                child: Text(
                                  'ทางเข้า/ทางออก',
                                  style: NotoSansThai.h3
                                      .copyWith(color: Palette.black),
                                ),
                              ),
                              Container(
                                width: 100,
                                height: 160,
                                color: side,
                              )
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                width: 300,
                                height: 100,
                                child: Stack(children: [
                                  Positioned(
                                    left: 35,
                                    right: 35,
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: 240,
                                      height: 100,
                                      color: side,
                                      child: Text(
                                        'เวที',
                                        style: NotoSansThai.h3
                                            .copyWith(color: Palette.black),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                      top: 25,
                                      right: 0,
                                      child: Container(
                                        width: 75,
                                        height: 50,
                                        color: side,
                                      )),
                                  Positioned(
                                      top: 25,
                                      left: 0,
                                      child: Container(
                                        width: 75,
                                        height: 50,
                                        color: side,
                                      )),
                                ]),
                              ),
                              SizedBox(
                                height: 56,
                                child: Row(
                                  children: [
                                    Container(
                                      decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Palette.red),
                                      width: 32,
                                      height: 32,
                                    ),
                                    const SizedBox(width: 4),
                                    const Text(
                                      'จองแล้ว',
                                      style: NotoSansThai.h3,
                                    ),
                                    const SizedBox(width: 8),
                                    Container(
                                      decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.green),
                                      width: 32,
                                      height: 32,
                                    ),
                                    const SizedBox(width: 4),
                                    const Text(
                                      'ว่าง',
                                      style: NotoSansThai.h3,
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(height: 32),
                              Obx(
                                () => controller.isLoading.value
                                    ? const Center(
                                        child: CircularProgressIndicator(),
                                      )
                                    : ConstrainedBox(
                                        constraints: const BoxConstraints(
                                            // maxHeight: 1000,
                                            // maxWidth: 1000,
                                            ),
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                for (var i = 0; i < 11; i++)
                                                  i == 5
                                                      ? const SizedBox(
                                                          width: 58,
                                                        )
                                                      : Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Container(
                                                            alignment: Alignment
                                                                .center,
                                                            decoration:
                                                                const BoxDecoration(
                                                              shape: BoxShape
                                                                  .circle,
                                                              color:
                                                                  Palette.red,
                                                            ),
                                                            width: 50,
                                                            height: 50,
                                                            child: Text(
                                                              '',
                                                              style: NotoSansThai
                                                                  .h4
                                                                  .copyWith(
                                                                      color: Palette
                                                                          .white),
                                                              // textAlign: TextAlign.center,
                                                            ),
                                                          ),
                                                        )
                                              ],
                                            ),
                                            for (var i = 0; i < 10; i++)
                                              i == 4
                                                  ? const SizedBox(
                                                      height: 58,
                                                    )
                                                  : Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        for (var j = 1;
                                                            j <= 11;
                                                            j++)
                                                          j == 6
                                                              ? const SizedBox(
                                                                  width: 58,
                                                                )
                                                              : Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .all(
                                                                          8.0),
                                                                  child:
                                                                      InkWell(
                                                                    onTap:
                                                                        () async {
                                                                      controller.checkEmptyTable(
                                                                              index: i < 5
                                                                                  ? j < 6
                                                                                      ? j + (i * 10)
                                                                                      : j + (i * 10 - 1)
                                                                                  : j < 6
                                                                                      ? j + ((i - 1) * 10)
                                                                                      : j - 1 + ((i - 1) * 10))
                                                                          ? InformationPopup().add(
                                                                              index: i < 5
                                                                                  ? j < 6
                                                                                      ? j + (i * 10)
                                                                                      : j + (i * 10 - 1)
                                                                                  : j < 6
                                                                                      ? j + ((i - 1) * 10)
                                                                                      : j - 1 + ((i - 1) * 10))
                                                                          : InformationPopup().inspect(
                                                                              inspect: false,
                                                                              index: i < 5
                                                                                  ? j < 6
                                                                                      ? j + (i * 10)
                                                                                      : j + (i * 10 - 1)
                                                                                  : j < 6
                                                                                      ? j + ((i - 1) * 10)
                                                                                      : j - 1 + ((i - 1) * 10));
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      alignment:
                                                                          Alignment
                                                                              .center,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        shape: BoxShape
                                                                            .circle,
                                                                        color: controller.checkEmptyTable(
                                                                                index: i < 5
                                                                                    ? j < 6
                                                                                        ? j + (i * 10)
                                                                                        : j + (i * 10 - 1)
                                                                                    : j < 6
                                                                                        ? j + ((i - 1) * 10)
                                                                                        : j - 1 + ((i - 1) * 10))
                                                                            ? Colors.green
                                                                            : Palette.red,
                                                                      ),
                                                                      width: 50,
                                                                      height:
                                                                          50,
                                                                      child:
                                                                          Text(
                                                                        (i < 5
                                                                                ? j < 6
                                                                                    ? j + (i * 10)
                                                                                    : j + (i * 10 - 1)
                                                                                : j < 6
                                                                                    ? j + ((i - 1) * 10)
                                                                                    : j - 1 + ((i - 1) * 10))
                                                                            .toString(),
                                                                        style: NotoSansThai
                                                                            .h4
                                                                            .copyWith(color: Palette.white),
                                                                        // textAlign: TextAlign.center,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                      ],
                                                    ),
                                          ],
                                        )),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 100,
                                height: 1060,
                                color: side,
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 600,
                      height: 40,
                      color: side,
                    ),
                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
