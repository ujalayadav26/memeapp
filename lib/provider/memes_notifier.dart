


import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:memeflutter/models/memes_model.dart';
import 'package:memeflutter/repo/memes_repo.dart';

import 'memes_state.dart';


final memesProvider = StateNotifierProvider<MemesNotifier,MemesState>(
        (ref) => MemesNotifier());

class MemesNotifier extends StateNotifier<MemesState>{
  MemesRepo memesRepo =MemesRepo();
  MemesNotifier(): super(
      MemesState.intial()){
    getMemesMemes();
  }
  void getMemesMemes() async{
    state=state.copyWith(memesStatus:MemesStatus.loading);
    try{
      MemesModel memesModel =await memesRepo.getAllMemesMemes();
      state=state.copyWith(memesStatus:MemesStatus.loaded,memesModel:memesModel);

    }
    catch(e){
      state=state.copyWith(memesStatus:MemesStatus.error,error:e.toString());
    }
  }
}