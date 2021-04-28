import 'package:flutter/material.dart';
import 'package:lavaloon/ui/screens/second_story_screen.dart';

class ChooseScreen extends StatelessWidget {

  ///this screen to select which user story you want to see
  ///first button you will see all projects and all clients and all times
  ///second button you will see times in the last month and client and projects
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 150),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap: (){
                Navigator.pushNamed(context, "/home");
              },
              child: Container(
                height: 65,
                width: 160,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  color: Colors.white60,
                  border: Border.all(color: Colors.blue,width: 1.3)
                ),
                child: Center(
                  child: Text("First User Story "),
                ),
                ),
            ),

            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => SecondStoryScreen(),));
              },
              child: Container(
                height: 65,
                width: 160,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    color: Colors.white60,
                    border: Border.all(color: Colors.blue,width: 1.3)
                ),
                child: Center(
                  child: Text("Second User Story "),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
