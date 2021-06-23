import 'package:flutter/material.dart';
import 'package:tinder/main.dart';

class ProfileScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
        leading: new IconButton(
          onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      MyHomePage(title: 'Flutter Demo Home Page')),
            );
          },
          icon: Icon(Icons.arrow_back,color: Colors.black,),
        ),
        title: new Text("PROFILE",style: TextStyle(fontSize: 32,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),

      ),
      body: SafeArea(
        child: Column(

          children: [
            Container(
              height: size.height/3.5,
              decoration: BoxDecoration(
                color: Colors.red,
                  image: DecorationImage(
                      image: NetworkImage(
                          "img1.jpg"
                      ),
                      fit: BoxFit.cover
                  )
              ),
              child: Container(
                width: double.infinity,
                height: size.height/4,
                child: Container(
                  alignment: Alignment(0.0,2.5),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                        "img1.jpg"
                    ),
                    radius: 60.0,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 80,
            ),
            Text(
              "Username"
              ,style: TextStyle(
                fontSize: 25.0,
                color:Colors.blueGrey,
                letterSpacing: 2.0,
                fontWeight: FontWeight.w400
            ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Maharashtra, India"
              ,style: TextStyle(
                fontSize: 18.0,
                color:Colors.black45,
                letterSpacing: 2.0,
                fontWeight: FontWeight.w300
            ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "One Line Description"
              ,style: TextStyle(
                fontSize: 15.0,
                color:Colors.black45,
                letterSpacing: 2.0,
                fontWeight: FontWeight.w300
            ),
            ),
            SizedBox(
              height: 10,
            ),



            Card(
              margin: EdgeInsets.symmetric(horizontal: 20.0,vertical: 8.0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        Text("Name : ",
                          style: TextStyle(
                              color: Colors.blueAccent,
                              fontSize: 22.0,
                              fontWeight: FontWeight.w600
                          ),),
                        SizedBox(
                          height: 7,
                        ),
                        Text("Rohit",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 22.0,
                              fontWeight: FontWeight.w300
                          ),)
                      ],
                    ),
                    Row(
                      children: [
                        Text("Age : ",
                          style: TextStyle(
                              color: Colors.blueAccent,
                              fontSize: 22.0,
                              fontWeight: FontWeight.w600
                          ),),
                        SizedBox(
                          height: 30,
                        ),
                        Text("25",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 22.0,
                              fontWeight: FontWeight.w300
                          ),)
                      ],
                    ),
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}