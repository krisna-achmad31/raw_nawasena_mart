
import 'package:flutter/material.dart';
import 'package:nawasena/components/text.dart';
import 'package:nawasena/constant.dart';

import '../../transfer/transfer_screen.dart';

class FormChoosePayment extends StatefulWidget {
  const FormChoosePayment({
    Key? key,
    this.scrolCtrl,
  }) : super(key: key);

  final ScrollController? scrolCtrl;

  @override
  State<FormChoosePayment> createState() => _FormChooseTelemetryUnitState();
}

class _FormChooseTelemetryUnitState extends State<FormChoosePayment> {
  bool showSearch = false;
  FocusNode? focusNode = FocusNode();

  List payment = [
    'Transfer Bank Mandiri',
    'Transfer Bank BRI',
    'Transfer Bank BCA',
    'Transfer Bank BNI',
    'Transfer Bank Kurir (COD)',
  ];

  @override
  void dispose() {
    focusNode?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
        expand: false,
        initialChildSize: (showSearch == true) ? 0.8 : 0.5,
        maxChildSize: 0.9,
        builder: (context, scrollController) {
          return Scaffold(
            backgroundColor: secondaryColor,
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: secondaryColor,
              title: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.keyboard_arrow_down, color: Colors.white,),
                  ),
                  Expanded(
                    child: Center(
                      child: TextRegular(
                        label: 'Payment Methods',
                        color: Colors.white,
                      ),
                    ),
                  ),
                  // Visibility(
                  //   visible: (showSearch != true) ? true : false,
                  //   replacement: Expanded(
                  //     child: Consumer<AddTelemetryProvider>(
                  //       builder: (context, allProvincieProv, _) {
                  //         return TextFormField(
                  //           focusNode: focusNode,
                  //           onChanged: (value) {
                  //             // allProvincieProv.filterProvince(query: value);
                  //           },
                  //           decoration: const InputDecoration(
                  //             contentPadding: EdgeInsets.symmetric(
                  //                 horizontal: defaultPadding),
                  //           ),
                  //         );
                  //       },
                  //     ),
                  //   ),
                  //   child: Text(
                  //     'Telemetry Key',
                  //   ),
                  // ),
                  // Consumer<AddTelemetryProvider>(
                  //   builder: (context, allProvincieProv, _) {
                  //     return Visibility(
                  //       visible: (allProvincieProv.listAllProvincie == null)
                  //           ? false
                  //           : true,
                  //       child: IconButton(
                  //         onPressed: () {
                  //           focusNode?.requestFocus();
                  //
                  //           setState(() {
                  //             showSearch = !showSearch;
                  //           });
                  //         },
                  //         icon: (showSearch != true)
                  //             ? const Icon(Icons.search)
                  //             : const Icon(Icons.close),
                  //       ),
                  //     );
                  //   },
                  // ),
                ],
              ),
            ),
            body: ListView.builder(
              controller: widget.scrolCtrl,
              keyboardDismissBehavior:
              ScrollViewKeyboardDismissBehavior.onDrag,
              itemCount: payment.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    ListTile(
                      onTap: () {
                        Navigator.pushNamed(context, TransferScreen.routeName);
                      },
                      title: TextRegular(
                        label: '${payment[index]}',
                        color: Colors.white,
                      ),
                      trailing: Icon(Icons.arrow_forward_ios, color: Colors.white,),
                      leading: Padding(padding: EdgeInsets.all(8),child: Image.asset('assets/img_nawasena2.png')),
                    ),
                    Divider(color: Colors.white,)
                  ],
                );
              },
            ),
            // body: AllProvincieConsumer(
            //   child: Consumer<AllProvincieProvider>(
            //     builder: (context, allProvincieProv, _) {
            //       var listAllProvince = allProvincieProv.listAllProvincie;
            //       var filterAllProvince = allProvincieProv.filterAllProvince;
            //
            //       return ListView.builder(
            //         controller: widget.scrolCtrl,
            //         keyboardDismissBehavior:
            //         ScrollViewKeyboardDismissBehavior.onDrag,
            //         itemCount: (filterAllProvince == null)
            //             ? listAllProvince?.length
            //             : filterAllProvince.length,
            //         itemBuilder: (context, index) {
            //           return ListTile(
            //             onTap: () {
            //               var resultUnit = filterAllProvince == null
            //                   ? listAllProvince![index].provincename
            //                   : filterAllProvince[index].provincename;
            //
            //               debugPrint('list $resultUnit');
            //
            //               Navigator.pop(
            //                 context,
            //                 resultUnit,
            //               );
            //             },
            //             title: Text(
            //               filterAllProvince == null
            //                   ? '${listAllProvince![index].provincename}'
            //                   : '${filterAllProvince[index].provincename}',
            //             ),
            //           );
            //         },
            //       );
            //     },
            //   ),
            // ),
          );
        });
  }
}