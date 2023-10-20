import 'package:sportify/screens/home.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:sportify/screens/search.dart';
import 'package:sportify/screens/yourlibrary.dart';
import 'package:flutter/material.dart'; //has stateful widget
import 'package:sportify/models/music.dart';
import 'package:sportify/services/music_operations.dart';

// import 'package:audioplayers/audioplayers.dart';
//how two widgets can communicate with each other??
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState(); //creates state, HERE DATA
}

class _MyAppState extends State<MyApp> {
  
  AudioPlayer _audioPlayer = AudioPlayer();
  //we have separate tabs
  //making it var instead of final because of the below reason, we have to reinitialise it when app loaded for rhe first time
  var Tabs = []; //passing miniplayer function as argument to Home constructor so that when we click on the image, using onTap we can execute something.check line no. 47 in home.dart
  int currentTabIndex = 0; //out of 0=>home, 1=> search, 2=> yourlibrary
  bool isPlaying = false;
  Music? music;
  //UI design code goes inside build
  Widget miniPlayer(Music? music, {bool stop = false}) {
    //we are trying to put in the small rectangle music player thing
    this.music = music; //music not null anymore
    setState(() {
      //build ko wapis chalaega
    });
    //if no music is there
    if (music == null) {
      return SizedBox();
    }
    if (stop) {
      isPlaying = false;
      _audioPlayer.stop();
    }
    setState(() {}); //changes reflect karne ke liye
    Size deviceSize =
        MediaQuery.of(context).size; //device ki hieght width nikal sakte hai.
    return Padding(
      padding: EdgeInsets.all(2),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        color: Color.fromRGBO(74, 29, 73, 100),
        width: deviceSize.width,
        height: 50, //50px ki height
        child: Row(
          mainAxisAlignment: MainAxisAlignment
              .spaceBetween, //to separate the play button, image and song name
          children: [
            Image.network(music.image, fit: BoxFit.cover),
            Text(
              music.name,
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Noto Serif Vithkuqi',
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
            IconButton(
              onPressed: () async {
                isPlaying = !isPlaying;
                if (isPlaying) {
                  try {
                    await _audioPlayer.play(UrlSource(music.audioURL));
                  } catch (e) {
                    print("Error playing audio: $e");
                  }
                } else {
                  await _audioPlayer.pause();
                }
                setState(() {});

                // _audioPlayer.play(music.audioURL);
              },
              icon: isPlaying
                  ? Icon(Icons.pause, color: Colors.white)
                  : Icon(Icons.play_arrow, color: Colors.white),
            )
          ],
        ),
      ),
    );
  }

  @override
  initState() {
    super.initState();
    Tabs = [Home(miniPlayer), Search(), YourLibrary()];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //l00 like a page
      body: Tabs[currentTabIndex],
      backgroundColor:
          Color.fromRGBO(164, 124, 177, 100), //94, 37, 93, 74, 29, 73
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize
            .min, //minimum area required by home search utna hi vo lega
        children: [
          if(currentTabIndex == 0)
          miniPlayer(music),
          BottomNavigationBar(
            backgroundColor: Color.fromRGBO(164, 124, 177, 100),
            currentIndex: currentTabIndex,
            onTap: (currentIndex) {
              //whenever we click on it and will return a current index of our tab| changing current tab index
              print("Current index is: $currentIndex");
              currentTabIndex = currentIndex;
              setState(() {
                //(re-rendering)only works on stateful, used so that whole build reloads after clicking on icons(home pe click kare to home khul jaye
              });
            }, //this will help us change the page

            // iconSize: 48,
            selectedItemColor: Colors
                .white24, //change the colour of text in bottom navigation.
            unselectedItemColor: Colors.white,

            //selectedFontStyle also there.
            // backgroundColor: Colors.black12,
            items: [
              //one item has - icon and text + color and items should have min 2
              BottomNavigationBarItem(
                  icon: Icon(Icons.home, color: Colors.white), label: 'Home'),
              //3
              BottomNavigationBarItem(
                  icon: Icon(Icons.search, color: Colors.white),
                  label: 'Search'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.library_books, color: Colors.white),
                  label: 'Your Library')
            ],
          )
        ], //items ka object=> home, search and lib<= items
      ),
    );
  }
}
