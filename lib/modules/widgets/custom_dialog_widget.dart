import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';
import '../../constants/notosansthai.dart';
import 'custom_elevatedbutton_widget.dart';


class CustomDialogWidget extends StatelessWidget {
  final double? insetPadding;
  final Widget? titleWidget;
  final EdgeInsetsGeometry? contentPadding;

  ///ข้อความบรรทัดเดียวกันกับปุ่ม [x]
  final String title;

  ///ให้เป็น [false] ถ้าไม่ต้องการให้มีปุ่ม [x]
  final bool isTitle;

  ///ส่วนของเนื่อหา ตรงกลาง
  final Widget? content;

  ///ส่วนของปุ่ม ด้านล่างสุด
  final List<Widget>? actions;

  ///มุนของ dialog
  final double borderRadius;

  ///ชนิดของ dialog แบบที่มีให้แล้ว
  final DialogTpye dialogTpye;

  ///ข้อความที่แสดงบน dialog แบบที่มีให้แล้ว
  final String? labelSuccessOrError;

  ///รายละเอียดเพิ่มเติม
  final String? detailsSuccessOrError;

  ///funtion ที่ทำงานตอนกดของ dialog แบบที่มีให้แล้ว
  final void Function()? onPressedSuccessOrError;

  /// # CustomDialogWidget ตัวอย่าง
  ///
  ///![DialogEx](https://sv1.img.in.th/U16Fdr.png)
  ///
  /// ตัวอย่างการใช้งาน
  /// ```dart
  /// dialogvalidate() => Get.dialog(CustomDialogWidget(
  ///   dialogTpye: DialogTpye.error,
  ///   labelSuccessOrError: label,
  /// ));
  /// ```
  ///
  ///dialog มี 3 Type ถ้าไม่ได้ส่งมาจะเป็น [DialogTpye.custom]
  ///
  /// 1. [DialogTpye.custom] ต้องส่ง [content] [actions] มาเอง
  ///
  ///![Dialog](https://sv1.img.in.th/U161MD.png)
  ///
  /// 2. [DialogTpye.success]
  ///
  /// ใช้ [labelSuccessOrError] สำหรับเปลี่ยนข้อความ และ [onPressedSuccessOrError] สำหรับปุ่มตกลงถ่าต้องการทำอะไรก่อนปิด
  ///
  /// ![DialogSuccess](https://sv1.img.in.th/U18SZ7.png)
  ///
  /// 3. [DialogTpye.error]
  ///
  /// ใช้ [labelSuccessOrError] สำหรับเปลี่ยนข้อความ และ [onPressedSuccessOrError] สำหรับปุ่มตกลงถ่าต้องการทำอะไรก่อนปิด
  ///
  /// ![DialogError](https://sv1.img.in.th/U18n8p.png)
  const CustomDialogWidget({
    Key? key,
    this.insetPadding,
    this.titleWidget,
    this.contentPadding = const EdgeInsets.fromLTRB(16, 0, 16, 24),
    this.title = '',
    this.isTitle = true,
    this.content,
    this.actions,
    this.borderRadius = 32,
    this.dialogTpye = DialogTpye.custom,
    this.labelSuccessOrError,
    this.detailsSuccessOrError,
    this.onPressedSuccessOrError,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: insetPadding != null
          ? const EdgeInsets.all(0)
          : const EdgeInsets.symmetric(horizontal: 40.0, vertical: 24.0),
      title: titleWidget ??
          Row(
            children: isTitle
                ? [
                    Text(title),
                    const Spacer(),
                    Container(
                      decoration: BoxDecoration(
                        color: Palette.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [Palette.shadowButtonX],
                      ),
                      child: Material(
                        borderRadius: BorderRadius.circular(12.0),
                        child: InkWell(
                          onTap: Get.back,
                          borderRadius: BorderRadius.circular(12),
                          child: const Padding(
                            padding: EdgeInsets.all(8),
                            child: Icon(
                              Icons.close,
                              color: Palette.greyIcon,
                            ),
                          ),
                        ),
                      ),
                    )
                  ]
                : [],
          ),
      titleTextStyle: NotoSansThai.h2.copyWith(color: Palette.black),
      titlePadding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      content: dialogTpye == DialogTpye.custom
          ? content
          : Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(
                  dialogTpye == DialogTpye.success
                      ? 'assets/svg/checked.svg'
                      : 'assets/svg/cancel.svg',
                  width: 50,
                  height: 50,
                ),
                SizedBox(height: dialogTpye == DialogTpye.success ? 16 : 8),
                Text(
                  dialogTpye == DialogTpye.success
                      ? labelSuccessOrError ?? 'จองโต๊ะสำเร็จ!'
                      : labelSuccessOrError ?? 'โต๊ะถูกจองแล้วจองแล้ว!',
                  style: NotoSansThai.h3.copyWith(color: Palette.black),
                ),
                Column(
                  children: detailsSuccessOrError != null
                      ? [
                          const SizedBox(
                            height: 4,
                          ),
                          Text(detailsSuccessOrError ?? '',
                              style: NotoSansThai.normal
                                  .copyWith(color: Palette.black2))
                        ]
                      : [],
                )
              ],
            ),
      backgroundColor: Palette.white,
      contentPadding: contentPadding,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius)),
      actionsAlignment: MainAxisAlignment.center,
      actionsPadding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
      actions: dialogTpye == DialogTpye.custom
          ? actions
          : [
              CustomElevatedButton(
                label: 'ตกลง',
                onPressed: () {
                  onPressedSuccessOrError?.call();
                  Get.back();
                },
              )
            ],
    );
  }
}

enum DialogTpye { custom, success, error }
