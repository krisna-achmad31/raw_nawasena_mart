import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:nawasena/components/loading_template.dart';
import 'package:nawasena/constant.dart';
import 'package:nawasena/screens/explore/provider/explore_provider.dart';
import 'package:provider/provider.dart';
import 'package:skeletons/skeletons.dart';

class ExploreScreen extends StatelessWidget {
  static const String routeName = '/exploreScreen';

  const ExploreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: ExploreProvider(),
      child: Consumer<ExploreProvider>(
        builder: (context, exploreProvider, child) {
          return Scaffold(
            backgroundColor: secondaryColor,
            body: ListView(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              children: [
                Container(
                  height: MediaQuery.of(context).size.height,
                  child: Stack(
                    children: [
                      exploreProvider.stateRent == ResultExploreState.loading
                          ? LoadingTemplate()
                          : CachedNetworkImage(
                              imageUrl: '${exploreProvider.itemNews[exploreProvider.current!].productImage}',
                              placeholder: (context, url) => const Center(
                                child: SkeletonLine(
                                  style: SkeletonLineStyle(
                                    width: double.infinity,
                                    height: double.infinity
                                  ),
                                ),
                              ),
                              // errorWidget: (context, url, error) =>
                              //     Image.asset(
                              //         'assets/images/error_agent_pict.png'),
                              fit: BoxFit.cover,
                            ),
                      // Image.network(
                      //         // 'https://image.tmdb.org/t/p/w500/${trendingController.itemRecommendationTv[trendingController.current.value].posterPath}',
                      //         '${exploreProvider.itemNews[exploreProvider.current!].productImage}',
                      //         fit: BoxFit.cover,
                      //         loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                      //           if (loadingProgress == null) return child;
                      //           return Center(
                      //             child: CircularProgressIndicator(
                      //               value: loadingProgress.expectedTotalBytes != null ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes! : null,
                      //             ),
                      //           );
                      //         },
                      //       ),
                      // Obx(
                      //       () => exploreProvider.stateRent == ResultExploreState.loading
                      //       ? Container()
                      //       : GetBuilder(
                      //     init: explorePageController,
                      //     builder: (value) => Image.network(
                      //       // 'https://image.tmdb.org/t/p/w500/${trendingController.itemRecommendationTv[trendingController.current.value].posterPath}',
                      //       '${explorePageController.itemNews[explorePageController.current.value].productImage}',
                      //       fit: BoxFit.cover,
                      //       loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                      //         if (loadingProgress == null) return child;
                      //         return Center(
                      //           child: CircularProgressIndicator(
                      //             value: loadingProgress.expectedTotalBytes != null ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes! : null,
                      //           ),
                      //         );
                      //       },
                      //     ),
                      //   ),
                      // ),
                      // Image.network('https://image.tmdb.org/t/p/w500/${trendingController.itemRecommendationTv[trendingController.current.value].posterPath}', fit: BoxFit.cover),
                      Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        bottom: 0,
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.3,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(begin: Alignment.bottomCenter, end: Alignment.topCenter, colors: [
                            secondaryColor.withOpacity(1),
                            secondaryColor.withOpacity(1),
                            secondaryColor.withOpacity(1),
                            secondaryColor.withOpacity(1),
                            secondaryColor.withOpacity(0.0),
                            secondaryColor.withOpacity(0.0),
                            secondaryColor.withOpacity(0.0),
                            secondaryColor.withOpacity(0.0),
                          ])),
                        ),
                      ),
                      Positioned(
                        bottom: 90,
                        height: MediaQuery.of(context).size.height * 0.7,
                        width: MediaQuery.of(context).size.width,
                        child: CarouselSlider(
                          options: CarouselOptions(
                            height: 400.0,
                            aspectRatio: 16 / 9,
                            viewportFraction: 0.70,
                            enlargeCenterPage: true,
                            onPageChanged: (index, reason) {
                              // print(explorePageController.itemRecommendationTv[index].posterPath);
                              exploreProvider.reload(index);
                              exploreProvider.changeIndex(index);
                            },
                          ),
                          carouselController: exploreProvider.carouselController,
                          items: exploreProvider.bannerNews,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
