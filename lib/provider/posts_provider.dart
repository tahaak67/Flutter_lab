import 'package:dio/dio.dart';
import 'package:first_class/model/post_response.dart';
import 'package:flutter/material.dart';


class PostsProvider extends ChangeNotifier{

  Dio? dio;
  List<PostResponse>? data;

  PostsProvider(){
    print("posts provider constructor");
    dio = Dio(
      BaseOptions(
        contentType: "Application/json"
      )
    );
  }

  Future<void> getPosts() async {
    print("get posts called");
    var response = await dio?.get("https://freefakeapi.io/api/posts");

    List<dynamic> jsonList = response?.data;
    data = jsonList.map((item) => PostResponse.fromJson(item)).toList();
    //PostResponse.fromJson(response?.data);
    notifyListeners();
  }

}