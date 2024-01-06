import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../location_page.dart';

const String clevelandHall = 'assets/cleveland_hall.jpg';
const String cub = 'assets/cub.jpg';
const String cue = 'assets/cue.jpg';
const String spark = 'assets/spark.jpg';
const String chinookApartments = 'assets/chinook_apartments.jpg';
const String mceachernHall = 'assets/mceachern_hall.jpg';
const String southsideDiningHall = 'assets/southside_dining_hall.jpg';
const String studentRecCenter = 'assets/students_rec_center.jpg';
const String chinook = 'assets/chinook.jpg';

class Street {
  const Street({
    required this.name,
    required this.videoUrl,
  });

  final String name;
  final String videoUrl;
}

class StreetNames {
  static const String clevelandHall = 'CLEVELAND HALL';
  static const String cub = 'CUB';
  static const String cue = 'CUE';
  static const String spark = 'SPARK';
  static const String chinookApartments = 'CHINOOK APARTMENTS';
  static const String mceachernHall = 'MCEACHERN HALL';
  static const String southsideDiningHall = 'SOUTHSIDE DINING HALL';
  static const String studentRecCenter = 'STUDENT REC CENTER';
  static const String chinook = 'CHINOOK';

  static const List<String> names = [
    clevelandHall,
    cub,
    cue,
    spark,
    chinookApartments,
    mceachernHall,
    southsideDiningHall,
    studentRecCenter,
    chinook,
  ];
}

class MapPage extends StatefulWidget {
  const MapPage({super.key, required this.streetName, this.streets});

  final String streetName;
  final List<Street>? streets;

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  List<YoutubePlayerController> _controllers = [];

  @override
  void initState() {
    super.initState();
    _controllers = widget.streets?.map((street) {
          return YoutubePlayerController(
            initialVideoId: YoutubePlayer.convertUrlToId(street.videoUrl)!,
            flags: const YoutubePlayerFlags(
              autoPlay: false,
              mute: false,
            ),
          );
        }).toList() ??
        [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.streetName),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.all(10),
            child: Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: 180,
                    child: Stack(
                      children: [
                        YoutubePlayer(
                            key: ObjectKey(_controllers[index]),
                            controller: _controllers[index],
                            actionsPadding: const EdgeInsets.only(left: 16.0),
                            bottomActions: [
                              CurrentPosition(controller: _controllers[index]),
                              const SizedBox(width: 10.0),
                              ProgressBar(isExpanded: true),
                              const SizedBox(width: 10.0),
                              RemainingDuration(
                                controller: _controllers[index],
                              ),
                              FullScreenButton(
                                controller: _controllers[index],
                              ),
                            ]),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _controllers[index].pause();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LocationPage(
                            name: widget.streets![index].name,
                            url: widget.streets![index].videoUrl,
                            controller: _controllers[index],
                          ),
                        ),
                      );
                    },
                    child: Container(
                      height: 40,
                      child: Center(
                        child: Text(widget.streets![index].name),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        padding: const EdgeInsets.all(8),
        itemCount: widget.streets?.length ?? 0,
      ),
    );
  }
}
