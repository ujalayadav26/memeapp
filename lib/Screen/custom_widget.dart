
import 'package:flutter/material.dart';

class CustomWidget extends StatelessWidget{
  String Name;
  String imageUrl;
  CustomWidget({
    super.key,
    required this.Name,
    required this.imageUrl,

});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500,
      decoration: BoxDecoration(
        color: Colors.pink[800]
      ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "${Name}",
                    style: TextStyle(
                      color: Colors.grey[900],
                      fontWeight: FontWeight.w400
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image(
                    image: NetworkImage(
                      '${imageUrl}',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),

              ],

            ),


    );
  }
}