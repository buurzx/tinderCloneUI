import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'users.dart';
import 'conList.dart';
import '/main.dart';

class MessageScreen extends StatelessWidget {
  List<Users> chatUsers = [
    Users(name: "Dhairysheel", messageText: "Hi, This is chat screen.", imageURL: "Image1.jpeg", time: "Now"),
    Users(name: "Akash", messageText: "Hello", imageURL: "Image2.jpeg", time: "Yesterday"),
    Users(name: "Gaurang", messageText: "Hello", imageURL: "Image3.jpeg", time: "31 Jun"),
    Users(name: "Sherlock", messageText: "Hello", imageURL: "Image4.jpeg", time: "28 Jun"),
    Users(name: "Rohit", messageText: "Thankyou", imageURL: "Image5.jpeg", time: "23 Jun"),
    Users(name: "Harry", messageText: "Hello", imageURL: "Image6.jpeg", time: "17 Apr"),
    Users(name: "Andrey", messageText: "Hi", imageURL: "Image7.jpeg", time: "24 May"),
    Users(name: "John", messageText: "Hi", imageURL: "Image8.jpeg", time: "18 May"),
  ];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
            title: new Text("CHATS",style: TextStyle(fontSize: 32,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),

      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[

            ListView.builder(
              itemCount: chatUsers.length,
              shrinkWrap: true,
              padding: EdgeInsets.only(top: 16),
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index){
                return conList(
                  name: chatUsers[index].name,
                  messageText: chatUsers[index].messageText,
                  imageUrl: chatUsers[index].imageURL,
                  time: chatUsers[index].time,
                  isMessageRead: (index == 0 || index == 3)?true:false,
                );
              },
            )
          ],
        ),
      ),
    );
  }
}