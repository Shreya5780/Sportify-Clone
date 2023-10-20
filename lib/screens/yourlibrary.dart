import 'package:flutter/material.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:sportify/screens/firebase/auth_conf.dart';

class YourLibrary extends StatefulWidget {
  final AuthController authController = AuthController.instance;

  @override
  _DesignExampleState createState() => _DesignExampleState();
}

class _DesignExampleState extends State<YourLibrary> {
  final audioPlayer = AssetsAudioPlayer();
  double screenHeight = 0;
  double screenWidth = 0;
  // final Color mainColor = Color(Colors.yellow);
  // final Color inactiveColor = Color(Colors.purple);
  String? userEmail;


  List<Audio> audioList = [
    Audio('assets/beautiful_people.mp3',
        metas: Metas(
            title: "Beautiful People",
            artist: "Ed Sheeran",
            image: MetasImage.asset('assets/BeautifulP.jpg'))),
    Audio('assets/beautiful_people.mp3',
        metas: Metas(
            title: "Galway Girl",
            artist: "Ed Sheeran",
            image: MetasImage.asset('assets/download.jpg'))),
    Audio('assets/shape_of_you.mp3',
        metas: Metas(
            title: "Shape of you",
            artist: "Ed Sheeran",
            image: MetasImage.asset('assets/shapeOfYou.jpg'))),
    Audio('assets/castleOnTheHill.mp3',
        metas: Metas(
            title: "Castle On The Hill",
            artist: "Ed Sheeran",
            image: MetasImage.asset('assets/castleOnHill.jpg'))),
    Audio('assets/perfect.mp3',
        metas: Metas(
            title: "Perfect",
            artist: "Ed Sheeran",
            image: MetasImage.asset('assets/Perfect_p.jpg'))),
  ];

  void setupPlaylist() async {
    await audioPlayer.open(Playlist(audios: audioList),
        autoStart: false, loopMode: LoopMode.playlist);
  }

  @override
  void initState() {
    super.initState();
    userEmail = widget.authController.getCurrentUserEmail();
    setupPlaylist();
  }

  @override
  void dispose() {
    super.dispose();
    audioPlayer.dispose();
  }

  void showUserSettings(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: const Color.fromARGB(255, 194, 95, 212),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 10),
                Text(
                  "User Settings",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 20),

                // Image at the top
               Image.asset(
              "images/b.jpg",
              width: 300,
              height: 150,
            ),

