import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/Components/neu_box.dart';
import 'package:flutter_application_1/model/playlist_provider.dart';
import 'package:provider/provider.dart';
// import 'package:flutter_application_1/Components/neu_box.dart';
// import 'package:flutter_application_1/model/playlist_provider.dart';
// import 'package:provider/provider.dart';

class SongPage extends StatefulWidget {
  const SongPage({super.key});

  @override
  State<SongPage> createState() => _SongPageState();
}

String formatTime(Duration duration) {
  String twoDigitSeconds = duration.inSeconds.remainder(60).toString().padLeft(2, '0');
  String formattedTime = "${duration.inMinutes}:$twoDigitSeconds";

  return formattedTime;
}

class _SongPageState extends State<SongPage> {
  double currVal = 50;

  @override
  Widget build(BuildContext context) {
    return Consumer<PlaylistProvider>(
      builder: (context, value, child) {
        //get playlist
        final playlist = value.playlist;

        // get current song
        final currentSong = playlist[value.currentSongIndex ?? 0];

        //return Scaffold UI
        return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.background,
          body: SafeArea(
            top: false,
            child: Padding(
              padding: const EdgeInsets.only(left: 25, right: 25, bottom: 25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //Appbar
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(Icons.arrow_back),
                      ),
                      const Text("P L A Y L I S T"),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.menu),
                      )
                    ],
                  ),
                  // album artwork
                  const SizedBox(
                    height: 55,
                  ),

                  NeuBox(
                    child: Column(
                      children: [
                        //album artwork
                        ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(currentSong.albumArtImagePath)),
                        //Song and Artist Names
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // song and artist name
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    currentSong.songName,
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(currentSong.artistName)
                                ],
                              )
                              // heart icon
                              ,
                              const Icon(
                                Icons.favorite,
                                color: Colors.red,
                                // onTap
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),

                  const SizedBox(
                    height: 25,
                  ),

                  // song durationprogress
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            //start
                            Text(formatTime(value.currentDuration)),
                            // shuffel
                            const Icon(Icons.shuffle),
                            // repeat
                            const Icon(Icons.repeat),
                            // end
                            Text(formatTime(value.totalDuration)),
                          ],
                        ),
                      ),

                      // Slider(

                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          thumbShape: const RoundSliderThumbShape(
                              enabledThumbRadius: 0),
                        ),
                        child: Slider(
                          min: 0,
                          max: value.totalDuration.inSeconds.toDouble(),
                          value: value.currentDuration.inSeconds.toDouble(),
                          activeColor: Colors.green,
                          onChanged: (double double) {},
                          onChangeEnd: (double double) {
                            value.seek(Duration(seconds: double.toInt()));
                          },
                        ),
                      )
                      // )
                      ,
                      // playback buttons
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: value.playPreviousSong,
                                child: const NeuBox(
                                  child: Icon(Icons.skip_previous_rounded),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              flex: 2,
                              child: GestureDetector(
                                onTap: value.pauseOrResume,
                                child: NeuBox(
                                  child: Icon(value.isPlaying
                                      ? Icons.pause
                                      : Icons.play_arrow_rounded),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: value.playNextSong,
                                child: const NeuBox(
                                  child: Icon(Icons.skip_next_rounded),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  )
                  //playback controls
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<PlaylistProvider>(
//         builder: (context, value, child) => Scaffold(
//             backgroundColor: Theme.of(context).colorScheme.background,
//             body: SafeArea(
//                 child: Padding(
//                     padding: const EdgeInsets.only(
//                         left: 25.0, right: 25.0, bottom: 25.0),
//                     child: Column(
//                       children: [
//                         //app bar
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             //Back Button
//                             IconButton(
//                               onPressed: () {},
//                               icon: const Icon(Icons.arrow_back),
//                             ),
//                             //title
//                             const Text(" P L A Y L I S T"),

//                             //Menu
//                             IconButton(
//                               onPressed: () {},
//                               icon: const Icon(Icons.menu),
//                             ),
//                           ],
//                         ),

//                         // albumartwork
//                         NeuBox(
//                           child: Column(
//                           children: [
//                             ClipRRect(
//                                 borderRadius: BorderRadius.circular(8.0),
//                                 child: Image.asset("assets/images/Image1.jpg")),
//                             // song and artist name
//                             const Padding(
//                               padding: EdgeInsets.all(15.0),
//                               child: Row(
//                                 children: [
//                                   Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       Text(
//                                         "Surround Sound",
//                                         style: TextStyle(
//                                             fontWeight: FontWeight.bold,
//                                             fontSize: 20),
//                                       ),
//                                       Text("21 Savage")
//                                     ],
//                                   ),

//                                   Icon(
//                                     Icons.favorite,
//                                     color: Colors.red,

//                                   )
//                                 ],
//                               ),
//                             )
//                           ],
//                         ))

//                         //song duration

//                         //playback controls
//                       ],
//                     ),
//                   ),
//                 )
//               )
//             );

//   }
// }
