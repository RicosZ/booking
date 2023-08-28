import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/notosansthai.dart';


class CustomElevatedButton extends StatelessWidget {
  ///ข้อความที่ปุ่ม
  final String label;

  ///funtion ที่ทำงานตอนกด
  final VoidCallback? onPressed;

  ///สีปุ่ม
  final Color backgroundColor;

  ///กำหนดมุมปุ่มเอง
  final double radius;

  ///icon ด้านซ้าย
  final IconData? iconLeft;

  ///icon ด้านขวา
  final IconData? iconRight;

  ///style ข้อความที่ปุ่ม
  final TextStyle? labelStyle;

  ///เปิดปิดปุ่ม
  final bool isEnabled;

  ///เพิ่มความหนาของปุ่มแบบ L
  final bool isThicker;

  ///กำหนดความสูงเอง
  final double? height;

  ///กำหนดระยะห่างเอง
  final EdgeInsetsGeometry? padding;

  /// # CustomElevatedButton แบบปกติ
  ///
  /// ![CustomElevatedButton](https://sv1.img.in.th/UpLszt.png)
  ///
  /// CustomElevatedButton ถ้าสร้างขึ้นมาแบบ
  /// ```dart
  /// CustomElevatedButton()
  /// ```
  /// จะเป็นปุ่มแบบ disable ต้องเพิ่ม onPressed เพิ่มให้เป็น Enabled ❗
  /// ```dart
  /// CustomElevatedButton(onPressed:(){})
  /// ```
  /// isThicker
  ///
  /// ![isThicker](https://sv1.img.in.th/UCn25J.png)

  const CustomElevatedButton({
    Key? key,
    this.label = 'label',
    this.onPressed,
    this.backgroundColor = Palette.mainGreen,
    this.radius = 16,
    this.iconLeft,
    this.iconRight,
    this.labelStyle,
    this.isEnabled = true,
    this.isThicker = false,
    this.height,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isEnabled && onPressed != null ? onPressed : null,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        padding: padding,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(radius))),
        fixedSize: height != null
            ? Size.fromHeight(height!)
            : isThicker
                ? const Size.fromHeight(56)
                : const Size.fromHeight(45),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            child:
                iconLeft != null ? Icon(iconLeft, color: Palette.white) : null,
          ),
          iconLeft != null ? const SizedBox(width: 8) : const SizedBox(),
          Text(
            label,
            style: labelStyle ??
                NotoSansThai.h3.copyWith(
                    color: (isEnabled && onPressed != null)
                        ? Palette.white
                        : Palette.grey1),
          ),
          iconRight != null ? const SizedBox(width: 8) : const SizedBox(),
          SizedBox(
            child: iconRight != null
                ? Icon(iconRight, color: Palette.white)
                : null,
          ),
        ],
      ),
    );
  }
}
