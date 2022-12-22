// import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:ejarkom/utils/widgets/leading_button.dart';
import 'package:ejarkom/utils/widgets/my_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'pdf_view_logic.dart';
import 'pdf_view_state.dart';

/// @description:
/// @author
/// @date: 2022-10-21 01:52:20
class PdfViewPage extends StatefulWidget {
  PdfViewPage({Key? key,required this.title}) : super(key: key);
  late String title;


  @override
  State<PdfViewPage> createState() => _PdfViewPageState();
}

class _PdfViewPageState extends State<PdfViewPage> {
  final PdfViewLogic logic = Get.put(PdfViewLogic());

  final PdfViewState state = Get.find<PdfViewLogic>().state;
  // PDFDocument? doc;
  // void getL() async {
  //   doc = await PDFDocument.fromURL(
  //       'http://www.africau.edu/images/default/sample.pdf');
  //   setState(() {
  //     _isLoading = false;
  //   });
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // getL();
  }

  bool _isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const LeadingButton(),
        title: Text(
          '${widget.title}'.tr,
          style: Get.textTheme.bodyText1!.copyWith(
            fontSize: 20.sp,
            color: Get.theme.primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Obx(
        () => state.getPdf.value
            ? MyIndicator()
            : PDF().cachedFromUrl(
                state.url,
                placeholder: (progress) => Center(child: Text('$progress %')),
                errorWidget: (error) => Center(child: Text(error.toString())),
              ),
      ),
    );
  }
}
