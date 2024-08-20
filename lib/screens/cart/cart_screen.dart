import 'package:flutter/material.dart';
import 'package:nawasena/components/header_page.dart';
import 'package:nawasena/components/text.dart';
import 'package:nawasena/constant.dart';

import '../transfer/transfer_screen.dart';
import 'components/form_choose_payment.dart';

class CartScreen extends StatelessWidget {
  static const String routeName = '/cartScreen';

  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              color: secondaryColor,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: defaultPadding, right: defaultPadding, top: defaultPadding/2),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextRegular(
                          label: 'Alamat Pengiriman',
                          color: Colors.white,
                          size: 12,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: primaryColor,
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(2),
                            child: TextRegular(
                              label: 'Pilih Alamat Lain',
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              size: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    color: Colors.white,
                    thickness: 2,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: defaultPadding, right: defaultPadding, bottom: defaultPadding / 2),
                    child: TextRegular(
                      label: 'Jl. Jombang, Sumber Nglembung, Kasreman, Kec. Kandangan, Kabupaten Kediri, Jawa Timur 64294',
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
            ListView(
              shrinkWrap: true,
              children: [
                Padding(
                  padding: EdgeInsets.all(defaultPadding),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 37,
                              height: 37,
                              child: Image.asset('assets/ic_sample_icon_nawasena.png'),
                            ),
                            SizedBox(
                              width: defaultPadding / 2,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextRegular(
                                  label: 'Terkombang kambing',
                                  fontWeight: FontWeight.bold,
                                ),
                                TextRegular(
                                  label: 'kaliombo',
                                  size: 12,
                                ),
                              ],
                            )
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.all(defaultPadding),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: SizedBox(
                                  child: Image.asset('assets/img_test_item_nawasena.png'),
                                  width: 96,
                                  height: 96,
                                ),
                              ),
                              SizedBox(width: 8,),
                              Expanded(
                                child: Container(
                                  height: 96,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      TextRegular(
                                        label: 'Kambing Lucu',
                                        size: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          TextRegular(
                                            label: 'Rp. 2.000.000',
                                            size: 12,
                                          ),
                                          Container(
                                            width: 66,
                                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(32), border: Border.all(color: primaryColor)),
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(vertical: 4),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                children: [
                                                  TextRegular(
                                                    label: '- ',
                                                  ),
                                                  TextRegular(
                                                    label: '1',
                                                  ),
                                                  TextRegular(
                                                    label: ' +',
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: secondaryColor,
                                                borderRadius: BorderRadius.circular(32)
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.all(12),
                                                child: TextRegular(
                                                  label: 'Tambahkan Catatan',
                                                  color: Colors.white,
                                                  size: 10,
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 66,
                                            child: Icon(Icons.delete),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Divider(
                          color: secondaryColor,
                        )
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
      bottomSheet: SingleChildScrollView(
        child: Container(
          color: primaryColor,
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextRegular(
                      label: 'Total Tagihan',
                    ),
                    TextRegular(
                      label: 'Rp 600.000,-',
                      size: 24,
                    ),
                  ],
                ),
                InkWell(
                  onTap: () async {
                    var resultTelemetryUnit = await showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      clipBehavior: Clip.hardEdge,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(defBorderRadius * 2),
                          topRight: Radius.circular(defBorderRadius * 2),
                        ),
                      ),
                      builder: (context) {
                        return const FormChoosePayment();
                      },
                    );
                    // Navigator.pushNamed(context, TransferScreen.routeName);
                  },
                  child: Container(
                    decoration: BoxDecoration(color: secondaryColor, borderRadius: BorderRadius.circular(8)),
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: TextRegular(
                        label: 'Pilih Penyambaran',
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
