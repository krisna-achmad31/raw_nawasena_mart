import 'package:cached_network_image/cached_network_image.dart';
import 'package:drop_shadow/drop_shadow.dart';
import 'package:flutter/material.dart';
import 'package:nawasena/constant.dart';
import 'package:nawasena/screens/detailItem/detail_item_screen.dart';
import 'package:nawasena/screens/home/provider/home_provider.dart';
import 'package:provider/provider.dart';
import 'package:skeletons/skeletons.dart';

import '../../components/button.dart';
import '../../components/text.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/homeScreen';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: HomeProvider(),
      child: Consumer<HomeProvider>(
        builder: (context, homeProvider, child) {
          return Stack(
            children: [

              ListView(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Stack(
                        children: [
                          Container(
                            width: double.infinity,
                            height: 220,
                            decoration: BoxDecoration(color: secondaryColor, borderRadius: BorderRadius.vertical(bottom: Radius.elliptical(MediaQuery.of(context).size.width, 50.0))),
                          ),
                          Padding(
                            padding: EdgeInsets.all(defaultPadding),
                            child: Column(
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Hello Krisna, ',
                                          style: TextStyle(color: Colors.white, fontSize: 32),
                                        ),
                                        // Container(
                                        //   width: 50,
                                        //   height: 50,
                                        //   decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
                                        //   child: const Icon(Icons.person),
                                        // )
                                      ],
                                    ),
                                    SizedBox(height: 8,),
                                    Text(
                                      'Selamat datang di super app Kabupaten Kediri',
                                      style: TextStyle(color: Colors.white, fontSize: 13),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                // WhiteOutlinedTextField(
                                //   autofocus: false,
                                //   hintText: 'Find a something incredible...',
                                //   maxLines: 1,
                                //   functionMove: (value) {},
                                // ),
                                // const SizedBox(
                                //   height: 32,
                                // ),
                                const SizedBox(
                                  height: 32,
                                ),
                                Container(
                                  height: 160,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Stack(children: [
                                    Row(children: [
                                      const Spacer(),
                                      SizedBox(
                                        height: 160,
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(10),
                                          child: Image.asset(
                                            'assets/img_test.png',
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                    ]),
                                    Container(
                                      height: 160,
                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), image: const DecorationImage(image: AssetImage('assets/img_background_news.png'), fit: BoxFit.fill)),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8, right: 80, top: 8, bottom: 8),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              TextRegularLancelot(label: 'Lomba lato - lato untuk anak Desa Sumber Doko', color: Colors.white, size: 24),
                                              const SizedBox(height: 4),
                                              const Text('23 February 2023', style: TextStyle(color: Colors.white)),
                                            ],
                                          ),
                                          BasicButton(
                                            label: 'Detail',
                                            horizontal: 4,
                                            vertical: 0,
                                            textColor: Colors.white,
                                            borderColor: Colors.transparent,
                                            onPressed: () {
                                              // homeController.toNewsDetailPage();
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ]),
                                ),
                                const SizedBox(
                                  height: 61,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                const Text('Find A Unique Thing', style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold)),
                                InkWell(
                                  onTap: () {},
                                  child: const Text(
                                    'View all...',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(height: 8),
                          homeProvider.stateAll == ResultAllState.loading
                              ? SizedBox(
                                  height: 170,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (BuildContext context, int index) {
                                      return itemShimmer();
                                    },
                                    itemCount: 5,
                                  ),
                                )
                              : SizedBox(
                                  height: 170,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (BuildContext context, int index) {
                                      return itemRecommendation(
                                        homeProvider.itemsAll![index].productImage,
                                        homeProvider.itemsAll![index].productName,
                                        homeProvider.itemsAll![index].productPrice.toString(),
                                        homeProvider.itemsAll![index].productCategories.toString(),
                                        homeProvider.itemsAll![index].productId,
                                        context
                                      );
                                    },
                                    itemCount: homeProvider.itemsAll!.length,
                                  ),
                                ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text('Find A Fertilizer For Earth', style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold)),
                                  InkWell(
                                    onTap: () {
                                      // homeController.toListPage('Pupuk');
                                    },
                                    child: Text(
                                      'View all...',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(height: 8),
                            homeProvider.statePupuk == ResultPupukState.loading
                                ? SizedBox(
                                    height: 170,
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (BuildContext context, int index) {
                                        return itemShimmer();
                                      },
                                      itemCount: 5,
                                    ),
                                  )
                                : SizedBox(
                                    height: 170,
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (BuildContext context, int index) {
                                        return itemRecommendation(
                                          homeProvider.itemsPupuk![index].productImage,
                                          homeProvider.itemsPupuk![index].productName,
                                          homeProvider.itemsPupuk![index].productPrice.toString(),
                                          homeProvider.itemsPupuk![index].productCategories.toString(),
                                          homeProvider.itemsPupuk![index].productId,
                                          context
                                        );
                                      },
                                      itemCount: homeProvider.itemsPupuk!.length,
                                    ),
                                  ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text('Discover A Great Food', style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold)),
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
                            ),
                            SizedBox(height: 8),
                            homeProvider.stateFood == ResultFoodState.loading
                                ? SizedBox(
                                    height: 170,
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (BuildContext context, int index) {
                                        return itemShimmer();
                                      },
                                      itemCount: 5,
                                    ),
                                  )
                                : SizedBox(
                                    height: 170,
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (BuildContext context, int index) {
                                        return itemRecommendation(
                                          homeProvider.itemsFood![index].productImage,
                                          homeProvider.itemsFood![index].productName,
                                          homeProvider.itemsFood![index].productPrice.toString(),
                                          homeProvider.itemsFood![index].productCategories.toString(),
                                          homeProvider.itemsFood![index].productId,
                                          context
                                        );
                                      },
                                      itemCount: homeProvider.itemsFood!.length,
                                    ),
                                  ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text('Find A Best Drink', style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold)),
                                  InkWell(
                                    onTap: () {
                                      // homeController.toListPage('Drink');
                                    },
                                    child: Text(
                                      'View all...',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(height: 8),
                            homeProvider.stateDrink == ResultDrinkState.loading
                                ? SizedBox(
                              height: 170,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (BuildContext context, int index) {
                                  return itemShimmer();
                                },
                                itemCount: 5,
                              ),
                            )
                                : SizedBox(
                              height: 170,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (BuildContext context, int index) {
                                  return itemRecommendation(
                                    homeProvider.items![index].productImage,
                                    homeProvider.items![index].productName,
                                    homeProvider.items![index].productPrice.toString(),
                                    homeProvider.items![index].productCategories.toString(),
                                    homeProvider.items![index].productId,
                                    context
                                  );
                                },
                                itemCount: homeProvider.items!.length,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 96,
                      ),
                    ],
                  ),
                ],
              )
            ],
          );
        },
      ),
    );
  }

  Widget itemRecommendation(String picture, String name, String price, String cat, int id, BuildContext context) {
    print(picture);
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, DetailItemScreen.routeName);
        // homeController.toDetailPage(cat, id);
      },
      child: Row(
        children: [
          const SizedBox(
            width: 16,
          ),
          DropShadow(
            blurRadius: 1,
            offset: const Offset(1, 2),
            spread: 1,
            child: Container(
              decoration: BoxDecoration(color: Colors.grey.shade100, borderRadius: BorderRadius.circular(10), border: Border.all(color: Colors.grey.withOpacity(0.2))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Container(
                      width: 100,
                      height: 100,
                      // child: ClipRRect(
                      //   borderRadius: BorderRadius.circular(16),
                      //   child: CachedNetworkImage(
                      //     imageUrl: '${picture}',
                      //     placeholder: (context, url) => const Center(
                      //       child:
                      //       CircularProgressIndicator.adaptive(),
                      //     ),
                      //     // errorWidget: (context, url, error) =>
                      //     //     Image.asset(
                      //     //         'assets/images/error_agent_pict.png'),
                      //     fit: BoxFit.cover,
                      //   ),
                      // ),
                      decoration: BoxDecoration(
                          color: Colors.white38,
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(picture),
                          )),
                    ),
                  ),
                  Text(
                    name,
                    style: const TextStyle(color: secondaryColor),
                  ),
                  Text(
                    'Rp. $price',
                    style: const TextStyle(color: secondaryColor),
                  ),
                  // Padding(
                  //   padding: EdgeInsets.all(0),
                  //   child: Column(
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     children: [
                  //       TextRegularLancelot(
                  //         label: '$name',
                  //         color: Colors.white,
                  //       ),
                  //       TextRegularExo(
                  //         label: 'Rp. $price',
                  //         color: Colors.white,
                  //         size: 11,
                  //         fontWeight: FontWeight.w800,
                  //       )
                  //     ],
                  //   ),
                  // )
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }

  Widget itemShimmer() {
    return InkWell(
      onTap: () {
        // homeController.toDetailPage(cat, id);
      },
      child: Row(
        children: [
          DropShadow(
            blurRadius: 1,
            offset: const Offset(1, 2),
            spread: 1,
            child: Container(
              decoration: BoxDecoration(color: Colors.grey.shade100, borderRadius: BorderRadius.circular(10), border: Border.all(color: Colors.grey.withOpacity(0.2))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Container(
                      width: 100,
                      height: 100,
                      // child: ClipRRect(
                      //   borderRadius: BorderRadius.circular(16),
                      //   child: CachedNetworkImage(
                      //     imageUrl: '${picture}',
                      //     placeholder: (context, url) => const Center(
                      //       child:
                      //       CircularProgressIndicator.adaptive(),
                      //     ),
                      //     // errorWidget: (context, url, error) =>
                      //     //     Image.asset(
                      //     //         'assets/images/error_agent_pict.png'),
                      //     fit: BoxFit.cover,
                      //   ),
                      // ),
                      decoration: BoxDecoration(
                        color: Colors.white38,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: SkeletonLine(
                        style: SkeletonLineStyle(width: 100, height: 100),
                      ),
                    ),
                  ),
                  SkeletonLine(
                    style: SkeletonLineStyle(width: 60),
                  ),
                  SkeletonLine(
                    style: SkeletonLineStyle(width: 80),
                  ),
                  // Padding(
                  //   padding: EdgeInsets.all(0),
                  //   child: Column(
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     children: [
                  //       TextRegularLancelot(
                  //         label: '$name',
                  //         color: Colors.white,
                  //       ),
                  //       TextRegularExo(
                  //         label: 'Rp. $price',
                  //         color: Colors.white,
                  //         size: 11,
                  //         fontWeight: FontWeight.w800,
                  //       )
                  //     ],
                  //   ),
                  // )
                ],
              ),
            ),
          ),
          const SizedBox(
            width: 16,
          )
        ],
      ),
    );
  }
}
