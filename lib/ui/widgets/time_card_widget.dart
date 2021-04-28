import 'package:flutter/material.dart';

class ProjectInfo extends StatelessWidget {
  String hashtag;
  String projectName;
  String clientName;
  Color textColor;

  ProjectInfo(
      {this.hashtag, this.projectName, this.clientName, this.textColor});

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 55,
      width: 350,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(color: Colors.grey,spreadRadius: 0.3,blurRadius: 0.6,offset: Offset(0.6,0.6))
        ],

      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text("#$hashtag"),
          ),

          SizedBox(height: 10,),

          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Row(
              children: [
                Text("$projectName",style: TextStyle(color: Colors.amber),),
                SizedBox(width: 10,),

                Text("$clientName",style: TextStyle(color: Colors.black),)

              ],
            ),
          ),

        ],
      ),
    );
  }
}
