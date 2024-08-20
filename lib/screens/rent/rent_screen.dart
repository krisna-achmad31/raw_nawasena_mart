import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:nawasena/constant.dart';
import 'package:nawasena/screens/detailRent/detail_rent_screen.dart';
import 'package:nawasena/screens/rent/provider/rent_provider.dart';
import 'package:provider/provider.dart';

import '../../components/button.dart';

class RentScreen extends StatefulWidget {
  static const String routeName = '/rentScreen';

  const RentScreen({Key? key}) : super(key: key);

  @override
  State<RentScreen> createState() => _RentScreenState();
}

class _RentScreenState extends State<RentScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: RentProvider(),
      child: Consumer<RentProvider>(
        builder: (context, rentProvider, child){
          return Scaffold(
            body: Padding(
              padding: EdgeInsets.only(left: 8, right: 8),
              child: ListView(
                children: [
                  SizedBox(height: 16,),
                  Container(
                    child: CarouselSlider(
                      options: CarouselOptions(
                        autoPlay: true,
                        height: 250.0,
                        aspectRatio: 16 / 4,
                        viewportFraction: 0.70,
                        enlargeCenterPage: true,
                        onPageChanged: (index, reason) {
                          // print(explorePageController.itemRecommendationTv[index].posterPath);
                          rentProvider.reload(index);
                          rentProvider.changeIndex(index);
                          // rentProvider.loading(false);
                        },
                      ),
                      carouselController: rentProvider.carouselController,
                      items: rentProvider.bannerNews,
                    ),
                  ),
                  Text('Popular Rent Categories', style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Container(
                            width: 64,
                            height: 64,
                            decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(8),
                              child: Image.asset('assets/ic_car.png', color: Colors.white,),
                            ),
                          ),
                          Text('Car', style: TextStyle(
                              color: primaryColor
                          ),)
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            width: 64,
                            height: 64,
                            decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(8),
                              child: Image.asset('assets/ic_motorcycle.png', color: Colors.white,),
                            ),
                          ),
                          Text('Motorcycle', style: TextStyle(
                              color: primaryColor
                          ),)
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            width: 64,
                            height: 64,
                            decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(8),
                              child: Image.asset('assets/ic_truck.png', color: Colors.white,),
                            ),
                          ),
                          Text('Truck', style: TextStyle(
                              color: primaryColor
                          ),)
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            width: 64,
                            height: 64,
                            decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(8),
                              child: Image.asset('assets/ic_stick.png', color: Colors.white,),
                            ),
                          ),
                          Text('Console', style: TextStyle(
                              color: primaryColor
                          ),)
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text('Discover A Glorious Car', style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold)),
                            InkWell(
                              onTap: () {
                                // homeController.toListPage('Food');
                              },
                              child: Text(
                                'View all...',
                                style: TextStyle(color: Colors.black),
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 8),
                        SizedBox(
                          height: 200,
                          width: double.infinity,
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context, int index) {
                              return Row(
                                children: [
                                  InkWell(
                                    onTap: () async {
                                      Navigator.pushNamed(context, DetailRentScreen.routeName);
                                    },
                                    child: SizedBox(
                                      child: Padding(
                                        padding: EdgeInsets.all(16),
                                        child: Stack(
                                          children: [
                                            Column(
                                              children: [
                                                SizedBox(width: 100, height: 32,),
                                                Container(
                                                  width: 110,
                                                  height: 100,
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(16),
                                                    boxShadow: [
                                                      BoxShadow(
                                                          color: Colors.grey.withOpacity(0.5),
                                                          spreadRadius: 5,
                                                          blurRadius: 7,
                                                          offset: Offset(0, 3)
                                                      )
                                                    ],

                                                  ),
                                                ),
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                Container(
                                                  width: 110,
                                                  height: 100,
                                                  child: ClipRRect(
                                                    borderRadius: BorderRadius.circular(16),
                                                    child: CachedNetworkImage(
                                                      imageUrl:
                                                      'https://i.ibb.co/DwPNH7J/ic-truck-nawasena.png',
                                                      placeholder: (context, url) => const Center(
                                                        child:
                                                        CircularProgressIndicator.adaptive(),
                                                      ),
                                                      // errorWidget: (context, url, error) =>
                                                      //     Image.asset(
                                                      //         'assets/images/error_agent_pict.png'),
                                                      // fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                                // Container(
                                                //   width: 110,
                                                //   height: 100,
                                                //   decoration: BoxDecoration(
                                                //       borderRadius: BorderRadius.circular(16),
                                                //       image: DecorationImage(
                                                //         image: NetworkImage(
                                                //           'https://i.ibb.co/DwPNH7J/ic-truck-nawasena.png',
                                                //         ),
                                                //         fit: BoxFit.fill,
                                                //       )
                                                //   ),
                                                // ),
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text('Daihatsu', style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 14
                                                    ),),
                                                    SizedBox(height: 8,),
                                                    Text('Rp. 1.000.000/hari', style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 8
                                                    ),),

                                                  ],
                                                )
                                                // Padding(
                                                //   padding: EdgeInsets.only(left: 16, right: 16),
                                                //   child: Row(
                                                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                //     children: [
                                                //       Column(
                                                //         crossAxisAlignment: CrossAxisAlignment.start,
                                                //         children: [
                                                //           Text('Daihatsu', style: TextStyle(
                                                //               color: Colors.white,
                                                //             fontSize: 14
                                                //           ),),
                                                //           SizedBox(height: 8,),
                                                //           Text('Rp. 1.000.000/hari', style: TextStyle(
                                                //               color: Colors.white,
                                                //             fontSize: 8
                                                //           ),),
                                                //
                                                //         ],
                                                //       ),
                                                //       Container(
                                                //         width: 128,
                                                //         child: BasicButton(
                                                //           label: 'Pinjam',
                                                //           borderColor: Colors.transparent,
                                                //           backgroundColor: primaryColor,
                                                //           textColor: Colors.white,
                                                //           onPressed: () {
                                                //
                                                //           },
                                                //         ),
                                                //       )
                                                //     ],
                                                //   ),
                                                // )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 2,)
                                ],
                              );
                            },
                            itemCount: 5,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text('Discover A Motorcycle', style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold)),
                            InkWell(
                              onTap: () {
                                // homeController.toListPage('Food');
                              },
                              child: Text(
                                'View all...',
                                style: TextStyle(color: Colors.black),
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 8),
                        SizedBox(
                          height: 200,
                          width: double.infinity,
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context, int index) {
                              return Row(
                                children: [
                                  SizedBox(
                                    child: Padding(
                                      padding: EdgeInsets.all(16),
                                      child: Stack(
                                        children: [
                                          Column(
                                            children: [
                                              SizedBox(width: 100, height: 32,),
                                              Container(
                                                width: 110,
                                                height: 100,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(16),
                                                  boxShadow: [
                                                    BoxShadow(
                                                        color: Colors.grey.withOpacity(0.5),
                                                        spreadRadius: 5,
                                                        blurRadius: 7,
                                                        offset: Offset(0, 3)
                                                    )
                                                  ],

                                                ),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              Container(
                                                width: 110,
                                                height: 100,
                                                child: ClipRRect(
                                                  borderRadius: BorderRadius.circular(16),
                                                  child: CachedNetworkImage(
                                                    imageUrl:
                                                    'https://i.ibb.co/PQRGrvr/Yamaha-Motorcycle-PNG-Download-Image.png',
                                                    placeholder: (context, url) => const Center(
                                                      child:
                                                      CircularProgressIndicator.adaptive(),
                                                    ),
                                                    // errorWidget: (context, url, error) =>
                                                    //     Image.asset(
                                                    //         'assets/images/error_agent_pict.png'),
                                                    // fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                              // Container(
                                              //   width: 110,
                                              //   height: 100,
                                              //   decoration: BoxDecoration(
                                              //       borderRadius: BorderRadius.circular(16),
                                              //       image: DecorationImage(
                                              //         image: NetworkImage(
                                              //           'https://i.ibb.co/DwPNH7J/ic-truck-nawasena.png',
                                              //         ),
                                              //         fit: BoxFit.fill,
                                              //       )
                                              //   ),
                                              // ),
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text('Yamaha ZR', style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 14
                                                  ),),
                                                  SizedBox(height: 8,),
                                                  Text('Rp. 400.000/hari', style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 8
                                                  ),),

                                                ],
                                              )
                                              // Padding(
                                              //   padding: EdgeInsets.only(left: 16, right: 16),
                                              //   child: Row(
                                              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              //     children: [
                                              //       Column(
                                              //         crossAxisAlignment: CrossAxisAlignment.start,
                                              //         children: [
                                              //           Text('Daihatsu', style: TextStyle(
                                              //               color: Colors.white,
                                              //             fontSize: 14
                                              //           ),),
                                              //           SizedBox(height: 8,),
                                              //           Text('Rp. 1.000.000/hari', style: TextStyle(
                                              //               color: Colors.white,
                                              //             fontSize: 8
                                              //           ),),
                                              //
                                              //         ],
                                              //       ),
                                              //       Container(
                                              //         width: 128,
                                              //         child: BasicButton(
                                              //           label: 'Pinjam',
                                              //           borderColor: Colors.transparent,
                                              //           backgroundColor: primaryColor,
                                              //           textColor: Colors.white,
                                              //           onPressed: () {
                                              //
                                              //           },
                                              //         ),
                                              //       )
                                              //     ],
                                              //   ),
                                              // )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 2,)
                                ],
                              );
                            },
                            itemCount: 5,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text('Discover A Console', style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold)),
                            InkWell(
                              onTap: () {
                                // homeController.toListPage('Food');
                              },
                              child: Text(
                                'View all...',
                                style: TextStyle(color: Colors.black),
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 8),
                        SizedBox(
                          height: 200,
                          width: double.infinity,
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context, int index) {
                              return Row(
                                children: [
                                  SizedBox(
                                    child: Padding(
                                      padding: EdgeInsets.all(16),
                                      child: Stack(
                                        children: [
                                          Column(
                                            children: [
                                              SizedBox(width: 100, height: 32,),
                                              Container(
                                                width: 110,
                                                height: 100,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(16),
                                                  boxShadow: [
                                                    BoxShadow(
                                                        color: Colors.grey.withOpacity(0.5),
                                                        spreadRadius: 5,
                                                        blurRadius: 7,
                                                        offset: Offset(0, 3)
                                                    )
                                                  ],

                                                ),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              Container(
                                                width: 110,
                                                height: 100,
                                                child: ClipRRect(
                                                  borderRadius: BorderRadius.circular(16),
                                                  child: CachedNetworkImage(
                                                    imageUrl:
                                                    'https://i.ibb.co/qg4QyqF/PS5-Digital-Edition.png',
                                                    placeholder: (context, url) => const Center(
                                                      child:
                                                      CircularProgressIndicator.adaptive(),
                                                    ),
                                                    // errorWidget: (context, url, error) =>
                                                    //     Image.asset(
                                                    //         'assets/images/error_agent_pict.png'),
                                                    // fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                              // Container(
                                              //   width: 110,
                                              //   height: 100,
                                              //   decoration: BoxDecoration(
                                              //       borderRadius: BorderRadius.circular(16),
                                              //       image: DecorationImage(
                                              //         image: NetworkImage(
                                              //           'https://i.ibb.co/DwPNH7J/ic-truck-nawasena.png',
                                              //         ),
                                              //         fit: BoxFit.fill,
                                              //       )
                                              //   ),
                                              // ),
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text('PS 5', style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 14
                                                  ),),
                                                  SizedBox(height: 8,),
                                                  Text('Rp. 200.000/hari', style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 8
                                                  ),),

                                                ],
                                              )
                                              // Padding(
                                              //   padding: EdgeInsets.only(left: 16, right: 16),
                                              //   child: Row(
                                              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              //     children: [
                                              //       Column(
                                              //         crossAxisAlignment: CrossAxisAlignment.start,
                                              //         children: [
                                              //           Text('Daihatsu', style: TextStyle(
                                              //               color: Colors.white,
                                              //             fontSize: 14
                                              //           ),),
                                              //           SizedBox(height: 8,),
                                              //           Text('Rp. 1.000.000/hari', style: TextStyle(
                                              //               color: Colors.white,
                                              //             fontSize: 8
                                              //           ),),
                                              //
                                              //         ],
                                              //       ),
                                              //       Container(
                                              //         width: 128,
                                              //         child: BasicButton(
                                              //           label: 'Pinjam',
                                              //           borderColor: Colors.transparent,
                                              //           backgroundColor: primaryColor,
                                              //           textColor: Colors.white,
                                              //           onPressed: () {
                                              //
                                              //           },
                                              //         ),
                                              //       )
                                              //     ],
                                              //   ),
                                              // )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 2,)
                                ],
                              );
                            },
                            itemCount: 5,
                          ),
                        )
                      ],
                    ),
                  )

                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
