import 'package:flutter/material.dart';


const String clevelandHall = 'assets/cleveland_hall.jpg';
const String cub = 'assets/cub.jpg';
const String cue = 'assets/cue.jpg';
const String spark = 'assets/spark.jpg';
const String chinookApartments = 'assets/chinook_apartments.jpg';
const String mceachernHall = 'assets/mceachern_hall.jpg';
const String southsideDiningHall = 'assets/southside_dining_hall.jpg';
const String studentRecCenter = 'assets/students_rec_center.jpg';
const String chinook = 'assets/chinook.jpg';


// const String clevelandHallURL =


class Street {
  const Street({required this.name, required this.image});

  final String name;
  final String image;
  // final String url;
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
  const MapPage({super.key, required this.streetName});

  final String streetName;

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final List<Street> _list = [];
  late Street _street;

  @override
  void initState() {
    super.initState();
    _list.add(
        const Street(name: StreetNames.clevelandHall, image: clevelandHall));
    _list.add(const Street(name: StreetNames.cub, image: cub));
    _list.add(const Street(name: StreetNames.cue, image: cue));
    // _list.add(const Street(name: StreetNames.spark, image: spark));
    // _list.add(const Street(
    //     name: StreetNames.chinookApartments, image: chinookApartments));
    // _list.add(
    //     const Street(name: StreetNames.mceachernHall, image: mceachernHall));
    _list.add(const Street(
        name: StreetNames.southsideDiningHall, image: southsideDiningHall));
    // _list.add(const Street(
    //     name: StreetNames.studentRecCenter, image: studentRecCenter));
    // _list.add(const Street(name: StreetNames.chinook, image: chinook));

    var hit =
        _list.where((element) => element.name == widget.streetName).toList();
    if (hit.isNotEmpty) {
      _street = hit.first;
    } else {
      _street = _list[0];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_street.name),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
    );
  }
}

// import 'package:flutter/material.dart';
//
// class VideoPlayerScreen extends StatefulWidget {
//   const VideoPlayerScreen({Key? key}) : super(key: key);
//
//   @override
//   State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
// }
//
// class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Youtube"),
//       ),
//       body: Container,
//     );
//   }
// }
