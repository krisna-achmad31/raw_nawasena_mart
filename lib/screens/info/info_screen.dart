import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:nawasena/components/text.dart';
import 'package:nawasena/constant.dart';

import '../../components/menu_item.dart' as menuItem;

class InfoScreen extends StatefulWidget {
  static const String routeName = '/infoScreen';

  const InfoScreen({Key? key}) : super(key: key);

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {

  GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(defaultPadding),
          child: Column(
            children: [
              FlipCard(
                  key: cardKey,
                  fill: Fill.none,
                  flipOnTouch: false,
                  front: Container(
                      width: double.infinity,
                      height: 210,
                      decoration: BoxDecoration(color: secondaryColor, border: Border.all(color: Colors.black, width: 1), borderRadius: BorderRadius.circular(16)),
                      child: Padding(
                        padding: EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                //TODO use inline to provide data base on state
                                TextRegularExo(
                                  label: 'Achmad Yukrisna A',
                                  size: 16,
                                  color: Colors.white,
                                ),
                                SizedBox(height: 16,),
                                Container(
                                    width: 80,
                                    height: 30,
                                    decoration: BoxDecoration(
                                        color: primaryColor, border: Border.all(color: Colors.transparent, width: 1), borderRadius: BorderRadius.circular(10)),
                                    child: InkWell(
                                      child: Padding(
                                        padding: EdgeInsets.only(top: 4, bottom: 4, left: 8, right: 8),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Image.asset('assets/ic_scan.png', color: Colors.white,),
                                            TextRegularExo(
                                              label: 'Scan',
                                              size: 16,
                                              color: Colors.white,
                                            )
                                          ],
                                        ),
                                      ),
                                      onTap: () {
                                        cardKey.currentState?.toggleCard();
                                      },
                                    ))
                              ],
                            ),
                            Container(
                              width: 138,
                              height: 91,
                              color: Colors.white,
                              child: Icon(Icons.person,),
                            ),
                            SizedBox(height: 8,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextRegularExo(
                                  label: '3506253107950004',
                                  size: 12,
                                  color: Colors.white,
                                ),
                                TextRegularExo(
                                  label: '08574387581',
                                  size: 12,
                                  color: Colors.white,
                                ),
                                TextRegularExo(
                                  label: 'Jl. Dandangan Gendisan 647 Sumber Doko',
                                  size: 12,
                                  color: Colors.white,
                                ),
                              ],
                            )
                            // Row(
                            //   children: [
                            //     Column(
                            //       crossAxisAlignment: CrossAxisAlignment.start,
                            //       children: [
                            //         TextRegularExo(
                            //           label: (myInfoProfileResponse.dataArray.cardNo != null ? myInfoProfileResponse.dataArray.cardNo : 0).toString(),
                            //         ),
                            //         TextRegularExo(
                            //           label: '${myInfoProfileResponse.dataArray.points != null ? myInfoProfileResponse.dataArray.points : 0} pts',
                            //         )
                            //       ],
                            //     ),
                            //     Padding(
                            //       padding: EdgeInsets.only(left: 72),
                            //       child: SizedBox(
                            //         width: 138,
                            //         height: 91,
                            //         child: Image.asset('assets/ic_img_card.png'),
                            //       ),
                            //     )
                            //   ],
                            // ),
                          ],
                        ),
                      )),
                  back: Container(
                    child: Container(
                      width: double.infinity,
                      height: 210,
                      decoration: BoxDecoration(color: secondaryColor, border: Border.all(color: Colors.black, width: 1), borderRadius: BorderRadius.circular(16)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            child: Padding(
                              padding: EdgeInsets.only(left: 16),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(width: 16, height: 12, child: Image.asset('assets/ic_arrow_card.png', color: Colors.white,)),
                                ],
                              ),
                            ),
                            onTap: () {
                              cardKey.currentState?.toggleCard();
                            },
                          ),
                          TextRegularExo(
                            label: 'Kabupaten Kediri',
                            size: 16,
                            color: Colors.white,
                          ),
                          SizedBox(height: 4),
                          TextRegularExo(
                            label: 'Jawa Timur',
                            size: 22,
                            color: Colors.white,
                          ),
                          SizedBox(height: 8),
                          Container(
                            width: double.infinity,
                            height: 55,
                            decoration: BoxDecoration(color: primaryColor),
                            child:Image.asset('assets/img_barcode_nawasena.png'),
                          ),
                          SizedBox(height: 4),
                          TextRegularExo(
                            label: 'Scan your E-Card',
                            size: 10,
                          )
                        ],
                      ),
                    ),
                  )),
              // menuItem.MenuItem(
              //   menuName: 'My Orders',
              //   textSize: 16,
              //   onPressed: () {
              //     // Navigator.pushNamed(context, '/myOrdersPage');
              //   },
              //   menuButtonDividerHidden: true,
              //   menuButtonHidden: false,
              // ),
              menuItem.MenuItem(
                menuName: 'My Profile',
                textSize: 16,
                onPressed: () {
                  // Navigator.pushNamed(context, '/myProfilePage');
                },
                menuButtonDividerHidden: true,
                menuButtonHidden: false,
              ),
              menuItem.MenuItem(
                menuName: 'My Address',
                textSize: 16,
                onPressed: () {
                  // Navigator.pushNamed(context, '/myAddressPage');
                },
                menuButtonDividerHidden: true,
                menuButtonHidden: false,
              ),
              menuItem.MenuItem(
                menuName: 'Terms of Service',
                textSize: 16,
                onPressed: () {
                  // Navigator.pushNamed(context, '/vingeekRewards');
                },
                menuButtonDividerHidden: true,
                menuButtonHidden: false,
              ),
              menuItem.MenuItem(
                menuName: 'Feedback & Survey',
                textSize: 16,
                onPressed: () {
                  // Navigator.pushNamed(context, '/referAndEarn');
                },
                menuButtonDividerHidden: true,
                menuButtonHidden: false,
              ),
              menuItem.MenuItem(
                menuName: 'About Nawasena',
                textSize: 16,
                onPressed: () {
                  // Navigator.pushNamed(context, '/vingeekRewards');
                },
                menuButtonDividerHidden: true,
                menuButtonHidden: false,
              ),
              menuItem.MenuItem(
                menuName: 'Logout',
                textSize: 16,
                onPressed: () {

                },
                menuButtonDividerHidden: true,
                menuButtonHidden: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
