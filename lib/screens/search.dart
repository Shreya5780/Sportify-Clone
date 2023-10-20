import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:sportify/models/music.dart';
import 'package:sportify/services/MusicData.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchPageState();
}

class _SearchPageState extends State<Search> {
  List<Music> display_list = List.from(MusicOperations.getMusicData());

  Music? currentlyPlayingSong;
  AudioPlayer _audioPlayer = AudioPlayer();

  bool isPlaying = false;
  Music? music;

  void updateList(String value) {
    // Update the list logic here
    setState(() {
      display_list = MusicOperations.getMusicData()
          .where((element) =>
              element.name!.toLowerCase().contains(value.toLowerCase()))
          .toList(); // Convert the Iterable to List
    });
  }

  void playMusic(Music song) async{
    if(isPlaying){
      await _audioPlayer.stop();
    }

    if(currentlyPlayingSong == song){
      setState(() {
        isPlaying = false;
        currentlyPlayingSong = null;
      });
    }
    else{
      try{
        await _audioPlayer.play(UrlSource(song.audioURL));
        setState(() {
          isPlaying = true;
        currentlyPlayingSong = song;
        });
      } catch(e){
        print("Error playing song: $e");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(74, 29, 73, 100),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(164, 124, 177, 100),
        elevation: 0.0,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Search for a Song",
              style: TextStyle(
                fontFamily: 'Tilt Prism',
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 25.0,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            TextField(
              onChanged: (value) => updateList(value),
              // onTap: () => playMusic(),
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.black12,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
                hintText: "eg- Castle on the Hill",
                suffixIcon: Icon(Icons.search),
                prefixIconColor: Colors.white,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: display_list.length,
                itemBuilder: (context, index) => ListTile(
                  contentPadding: EdgeInsets.all(8.0),
                  leading: Container(
                    width: 80, // Set your desired width
                    height: 80, // Set your desired height
                    child: Image.network(
                      '${display_list[index].image!}',
                      fit: BoxFit.cover,
                    ),
                  ),
                  title: Text(
                    display_list[index].name!,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    '${display_list[index].singer_name!}',
                    style: TextStyle(
                      color: Colors.white60,
                    ),
                  ),
                  // Add a play button or icon to each song container.
                 trailing: IconButton(
                                    color: const Color.fromARGB(255, 231, 232, 224),
                  icon: Icon(
                    isPlaying && currentlyPlayingSong == display_list[index]
                    ? Icons.pause_circle_filled : Icons.play_circle_filled,
                  ),
                    onPressed: () {
                      // miniPlayer(display_list[index]);
                      playMusic(display_list[index]);
                    },
                   ),
                  ),
                ),
              ),
            
          ],
        ),
      ),
    );
  }
}
