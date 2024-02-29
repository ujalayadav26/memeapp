import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../provider/memes_notifier.dart';
import '../provider/memes_state.dart';
import 'custom_widget.dart';

class MyHomeScreen extends StatelessWidget {
  const MyHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[400],
        title: Row(
          children: [
            Text(
              "Memes App",
              style: TextStyle(
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              width: 100,
            ),
            Icon(
              Icons.remember_me_outlined,
              color: Colors.grey,
            ),
          ],
        ),
      ),
      body: Consumer(
          builder: (context,ref,child) {
            final state = ref.watch(memesProvider);
            if(state.memesStatus==MemesStatus.loading){
              return CircularProgressIndicator();
            }
            if(state.memesStatus==MemesStatus.loaded){
              return ListView.builder(
                itemCount: state.memesModel!.data?.memes!.length,
                itemBuilder: (context,index){
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: CustomWidget(
                      Name: state.memesModel!.data!.memes![index].name ?? "",
                      imageUrl:state.memesModel!.data!.memes![index].url ?? "https://images.theconversation.com/files/38926/original/5cwx89t4-1389586191.jpg?ixlib=rb-1.1.0&q=45&auto=format&w=926&fit=clip",),
                  );
                },


              );
            }
            if(state.memesStatus==MemesStatus.error){
              return Text(state.error!);

            }
            return SizedBox();
          }
      ),



    );
  }
}
