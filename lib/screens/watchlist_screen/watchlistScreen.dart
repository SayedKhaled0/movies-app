import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../firebase_Uitils/firebase_Utils.dart';
import '../../firebase_Uitils/modelFirebase/modelMovies.dart';
import '../../generated/assets.dart';
import '../../models/search/Search_Model.dart';
import '../../myProvider/provider.dart';
import '../../shared/constants/constants.dart';
import '../../shared/network/remote/api_manager.dart';
import '../../styles/colors.dart';
import '../home_screen/details_Screen.dart';


class WatchList_Screen extends StatefulWidget {
  const WatchList_Screen({Key? key}) : super(key: key);
  static const String routeName="WatchList_Screen";
  @override
  State<WatchList_Screen> createState() => _Browse_ScreenState();
}

class _Browse_ScreenState extends State<WatchList_Screen> {
  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<MyPervider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Watch List"),
      ),
      body: Column(
        children: [
          if( provider.watchList.isEmpty ||
             provider.watchList==[] )
            Center(
              child: SizedBox(
                height: MediaQuery.of(context).size.height*0.7,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: (){
                        MyMoviesList list=MyMoviesList( idFilm: 4,
                        id: '555');
                       AddMovieToFirestore(list);
                      },
                      child: Image.asset(

                        Assets.imageEmpty,
                        width: 200,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          FutureBuilder<SearchModel>(
            future: ApiManager.getSearchModel(provider.searchController.text),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.deepOrangeAccent,
                  ),
                );
              }
              var search = snapshot.data?.results ?? [];
              print("${search.length} <- ListWatch");
              return Expanded(
                child: ListView.builder(
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          provider.id = search[index].id as int;
                          print(provider.id);
                          Navigator.pushNamed(
                            context,
                            DetailsScreen.routeName,
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                alignment: Alignment.topLeft,
                                children: [
                                  Container(
                                    height: MediaQuery.of(context).size.height *
                                        .25,
                                    width: 150,
                                    child: Image.network(
                                      "${showImage}${search[index].posterPath}",
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Wrap(
                                      crossAxisAlignment:
                                      WrapCrossAlignment.center,
                                      spacing: 5,
                                      children: [
                                        ElevatedButton(
                                          onPressed: () {
                                            provider.id = search[index].id as int;
                                            print(provider.id);
                                            Navigator.pushNamed(
                                              context,
                                              DetailsScreen.routeName,
                                            );

                                          },
                                          style: ButtonStyle(
                                            backgroundColor:
                                            MaterialStateProperty.all(
                                                Colors.black),
                                            side: MaterialStatePropertyAll(
                                              BorderSide(
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ),
                                          child: Text(
                                            "${search[index].title ?? ""}",
                                            style:
                                            TextStyle(color: Colors.grey),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "${search[index].overview ?? ""}",
                                        maxLines: 6,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(color: PRIMARY_COLOR),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    itemCount: search.length),
              );
            },
          )
        ],
      ),
    );
  }
}
