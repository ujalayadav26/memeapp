
import 'package:memeflutter/models/memes_model.dart';

enum MemesStatus{
  intial,
  loading,
  loaded,
  error
}

class MemesState{
  MemesStatus? memesStatus;
  MemesModel? memesModel;
  String? error;

  MemesState({
    required this.memesStatus,
    required this.memesModel,
    required this.error
});
  factory MemesState.intial(){
    return MemesState(
        memesStatus: MemesStatus.intial,
        memesModel: null,
        error: "");
  }
  MemesState copyWith({
    MemesStatus? memesStatus,
    MemesModel? memesModel,
    String? error,
}){
    return MemesState(
        memesStatus: memesStatus ?? this.memesStatus,
        memesModel: memesModel ?? this.memesModel,
        error: error ?? this.error
    );
  }
}