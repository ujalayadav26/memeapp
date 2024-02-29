
import 'dart:convert';

import "package:http/http.dart" as http;

import 'package:memeflutter/models/memes_model.dart';
import 'package:memeflutter/models/memes_model.dart';

import '../models/memes_model.dart';
import '../models/memes_model.dart';



class MemesRepo{
  Future<MemesModel> getAllMemesMemes() async{
    try {
      final respose = await http.get(Uri.parse(
          "https://api.imgflip.com/get_memes"
      ));
      final Map<String, dynamic> jsonresponse = jsonDecode(respose.body);
      MemesModel memesModel = MemesModel.fromJson(jsonresponse);
      print(memesModel.data!.memes![1].name);
      return memesModel;
    }
    catch(e){
      print(e.toString());
      throw(e);

    }
  }
}