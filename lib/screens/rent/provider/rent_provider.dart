
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../models/rent/rentResponse.dart' as dataResponses;
import '../../../repository/AuthRepository.dart';

enum ResultRentState { loading, noData, hasData, error }

class RentProvider extends ChangeNotifier{

  RentProvider(){
    CarouselController carouselController = new CarouselController();
    getRecommendedTv();
  }

  CarouselController carouselController = new CarouselController();

  bool? _loading = false;
  bool? get loading => _loading;

  int? _current = 0;
  int? get current => _current;

  ResultRentState? _stateRent;
  ResultRentState? get stateRent => _stateRent;

  List<Widget> bannerNews = [];
  List<dataResponses.Data> itemNews = [];

  changeIndex(int index){
    _current = index;
    notifyListeners();
  }

  void getRecommendedTv() async {
    _stateRent = ResultRentState.loading;
    notifyListeners();
    try{
      dataResponses.RentResponse rentResponse = await AuthRepository().getListRent('pinjamDb');
      itemNews = rentResponse.data;
      bannerNews = rentResponse.data.map((e) {
        print(bannerNews.length);
        return Builder(
          builder: (BuildContext context) {
            return InkWell(
              onTap: (){
                // moveToDetail(e.id.toString(),'Tv');
              },
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 200,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: CachedNetworkImage(
                          imageUrl:
                          '${e.productImage}',
                          placeholder: (context, url) => const Center(
                            child:
                            CircularProgressIndicator.adaptive(),
                          ),
                          // errorWidget: (context, url, error) =>
                          //     Image.asset(
                          //         'assets/images/error_agent_pict.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    // Container(
                    //   width: MediaQuery.of(context).size.width,
                    //   height: 200,
                    //   margin: EdgeInsets.symmetric(horizontal: 5.0),
                    //   decoration: BoxDecoration(
                    //       color: Colors.white,
                    //       borderRadius: BorderRadius.circular(20.0),
                    //       image: DecorationImage(
                    //           image: NetworkImage('${e.productImage}'),
                    //           fit: BoxFit.cover
                    //       )
                    //   ),
                    //   // child: SingleChildScrollView(
                    //   //   child: Column(
                    //   //     children: [
                    //   //       Container(
                    //   //         height: 100,
                    //   //         margin: EdgeInsets.only(top: 30),
                    //   //         clipBehavior: Clip.hardEdge,
                    //   //         decoration: BoxDecoration(
                    //   //           borderRadius: BorderRadius.circular(20),
                    //   //         ),
                    //   //         child: Image.network('${e.productImage}', fit: BoxFit.fill),
                    //   //       ),
                    //   //       SizedBox(height: 20),
                    //   //       Padding(
                    //   //         padding: EdgeInsets.only(left: 16, right: 16),
                    //   //         child: Text(e.productName!, style:
                    //   //         TextStyle(
                    //   //             fontSize: 16.0,
                    //   //             fontWeight: FontWeight.bold
                    //   //         ),
                    //   //         ),
                    //   //       ),
                    //   //       // rating
                    //   //       // SizedBox(height: 20),
                    //   //       // Container(
                    //   //       //   child: Text(e.productName!, style: TextStyle(
                    //   //       //       fontSize: 14.0,
                    //   //       //       color: Colors.grey.shade600
                    //   //       //   ), textAlign: TextAlign.center, maxLines: 1,
                    //   //       //   ),
                    //   //       // ),
                    //   //       SizedBox(height: 20),
                    //   //       AnimatedOpacity(
                    //   //         duration: Duration(milliseconds: 500),
                    //   //         opacity: 1.0,
                    //   //         child: Container(
                    //   //           padding: EdgeInsets.symmetric(horizontal: 20.0),
                    //   //           child: Row(
                    //   //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   //             children: [
                    //   //               Container(
                    //   //                 child: Row(
                    //   //                   children: [
                    //   //                     Icon(Icons.star, color: Colors.yellow, size: 20,),
                    //   //                     SizedBox(width: 5),
                    //   //                     Text('-', style: TextStyle(
                    //   //                         fontSize: 14.0,
                    //   //                         color: Colors.grey.shade600
                    //   //                     ),)
                    //   //                   ],
                    //   //                 ),
                    //   //               ),
                    //   //               Container(
                    //   //                 child: Row(
                    //   //                   children: [
                    //   //                     Icon(Icons.access_time, color: Colors.grey.shade600, size: 20,),
                    //   //                     SizedBox(width: 5),
                    //   //                     Text(' - ', style: TextStyle(
                    //   //                         fontSize: 14.0,
                    //   //                         color: Colors.grey.shade600
                    //   //                     ),)
                    //   //                   ],
                    //   //                 ),
                    //   //               ),
                    //   //               Container(
                    //   //                 width: MediaQuery.of(context).size.width * 0.2,
                    //   //                 child: Row(
                    //   //                   children: [
                    //   //                     Icon(Icons.play_circle_filled, color: Colors.grey.shade600, size: 20,),
                    //   //                     SizedBox(width: 5),
                    //   //                     Text('Watch', style: TextStyle(
                    //   //                         fontSize: 14.0,
                    //   //                         color: Colors.grey.shade600
                    //   //                     ),)
                    //   //                   ],
                    //   //                 ),
                    //   //               ),
                    //   //             ],
                    //   //           ),
                    //   //         ),
                    //   //       ),
                    //   //     ],
                    //   //   ),
                    //   // )
                    // ),
                    SizedBox(height: 8,),
                    Text(e.productName, style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700
                    ),)
                  ],
                ),
              ),
            );
          },
        );
      }).toList();
      notifyListeners();
      _stateRent = ResultRentState.hasData;
      notifyListeners();
    }catch(e, stacktrace){
      print(e);
      print(stacktrace);
    }
  }

  Future<void> reload(int index) async {
    _loading = true;
    notifyListeners();
    print(itemNews[index].productImage);
    try{
      if(itemNews[index].productImage != " "){
        _loading = false;
      }
    }catch(e){

    }
  }
}