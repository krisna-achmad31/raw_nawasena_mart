import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nawasena/components/loading_template.dart';
import '../../../models/news/newsResponse.dart' as dataResponses;
import '../../../repository/AuthRepository.dart';

enum ResultExploreState { loading, noData, hasData, error }

class ExploreProvider extends ChangeNotifier{

  ExploreProvider(){
    getRecommendedTv();
    CarouselController carouselController = new CarouselController();
  }

  CarouselController carouselController = new CarouselController();

  ResultExploreState? _stateExplore;
  ResultExploreState? get stateRent => _stateExplore;

  bool? _loading = false;
  bool? get loading => _loading;

  bool? _loadingDataRecommendedTv = false;
  bool? get loadingDataRecommendedTv => _loadingDataRecommendedTv;

  int? _current = 0;
  int? get current => _current;

  List<Widget> bannerNews = [];
  List<dataResponses.Data> itemNews = [];

  changeIndex(int index){
    _current = index;
    notifyListeners();
  }

  void getRecommendedTv() async {
    _stateExplore = ResultExploreState.loading;
    notifyListeners();
    try{
      dataResponses.NewsResponse newsResponse = await AuthRepository().getListNews('newsDb');
      itemNews = newsResponse.data;
      bannerNews = newsResponse.data.map((e) {
        print(bannerNews.length);
        return Builder(
          builder: (BuildContext context) {
            return InkWell(
              onTap: (){
                // moveToDetail(e.id.toString(),'Tv');
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 200,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: CachedNetworkImage(
                    imageUrl:
                    '${e.productImage}',
                    placeholder: (context, url) => const Center(
                      child:
                      LoadingTemplate(),
                    ),
                    // errorWidget: (context, url, error) =>
                    //     Image.asset(
                    //         'assets/images/error_agent_pict.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            );
          },
        );
      }).toList();
      notifyListeners();
      _stateExplore = ResultExploreState.hasData;
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