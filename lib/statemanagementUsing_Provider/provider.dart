import 'dart:math';


import 'package:flutter/cupertino.dart';

import 'model.dart';

final List<Movies>movieList = List.generate(100,
        (index) => Movies(
        title: 'Movie $index',
        time: '${Random().nextInt(100) +60} minutes'));

class Providerclass extends ChangeNotifier{

  final List<Movies> movie =movieList;

  List<Movies> get Movie => movie;
  final List<Movies> wishListMovie = [];
  List<Movies>get moviesWishList => wishListMovie;

  void addtoWishList(Movies movieFromMainPage){
    wishListMovie.add(movieFromMainPage);
    notifyListeners();
  }

  void removeFromWishList(Movies removedMovie){
    wishListMovie.remove(removedMovie);
    notifyListeners();
  }
}