                SizedBox(height: 20),
                Text(
                  "Welcome, $userEmail",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    AuthController.instance.logout();
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    "Sign Out",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                 style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                    Color.fromARGB(255, 94, 7, 83)), // Button background color
                padding: MaterialStateProperty.all(
                    EdgeInsets.all(14)), // Adjust padding as needed
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        5), // Adjust border radius as needed
                  ),
                ),
              ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget playlistImage() {
    return Container(
      height: screenHeight * 0.25,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: Image.asset(
          'images/logo.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget createAppBar(String message) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      title: Padding(
        padding: EdgeInsets.only(left: 10),
        child: Text(
          message,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontFamily: 'Qwitcher Grypen',
            fontSize: 30,
          ),
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () {
            showUserSettings(context); // Call the showUserSettings method
          },
          child: Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(Icons.settings),
          ),
        ),
      ],
    );
  }

  Widget playlistTitle() {
    return Text(
      "Chill Playlist",
      style: TextStyle(
          color: Colors.white,
          fontFamily: "Qwitcher Grypen",
          fontSize: 25,
          fontWeight: FontWeight.bold),
    );
  }

  Widget playButton() {
    return Container(
        width: screenWidth * 0.30,
        child: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: ElevatedButton(
                onPressed: () => audioPlayer.playlistPlayAtIndex(0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.play_circle_fill_rounded,
                      color: Colors.purple,
                    ),
                    SizedBox(
                      width: 7,
                    ),
                    Text(
                      'Play',
                      style: TextStyle(
                        color: Colors.purple,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Noto Serif Vithkuqi",
                      ),
                    )
                  ],
                ),
                style: ButtonStyle(
                    backgroundColor: MaterialStateColor.resolveWith(
                  (states) => (Colors.white),
                  // shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)
                )))));
  }

  Widget playlistItem(int index) {
    return InkWell(
        onTap: () => audioPlayer.playlistPlayAtIndex(index),
        splashColor: Colors.transparent,
        highlightColor: Colors.purple,
        child: Container(
          height: screenHeight * 0.07,
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              children: [
                Text(
                  '0${index + 1}',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Noto Serif Vithkuqi"),
                ),
                SizedBox(
                  width: screenWidth * 0.04,
                ),
                Expanded(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      audioList[index]?.metas?.title ?? "hello",
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Noto Serif Vithkuqi"),
                    ),
                    SizedBox(
                      height: screenHeight * 0.005,
                    ),
                    Text(
                      audioList[index]?.metas?.artist ?? 'arijit',
                      style: TextStyle(
                          fontSize: 13,
                          color: Colors.lime,
                          fontFamily: "Noto Serif Vithkuqi"),
                    )
                  ],
                )),
                Icon(
                  Icons.play_circle_filled,
                  color: Colors.lime,
                )
              ],
            ),
          ),
        ));
  }

  Widget playlist(RealtimePlayingInfos realtimePlayingInfos) {
    return Container(
      height: screenHeight * 0.30,
      alignment: Alignment.bottomLeft,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return playlistItem(index);
        },
        shrinkWrap: true,
        itemCount: audioList.length,
      ),
    );
  }

  Widget bottomPlayContainer(RealtimePlayingInfos realtimePlayingInfos) {
    return Container(
      height: screenHeight * 0.070,
      decoration: BoxDecoration(
        color: Color.fromRGBO(74, 29, 73, 100),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Row(
          children: [
            Container(
              height: screenHeight * 0.08,
              width: screenHeight * 0.08,
              child: ClipRRect(
                child: Image.asset(
                  realtimePlayingInfos
                          ?.current?.audio?.audio?.metas?.image?.path ??
                      "assets/beautiful_people.mp3",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: screenWidth * 0.01),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  realtimePlayingInfos?.current?.audio?.audio?.metas?.title ??
                      "hhrhrh",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: "Noto Serif Vithkuqi",
                      color: Colors.white,
                      fontSize: 15),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: screenHeight * 0.005,
                ),
                Text(
                  realtimePlayingInfos?.current?.audio?.audio?.metas?.artist ??
                      "hhrhrh",
                  style: TextStyle(
                      fontSize: 13,
                      color: Colors.white,
                      fontFamily: "Noto Serif Vithkuqi"),
                  textAlign: TextAlign.center,
                ),
              ],
            )),
            // Icon(Icons.favorite_outline_rounded, color: Colors.purple,),
            SizedBox(
              width: screenWidth * 0.03,
            ),

            IconButton(
              icon: Icon(realtimePlayingInfos.isPlaying
                  ? Icons.pause
                  : Icons.play_arrow),
              iconSize: screenHeight * 0.035,
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              color: Colors.white,
              onPressed: () => audioPlayer.playOrPause(),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color.fromRGBO(74, 29, 73, 100),
      body: audioPlayer.builderRealtimePlayingInfos(
          builder: (context, realtimePlayingInfos) {
        if (realtimePlayingInfos != null) {
          return SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                createAppBar('Enjoy Your library'),
// signOutButton(),
                playlistImage(),
                SizedBox(
                  height: screenHeight * 0.02,
                ),
                playlistTitle(),
                playButton(),
                playlist(realtimePlayingInfos),
                bottomPlayContainer(realtimePlayingInfos)
              ],
            ),
          );
        } else {
          return Column();
        }
      }),
    );
  }
}
