import 'package:flutter/material.dart';
import 'package:sportify/models/category.dart';
import 'package:sportify/models/music.dart';
import 'package:sportify/services/category_operation.dart';
import 'package:sportify/services/music_operations.dart';
import 'package:sportify/services/music_operations1.dart';

class Home extends StatelessWidget {
  Function _miniPlayer;
  Home(this._miniPlayer);
//on web when 2 technologies are communicating, it uses JSON format.
  //container ke andar we are creating a row and in that we will add image and text from category.dart
  Widget createCategory(Category category) {
    //recieves data and converts it into widgets(return type) and displays it.
    return Container(
      color: Color.fromRGBO(65, 47, 77, 100),
      child: Row(
        children: [
          Image.network(
            category.imageURL,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text(
              category.name,
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,),
            ),
          )
        ],
      ),
    );
  }

  List<Widget> createListOfCategories() {
    List<Category> categoryList =
        CategoryOperations.getCategories(); //gets all the data to categoryList
    List<Widget> categories = categoryList
        .map((Category category) => createCategory(category))
        .toList(); //arrow function
    //we get a widget list as createCategory function converts the data into widgets using map functions.
    //data to widget map kara rhe hai, category se data.
    //here we get a single category and we will hand it over to above for printing
    return categories;
  }

  Widget createMusic(Music music) {
    //returns single list
    return Padding(
      padding: EdgeInsets.all(10), //for adding spacing between the blocks.
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, //left
          children: [
            Container(
              height: 150,
              width: 150,
              color: Colors.blue,
              child: InkWell(
                //so that when we click on the image
                onTap: () {
                  _miniPlayer(music, stop : true);
                }, //tap hote hi ye function call hoga

                child: Image.network(
                  music.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Text(
              music.name,
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontFamily: 'Tilt Prism'),
            ),
            Text(
              music.singer_name,
              style: TextStyle(color: Colors.white),
            ),

          ]),
    );
  }

  Widget createMusicList(String label) {
    List<Music> musicList = MusicOperations.getMusic();
    //we have to set the list view to horizontal not vertical.
    //ek column ke andar image name and description daalna padhega

    return Padding(
      padding: EdgeInsets.only(left: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, //to align the made for you text to the left
        children: [
          Text(
            label,
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontFamily: 'Noto Serif Vithkuqi',
                fontSize: 15),
          ),
          Container(
            height: 300,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return createMusic(musicList[
                    index]); //index me se object ko nikalo waga se it will print the image namr singer name and description
              },
              itemCount: musicList.length,
            ), //giving the number of musics so that it can create the list accordingly
          ),
        ],
      ),
    );
  }

  Widget createMusicList1(String label) {
    List<Music> musicList = MusicOperations1.getMusic1();
    print(musicList[0].audioURL);
    //we have to set the list view to horizontal not vertical.
    //ek column ke andar image name and description daalna padhega

    return Padding(
      padding: EdgeInsets.only(left: 5),
      
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, //to align the made for you text to the left
        children: [
          Text(
            label,
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontFamily: 'Noto Serif Vithkuqi',
                fontSize: 15),
          ),
          Container(
            height: 300,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return createMusic(musicList[
                index]); //index me se object ko nikalo waga se it will print the image namr singer name and description
              },
              itemCount: musicList.length,
            ), //giving the number of musics so that it can create the list accordingly
          ),
        ],
      ),
    );
  }

  Widget createGrid() {
    return Container(
        padding: EdgeInsets.all(10),
        height: 280,
        child: GridView.count(
          childAspectRatio: 6 /
              2, //widget/ height(according to device it keeps  arelative size)
          crossAxisSpacing:
              3, //keeping space in between the grids, horizontal spacing
          mainAxisSpacing: 10, //vertical spacing
          children:
              createListOfCategories(), //here we will show different categories.(cols and rows), creating cells
          //also children is a list
          crossAxisCount: 2, //2-2 cells karke dikhayega.
        ));
  }

  Widget createAppBar(String message) {
    return AppBar(
        backgroundColor: Colors.transparent, //appbar is transparent
        elevation: 0.0,
        title: new Padding(
          padding: EdgeInsets.only(left: 10),
          child: Text(
            message,
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontFamily: 'Qwitcher Grypen',
                fontSize: 50),
          ),
        ),
        // actions: [
        //   Padding(
        //     padding: EdgeInsets.only(right: 10),
        //     child: Icon(Icons.settings),
        //   )
        // ]
        );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
          //content ko safe jagah pe dikhati hai
          child: Container(
        //iske andar sab ayega(a box is made on screen)8
        child: Column(
          children: [
            //widget list
            createAppBar('Melody'),
            SizedBox(
              height: 5,
            ),
            createGrid(),
            createMusicList('Made for you!'),
            createMusicList1('Ed Sheeran Special!'),
            createMusicList('Todays Biggest hits!'),

          ],
        ), //inside one column there are are soo many children(good morning, playlists etc)
        decoration: BoxDecoration(
            //decoration is optional
            gradient: LinearGradient(
                colors: [Colors.black, Color.fromRGBO(74, 29, 73, 100)],
                begin: Alignment.topLeft,
                end: Alignment
                    .bottomRight) //here we are defining from where to where should gradient go
            ), //we can add stop property above like stops: [0.1, 0.3], it will automatically set the colours there.
      )),
    );
  }
}
