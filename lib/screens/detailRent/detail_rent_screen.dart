import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nawasena/constant.dart';
import 'package:nawasena/screens/transfer/transfer_screen.dart';

import '../../components/header_page.dart';
import '../../components/text.dart';

class DetailRentScreen extends StatelessWidget {
  static const String routeName = '/rentDetail';

  const DetailRentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            child: Stack(
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 40,
                    ),
                    Container(
                      width: double.infinity,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: CachedNetworkImage(
                          imageUrl: 'https://i.ibb.co/DwPNH7J/ic-truck-nawasena.png',
                          placeholder: (context, url) => const Center(
                            child: CircularProgressIndicator.adaptive(),
                          ),
                          // errorWidget: (context, url, error) =>
                          //     Image.asset(
                          //         'assets/images/error_agent_pict.png'),
                          // fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
                Positioned(
                  top: 20,
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.only(top: 32, left: 16),
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: FadeIn(
                          child: Container(
                            width: 90,
                            height: 32,
                            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(32)),
                            child: Row(children: [
                              SizedBox(
                                width: 24,
                                height: 24,
                                child: Image.asset(
                                  "assets/ic_backs.png",
                                  color: primaryColor,
                                ),
                              ),
                              TextRegularExo(
                                label: 'Go back',
                                fontWeight: FontWeight.w600,
                                color: primaryColor,
                              )
                            ]),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(defaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextRegularExo(
                  label: 'Avanza Tahun 2022',
                  size: 24,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(
                  height: 8,
                ),
                TextRegularExo(
                  label: 'Rp. 50.000/jam',
                  size: 24,
                ),
                SizedBox(
                  height: 24,
                ),
                TextRegular(
                  label: 'Syarat Pinjam : \n 1. Usia lebih dari 17 tahun \n 2. Memiliki SIM \n 3. Memberikan KTP Sebagai Jaminan',
                  size: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ],
            ),
          )
        ],
      ),
      bottomSheet: Container(
        height: 149,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Divider(
              color: grayColor,
              thickness: 2,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextRegular(
                        label: 'Jumlah Unit',
                      ),
                      Row(
                        children: [
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
                          SizedBox(
                            width: 8,
                          ),
                          TextRegular(
                            label: 'Unit',
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextRegular(
                        label: 'Durasi Pinjam',
                      ),
                      Row(
                        children: [
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
                          SizedBox(
                            width: 8,
                          ),
                          TextRegular(
                            label: 'Jam',
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                ],
              ),
            ),
            Container(
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
                      onTap: (){
                        Navigator.pushNamed(context, TransferScreen.routeName);
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
            )
          ],
        ),
      ),
    );
  }
}
