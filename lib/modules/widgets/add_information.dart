import 'package:booking/modules/widgets/custom_dialog_widget.dart';
import 'package:booking/modules/widgets/custom_elevatedbutton_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';
import '../../constants/notosansthai.dart';
import '../controllers/home_controller.dart';

class InformationPopup {
  HomeController controller = Get.find();
  add({required int index}) => Get.dialog(
        Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
          child: Obx(
            () => Container(
                width: 640,
                height: 760,
                padding: const EdgeInsets.all(32),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(15)),
                child: FormBuilder(
                  key: controller.key,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('โต๊ะที่ $index',
                              style: NotoSansThai.h1
                                  .copyWith(color: Palette.black)),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                  'ชื่อบัญชี สมาคมศิษย์เก่าเภสัชศาสตร์ ม.ขอนแก่น',
                                  style: NotoSansThai.largeLabel
                                      .copyWith(color: Palette.black)),
                              Text('ธนาคารไทยพาณิชย์',
                                  style: NotoSansThai.largeLabel
                                      .copyWith(color: Palette.black)),
                              Text('บัญชีเลขที่ 5512887508',
                                  style: NotoSansThai.largeLabel
                                      .copyWith(color: Palette.black)),
                              Text('จำนวนเงิน 10,000 บาท',
                                  style: NotoSansThai.largeLabel
                                      .copyWith(color: Palette.black)),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Text('ผู้จอง',
                              style: NotoSansThai.h2
                                  .copyWith(color: Palette.black)),
                          Text('*กรุณาใส่ขื่อผู้จองอย่างน้อย 1 คน',
                              style: NotoSansThai.caption
                                  .copyWith(color: Palette.red)),
                        ],
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(children: [
                            for (var i = 1; i <= 10; i++)
                              Wrap(
                                crossAxisAlignment: WrapCrossAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 32),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('$i. ชื่อ-สกุล:',
                                            style: NotoSansThai.h3.copyWith(
                                                color: Palette.black)),
                                        SizedBox(
                                          width: 240,
                                          child: customFormTextField(
                                              validator: i == 1
                                                  ? FormBuilderValidators
                                                      .compose([
                                                      FormBuilderValidators
                                                          .required(
                                                              errorText:
                                                                  '*กรุณากรอกข้อมูล')
                                                    ])
                                                  : null,
                                              key: 'name$i',
                                              decoration: customInputDecoration(
                                                  hintText: 'ชื่อ-สกุล')),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 32),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('รุ่น:',
                                            style: NotoSansThai.h3.copyWith(
                                                color: Palette.black)),
                                        SizedBox(
                                          width: 120,
                                          child: customFormTextField(
                                              validator: i == 1
                                                  ? FormBuilderValidators
                                                      .compose([
                                                      FormBuilderValidators
                                                          .required(
                                                              errorText:
                                                                  '*กรุณากรอกข้อมูล')
                                                    ])
                                                  : null,
                                              key: 'gen$i',
                                              decoration: customInputDecoration(
                                                  hintText: 'รุ่น')),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 32),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('เบอร์โทรศัพท์:',
                                            style: NotoSansThai.h3.copyWith(
                                                color: Palette.black)),
                                        SizedBox(
                                          width: 120,
                                          child: customFormTextField(
                                              validator: i == 1
                                                  ? FormBuilderValidators
                                                      .compose([
                                                      FormBuilderValidators
                                                          .required(
                                                              errorText:
                                                                  '*กรุณากรอกข้อมูล')
                                                    ])
                                                  : null,
                                              key: 'tel$i',
                                              decoration: customInputDecoration(
                                                  hintText: 'เบอร์โทรศัพท์')),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                          ]),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text('อัพโหลดสลิป',
                          style:
                              NotoSansThai.h3.copyWith(color: Palette.black)),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(8),
                                width: 120,
                                height: 40,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1, color: Palette.storke),
                                    borderRadius: BorderRadius.circular(12)),
                                child: Text(
                                  controller.imgName.value,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: NotoSansThai.smallLabel
                                      .copyWith(color: Palette.black),
                                ),
                              ),
                              const SizedBox(width: 8),
                              InkWell(
                                  onTap: () async {
                                    await controller.pickImage();
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(8),
                                    height: 40,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 1, color: Palette.mainGreen),
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    child: Text(
                                      'เลือก',
                                      style: NotoSansThai.normal
                                          .copyWith(color: Palette.black),
                                    ),
                                  )),
                            ],
                          ),
                          controller.isPickedImage.value
                              ? Container()
                              : Text(
                                  'กรุณาอัพโหลดสลิป',
                                  style: NotoSansThai.caption
                                      .copyWith(color: Palette.red),
                                )
                        ],
                      ),
                      const SizedBox(height: 8),
                      Align(
                        alignment: Alignment.centerRight,
                        child: ElevatedButton(
                            onPressed: () {
                              if (controller.key.currentState!
                                      .saveAndValidate() &&
                                  controller.isPickedImage.value) {
                                Get.dialog(CustomDialogWidget(
                                  dialogTpye: DialogTpye.custom,
                                  title: 'ยืนยันการจอง',
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const SizedBox(height: 8),
                                      Text(
                                        'ต้องการจองโต๊ะที่ $index ใช่หรือไม่?',
                                        style: NotoSansThai.h3
                                            .copyWith(color: Palette.black),
                                      ),
                                    ],
                                  ),
                                  actions: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        CustomElevatedButton(
                                          backgroundColor: Palette.red,
                                          label: 'ยกเลิก',
                                          onPressed: () {
                                            Get.back();
                                          },
                                        ),
                                        Obx(() => controller.isAdding.value
                                            ? Container(
                                                width: 100,
                                                height: 45,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16),
                                                    color: Palette.storke),
                                                child: const Center(
                                                  child: SizedBox(
                                                      width: 28,
                                                      height: 28,
                                                      child:
                                                          CircularProgressIndicator()),
                                                ),
                                              )
                                            : CustomElevatedButton(
                                                backgroundColor:
                                                    Palette.mainGreen,
                                                label: 'ตกลง',
                                                onPressed: () async {
                                                  await controller
                                                      .addInformation(
                                                          index: index);
                                                },
                                              ))
                                      ],
                                    )
                                  ],
                                ));
                              }
                            },
                            child: Text(
                              'จองโต๊ะ',
                              style: NotoSansThai.normal
                                  .copyWith(color: Palette.black),
                            )),
                      )
                    ],
                  ),
                )),
          ),
        ),
      );

  inspect({required int index}) => Get.dialog(
        Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
          child: Container(
              // constraints: const BoxConstraints(maxHeight: 560, maxWidth: 640),
              width: 640,
              height: 560,
              padding: const EdgeInsets.all(32),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(15)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('โต๊ะที่ $index',
                          style:
                              NotoSansThai.h1.copyWith(color: Palette.black)),
                      CustomElevatedButton(
                        backgroundColor: Palette.mainGreen,
                        label: 'ดูสลิป',
                        onPressed: () {
                          slip(index: index);
                        },
                      )
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text('ผู้จอง',
                      style: NotoSansThai.h2.copyWith(color: Palette.black)),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(children: [
                        for (var i = 1; i <= 10; i++)
                          Wrap(
                            crossAxisAlignment: WrapCrossAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 32),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('$i. ชื่อ-สกุล:',
                                        style: NotoSansThai.h3
                                            .copyWith(color: Palette.black)),
                                    Container(
                                      padding: const EdgeInsets.all(12),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        border:
                                            Border.all(color: Palette.storke),
                                      ),
                                      width: 240,
                                      child: Text(controller.splitBooker(
                                          index: 0,
                                          booker: controller.getBooker(
                                              index: i,
                                              bookers: controller
                                                  .data[index - 1].booker))),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 32),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('รุ่น:',
                                        style: NotoSansThai.h3
                                            .copyWith(color: Palette.black)),
                                    Container(
                                      padding: const EdgeInsets.all(12),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        border:
                                            Border.all(color: Palette.storke),
                                      ),
                                      width: 120,
                                      child: Text(controller.splitBooker(
                                          index: 1,
                                          booker: controller.getBooker(
                                              index: i,
                                              bookers: controller
                                                  .data[index - 1].booker))),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 32),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('เบอร์โทรศัพท์:',
                                        style: NotoSansThai.h3
                                            .copyWith(color: Palette.black)),
                                    Container(
                                      padding: const EdgeInsets.all(12),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        border:
                                            Border.all(color: Palette.storke),
                                      ),
                                      width: 120,
                                      child: Text(controller.splitBooker(
                                          index: 2,
                                          booker: controller.getBooker(
                                              index: i,
                                              bookers: controller
                                                  .data[index - 1].booker))),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                      ]),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: Text(
                          'ปิด',
                          style: NotoSansThai.normal
                              .copyWith(color: Palette.black),
                        )),
                  )
                ],
              )),
        ),
      );

  ticket({required int index}) => Get.dialog(
        Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
          child: Container(
            // constraints: const BoxConstraints(maxHeight: 318, maxWidth: 825),
            width: 825, height: 500,
            padding: const EdgeInsets.all(32),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('โต๊ะที่ $index',
                        style: NotoSansThai.h1.copyWith(color: Palette.black)),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Palette.white),
                        onPressed: () async {
                          controller.downloadImage(
                              imagePath: 'assets/ticket/Ticket_$index.png');
                        },
                        child: Row(
                          children: [
                            const Icon(
                              Icons.download_rounded,
                              size: 16,
                              color: Palette.mainGreen,
                            ),
                            Text(
                              'ดาวน์โหลด',
                              style: NotoSansThai.normal
                                  .copyWith(color: Palette.black),
                            ),
                          ],
                        )),
                  ],
                ),
                const SizedBox(height: 16),
                Image.asset(
                  '/assets/ticket/Ticket_$index.png',
                  fit: BoxFit.fitHeight,
                ),
                const SizedBox(height: 8),
                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: Text(
                        'ปิด',
                        style:
                            NotoSansThai.normal.copyWith(color: Palette.black),
                      )),
                )
              ],
            ),
          ),
        ),
      );

  slip({required int index}) => Get.dialog(
        Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
          child: Container(
            // constraints: const BoxConstraints(maxHeight: 318, maxWidth: 825),
            width: 420,
            height: 500,
            padding: const EdgeInsets.all(32),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('โต๊ะที่ $index',
                    style: NotoSansThai.h1.copyWith(color: Palette.black)),
                const SizedBox(height: 16),
                Container(
                  alignment: Alignment.center,
                  height: 300,
                  child: controller.data[index - 1].slip! != ''
                      ? Image.network(
                          controller.data[index - 1].slip!,
                          // fit: BoxFit.fitHeight,
                        )
                      : Container(),
                ),
                const SizedBox(height: 8),
                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: Text(
                        'ปิด',
                        style:
                            NotoSansThai.normal.copyWith(color: Palette.black),
                      )),
                )
              ],
            ),
          ),
        ),
      );
}

