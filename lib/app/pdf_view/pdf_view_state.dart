// import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:ejarkom/utils/http_manager/main_screen_http.dart';
import 'package:get/get.dart';

/// @description:
/// @author
/// @date: 2022-10-21 01:52:20
class PdfViewState {
  PdfViewState() {
    mainScreenHTTP = MainScreenHTTP();
  }
  // late PDFDocument pdfDocument;
  RxBool getPdf = false.obs;
  late MainScreenHTTP mainScreenHTTP;
  late String url;
}
