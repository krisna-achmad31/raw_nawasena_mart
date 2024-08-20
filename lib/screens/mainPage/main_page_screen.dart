
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:nawasena/constant.dart';
import 'package:nawasena/screens/cart/cart_screen.dart';
import 'package:nawasena/screens/explore/explore_screen.dart';
import 'package:nawasena/screens/home/home_screen.dart';
import 'package:nawasena/screens/info/info_screen.dart';
import 'package:nawasena/screens/laporan/laporan_screen.dart';
import 'package:nawasena/screens/mainPage/provider/main_page_provider.dart';
import 'package:nawasena/screens/rent/rent_screen.dart';
import 'package:provider/provider.dart';

import '../../components/bottom_nav.dart';
import '../../components/list_body_bottom_nav.dart';
import '../../components/text.dart';

class MainPageScreen extends StatefulWidget {
  static const routeName = '/mainPage';

  const MainPageScreen({Key? key}) : super(key: key);

  @override
  State<MainPageScreen> createState() => _MainPageScreenState();
}

class _MainPageScreenState extends State<MainPageScreen> {

  var rmicons = false;
  var extendss = false;

  late int currentIndex = 0;
  int? progress = 0;

  buildBottomNavigationMenu(context) {
    return Container(width: 128, height: 128,child: Image.asset('assets/img_kediri1.png'),);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: AppBar(
          iconTheme: IconThemeData(color: Color(0xFF323232)),
          backgroundColor: secondaryColor,
          elevation: 0,
        ),
      ),
      floatingActionButton: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            width: 80,
            height: 80,
            child: Center(child: Image.asset('assets/ic_logo_full.png')),
          ),
          Container(
            width: 60,
            height: 60,
            child: SpeedDial(
              icon: null,
              backgroundColor: Colors.transparent,
              overlayColor: Colors.transparent,
              activeBackgroundColor: Colors.transparent,
              activeForegroundColor: Colors.transparent,
              activeIcon: null,
              overlayOpacity: 0.1,
              spacing: 3,
              elevation: 0,
              onOpen: () {
                setState(() {
                  extendss = true;
                });
              },
              onClose: () {
                setState(() {
                  extendss = false;
                });
              },
              children: [
                SpeedDialChild(
                  child: !rmicons ? const Icon(Icons.call) : null,
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  label: 'Call Center',
                  onTap: () => setState(() => rmicons = !rmicons),
                  onLongPress: () => debugPrint('FIRST CHILD LONG PRESS'),
                ),
                SpeedDialChild(
                  child: !rmicons ? const Icon(Icons.message_outlined) : null,
                  backgroundColor: Colors.deepOrange,
                  foregroundColor: Colors.white,
                  label: 'Layanan Halo Mas Bup',
                  onTap: () {
                    Navigator.pushNamed(context, LaporanScreen.routeName);
                  },
                ),
                // SpeedDialChild(
                //   child: !rmicons ? const Icon(Icons.margin) : null,
                //   backgroundColor: Colors.indigo,
                //   foregroundColor: Colors.white,
                //   label: 'Laporan Terkait Minyak Goreng',
                //   visible: true,
                //   onTap: () => ScaffoldMessenger.of(context).showSnackBar(
                //       const SnackBar(content: Text(("Third Child Pressed")))),
                //   onLongPress: () => debugPrint('THIRD CHILD LONG PRESS'),
                // ),
              ],
              // label: Text('Halo Mas Bup'),
            ),
          ),
        ],
      ),
      body:SafeArea(
        child: Column(
          children: [
            Container(
              color: secondaryColor,
              height: 50,
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
                child: Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 40,
                        child: WhiteOutlinedTextField(
                          autofocus: false,
                          hintText: 'Find a something incredible...',
                          maxLines: 1,
                          functionMove: (value) {},
                        ),
                      ),
                    ),
                    Container(
                      height: 34,
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 16),
                            child: InkWell(
                              onTap: () {

                              },
                              child: Image.asset(
                                'assets/ic_notification_bell.png',
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 13),
                            child: InkWell(
                                onTap: () {
                                  Navigator.pushNamed(context, CartScreen.routeName);
                                },
                                child: Image.asset(
                                  'assets/ic_cart.png',
                                  color: Colors.white,
                                )),
                          ),
                        ],
                      ),
                    ),

                  ],
                ),
              ),
            ),
            Expanded(child: listBodyBottomNavBar.elementAt(currentIndex))
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 25,
        selectedItemColor: blueColorFED,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        items: bottomNavItem,
      ),
    );
    //   ChangeNotifierProvider.value(
    //   value: MainPageProvider(),
    //   child: Scaffold(
    //     floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    //     floatingActionButton: buildBottomNavigationMenu(context),
    //     extendBody: true,
    //     // bottomNavigationBar: buildBottomNavigationMenu(context),
    //     body: Consumer<MainPageProvider>(
    //       builder: (context, mainPageProvider, child){
    //         return IndexedStack(
    //           index: mainPageProvider.children,
    //           children: [HomeScreen(), RentScreen(), ExploreScreen(), InfoScreen()],
    //         );
    //       },
    //     ),
    //   ),
    // );
  }
}