InputDecoration customInputDecoration({
  IconData? prefixIcon,
  Widget? suffixIcon,
  String? hintText,
}) {
  return InputDecoration(
    filled: true,
    fillColor: Palette.white,
    // contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
    hintText: hintText,
    hintStyle: NotoSansThai.normal.copyWith(color: Palette.lightGrey),
    border: OutlineInputBorder(
      borderSide: const BorderSide(
        color: Palette.red,
        style: BorderStyle.solid,
      ),
      borderRadius: BorderRadius.circular(12),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        color: Palette.mainGreen,
        width: 1.5,
        style: BorderStyle.solid,
      ),
      borderRadius: BorderRadius.circular(12),
    ),
    suffixIconConstraints: suffixIcon != null
        ? const BoxConstraints(
            maxWidth: 60,
            maxHeight: 24,
          )
        : null,
    suffixIcon: suffixIcon,
  );
}

Widget customFormTextField(
    {String? label,
    String? key,
    bool obscureText = false,
    TextInputType? keyboardType,
    FocusNode? focus,
    InputDecoration? decoration,
    void Function(String?)? onChange,
    String? Function(String?)? validator,
    double? padding = 16}) {
  return Padding(
    padding: EdgeInsets.only(bottom: padding!),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Text(
        //   label!,
        //   style: NotoSansThai.largeLabel.copyWith(color: Palette.black),
        // ),
        FormBuilderTextField(
          initialValue: '',
          name: "$key",
          textInputAction: TextInputAction.next,
          focusNode: focus,
          obscureText: obscureText,
          keyboardType: keyboardType,
          decoration: decoration!,
          onChanged: onChange,
          validator: validator,
        ),
      ],
    ),
  );
}
