import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';
import '../../constants/notosansthai.dart';
import '../controllers/home_controller.dart';

class AddInformationPopup {
  HomeController controller = Get.find();
  add({required int index}) => Get.dialog(
        Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
          child: Obx(
            () => Container(
                constraints:
                    const BoxConstraints(maxHeight: 560, maxWidth: 820),
                padding: const EdgeInsets.all(32),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(15)),
                child: FormBuilder(
                  key: controller.key,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('โต๊ะที่ $index',
                          style:
                              NotoSansThai.h1.copyWith(color: Palette.black)),
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
                                    padding: const EdgeInsets.only(right: 8),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('$i. ชื่อ-สกุล:',
                                            style: NotoSansThai.h3
                                                .copyWith(color: Palette.black)),
                                        SizedBox(
                                          width: 240,
                                          child: customFormTextField(
                                              key: 'name$i',
                                              decoration: customInputDecoration(
                                                  hintText: 'ชื่อ-สกุล')),
                                        ),
                                      ],
                                    ),
                                  ),
                                  
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('รุ่น:',
                                            style: NotoSansThai.h3
                                                .copyWith(color: Palette.black)),
                                        SizedBox(
                                          width: 120,
                                          child: customFormTextField(
                                              key: 'gen$i',
                                              decoration: customInputDecoration(
                                                  hintText: 'รุ่น')),
                                        ),
                                      ],
                                    ),
                                  ),
                                  
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('เบอร์โทรศัพท์:',
                                            style: NotoSansThai.h3
                                                .copyWith(color: Palette.black)),
                                        SizedBox(
                                          width: 120,
                                          child: customFormTextField(
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
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            width: 120,
                            height: 40,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(width: 1, color: Palette.storke),
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
                                    borderRadius: BorderRadius.circular(12)),
                                child: Text(
                                  'เลือก',
                                  style: NotoSansThai.normal
                                      .copyWith(color: Palette.black),
                                ),
                              )),
                        ],
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: ElevatedButton(
                            onPressed: () {
                              if (controller.key.currentState!
                                  .saveAndValidate()) {
                                controller.addInformation(index: index);
                              }
                            },
                            child: Text(
                              'บันทึก',
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
