import 'dart:async';
import 'package:booking/modules/widgets/add_information.dart';
import 'package:cloudinary/cloudinary.dart';
import 'package:file_picker/_internal/file_picker_web.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:gsheets/gsheets.dart';
import 'package:image_downloader_web/image_downloader_web.dart';

import '../../api/api.dart';
import '../../constants/sheet_credentials.dart';
import '../../models/data_model.dart';
import '../widgets/custom_dialog_widget.dart';

class HomeController extends GetxController {
  var data = <BookedData>[].obs;
  var isLoading = true.obs;

  final key = GlobalKey<FormBuilderState>();

  final gsheets = GSheets(Credential.sheet);
  Spreadsheet? sheet;
  Worksheet? worksheet;

  final ScrollController horizontal = ScrollController(),
      vertical = ScrollController();
  late Timer timer;
  @override
  Future<void> onInit() async {
    sheet = await gsheets.spreadsheet(Credential.sheetId);
    worksheet = sheet!.worksheetByTitle('sheet1');

    await getInformation();
    timer = Timer.periodic(const Duration(minutes: 1), (t) {
      refreshInformation();
    });
    super.onInit();
  }

  @override
  Future<void> onReady() async {
    super.onReady();
  }

  @override
  void onClose() {
    timer.cancel();
  }

  getInformation() async {
    data.clear();
    isLoading(true);
    await Api().fetchAll().then((value) => data.assignAll(value.data!));
    data.refresh();
    isLoading(false);
  }

  refreshInformation() async {
    await Api().fetchAll().then((value) => data.assignAll(value.data!));
    data.refresh();
  }

  var isAdding = false.obs;
  addInformation({required int index}) async {
    isAdding(true);
    await refreshInformation();
    if (checkEmptyTable(index: index)) {
      var booker = ''.obs;
      for (var i = 1; i <= 10; i++) {
        booker.value +=
            '${key.currentState?.fields['name$i']?.value},${key.currentState?.fields['gen$i']?.value},${key.currentState?.fields['tel$i']?.value}/';
      }
      await uploadImage(bytes: imgByte!);
      worksheet!.values.insertRow(index + 1, [
        index,
        booker.value,
        imageUrl.value,
      ]).then((value) async => refreshInformation());
      isAdding(false);
      Get.close(2);
      InformationPopup().ticket(index: index);
    } else {
      Get.back();
      Get.dialog(const CustomDialogWidget(
        dialogTpye: DialogTpye.error,
      ));
    }
  }

  final imgName = ''.obs;
  Uint8List? imgByte;
  var isPickedImage = false.obs;
  pickImage() async {
    final image = await FilePickerWeb.platform.pickFiles(type: FileType.image);
    if (image != null) {
      imgByte = image.files.single.bytes;
      imgName.value = image.files.single.name;
      isPickedImage(true);
      update();
    }
  }

  final cloudinary = Cloudinary.signedConfig(
    apiKey: '869156898417145',
    apiSecret: 'bveN4y6Frr5I-YiW32bqEWRWC8s',
    cloudName: 'dxwf1degv',
  );
  var imageUrl = ''.obs;
  uploadImage({required Uint8List bytes}) async {
    final res = await cloudinary.upload(
      fileBytes: bytes,
      resourceType: CloudinaryResourceType.image,
      folder: 'booked',
    );
    if (res.isSuccessful) {
      imageUrl.value = res.secureUrl.toString();
    }
  }

  bool checkEmptyTable({required int index}) {
    if (data.isNotEmpty) {
      if (data[index - 1].booker == '' && data[index - 1].slip == '') {
        return true;
      }
      return false;
    }
    return false;
  }

  String getBooker({String? bookers, int? index = 0}) {
    if (bookers != '') {
      final booker = bookers?.split('/');
      return booker![index! - 1];
    }
    return '';
  }

  String splitBooker({String? booker, required int index}) {
    if (booker != '') {
      final split = booker?.split(',');
      return split?[index] ?? '';
    }
    return '';
  }

  Future<void> downloadImage({required String imagePath}) async {
    ByteData imageData = await rootBundle.load(imagePath);
    await WebImageDownloader.downloadImageFromUInt8List(
        name: 'Ticket.png', uInt8List: imageData.buffer.asUint8List());
  }
}
