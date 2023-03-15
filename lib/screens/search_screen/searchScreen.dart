import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../models/search/Search_Model.dart';
import '../../myProvider/provider.dart';
import '../../shared/componant/componants.dart';
import '../../shared/constants/constants.dart';
import '../../shared/network/remote/api_manager.dart';
import '../../styles/colors.dart';
import '../home_screen/details_Screen.dart';

class Search_Screen extends StatefulWidget {
  const Search_Screen({Key? key}) : super(key: key);
  static const String routeName = "Search_Screen";

  @override
  State<Search_Screen> createState() => _search_screen();
}

class _search_screen extends State<Search_Screen> {
  String s = '';

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyPervider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Search ",
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DefaultTextFormField(
                prefixIcon: Icons.search,
                keyboardType: TextInputType.text,

                onChance: (value) {
                  if (value != null && value.isNotEmpty) {
                    s = value;
                    provider.searchMovies(s);
                  }
                  ;
                },
                label: "",
                controller: provider.searchController,
                validator: (value) {
                  if (value!.trim() == '') {
                    return "";
                  }
                  return null;
                }),
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
              print("${search.length} <- search length");
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
          ),
        ],
      ),
    );
  }
}
