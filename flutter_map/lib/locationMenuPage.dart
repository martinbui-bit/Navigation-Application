import 'package:flutter/material.dart';

import 'map_page.dart';

class Location {
  const Location({required this.name, required this.streets});

  final String name;
  final List<Street> streets;
}

class destinations extends StatefulWidget {
  @override
  State<destinations> createState() => _destinationsState();
}

class _destinationsState extends State<destinations> {
  List<Location> locations = [
    const Location(
      name: "CLEVELAND HALL",
      streets: [
        Street(
          name: 'Southside to Cleveland',
          videoUrl:
              'https://www.youtube.com/watch?v=4ajPKrzP2u8&list=PLt2bVCgdSlrEXVfh0AjrQnXuy8q8nDtl2&index=1',
        ),
        Street(
          name: 'CUB to Cleveland',
          videoUrl:
              'https://www.youtube.com/watch?v=ItVfyZfB5j0&list=PLt2bVCgdSlrEXVfh0AjrQnXuy8q8nDtl2&index=2',
        ),
        Street(
          name: 'Cleveland to CUB',
          videoUrl:
              'https://www.youtube.com/watch?v=LjluoqUtawc&list=PLt2bVCgdSlrEXVfh0AjrQnXuy8q8nDtl2&index=3',
        ),
        Street(
          name: 'CUE to Cleveland',
          videoUrl:
              'https://www.youtube.com/watch?v=ZyIX43URm5g&list=PLt2bVCgdSlrEXVfh0AjrQnXuy8q8nDtl2&index=4',
        ),
        Street(
          name: 'Cleveland to Southside',
          videoUrl:
              'https://www.youtube.com/watch?v=coY8Sy2pcfc&list=PLt2bVCgdSlrEXVfh0AjrQnXuy8q8nDtl2&index=5',
        ),
        Street(
          name: 'Cleveland to CUE',
          videoUrl:
              'https://www.youtube.com/watch?v=qNiVFKC7juM&list=PLt2bVCgdSlrEXVfh0AjrQnXuy8q8nDtl2&index=6',
        ),
        Street(
          name: 'Indoor Cleveland Hall',
          videoUrl:
              'https://www.youtube.com/watch?v=2fKVMuO9FQw&list=PLt2bVCgdSlrEXVfh0AjrQnXuy8q8nDtl2&index=7',
        ),
      ],
    ),
    const Location(name: "CUB", streets: [
      Street(
          name: 'CUB to Cleveland',
          videoUrl:
              'https://www.youtube.com/watch?v=ItVfyZfB5j0&list=PLt2bVCgdSlrGD3tzKWQpbeyMK9Xpon-7R&index=1'),
      Street(
          name: 'Cleveland to CUB',
          videoUrl:
              'https://www.youtube.com/watch?v=LjluoqUtawc&list=PLt2bVCgdSlrGD3tzKWQpbeyMK9Xpon-7R&index=2'),
      Street(
          name: 'CUB to CUE',
          videoUrl:
              'https://www.youtube.com/watch?v=XqeCuyrUQF0&list=PLt2bVCgdSlrGD3tzKWQpbeyMK9Xpon-7R&index=3'),
      Street(
          name: 'CUE to CUB',
          videoUrl:
              'https://www.youtube.com/watch?v=gmqIIz1Icfg&list=PLt2bVCgdSlrGD3tzKWQpbeyMK9Xpon-7R&index=4'),
      Street(
          name: 'Indoor CUB tour',
          videoUrl:
              'https://www.youtube.com/watch?v=tUa_ltcIniY&list=PLt2bVCgdSlrGD3tzKWQpbeyMK9Xpon-7R&index=5'),
    ]),
    const Location(name: "CUE", streets: [
      Street(
          name: 'CUB to CUE',
          videoUrl:
              'https://www.youtube.com/watch?v=XqeCuyrUQF0&list=PLt2bVCgdSlrGroLVWuGv049SyFmO31xRH&index=1'),
      Street(
          name: 'CUE to Cleveland',
          videoUrl:
              'https://www.youtube.com/watch?v=ZyIX43URm5g&list=PLt2bVCgdSlrGroLVWuGv049SyFmO31xRH&index=2'),
      Street(
          name: 'CUE to CUB',
          videoUrl:
              'https://www.youtube.com/watch?v=gmqIIz1Icfg&list=PLt2bVCgdSlrGroLVWuGv049SyFmO31xRH&index=3'),
      Street(
          name: 'Cleveland to CUE',
          videoUrl:
              'https://www.youtube.com/watch?v=qNiVFKC7juM&list=PLt2bVCgdSlrGroLVWuGv049SyFmO31xRH&index=4'),
    ]),
    const Location(name: "SOUTHSIDE DINING HALL", streets: [
      Street(
          name: 'Southside to Cleveland',
          videoUrl:
              'https://www.youtube.com/watch?v=4ajPKrzP2u8&list=PLt2bVCgdSlrECJKUIae37kL7GZ9kvDhE7&index=1'),
      Street(
          name: 'Cleveland to Southside',
          videoUrl:
              'https://www.youtube.com/watch?v=coY8Sy2pcfc&list=PLt2bVCgdSlrECJKUIae37kL7GZ9kvDhE7&index=2'),
    ]),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: const Text('Destinations'),
          centerTitle: true,
        ),
        body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MapPage(
                        streetName: locations[index].name,
                        streets: locations[index].streets,
                      ),
                    ),
                  );
                },
                title: Text(locations[index].name),
                leading: CircleAvatar(
                  backgroundColor: Colors.red,
                  child: Text(locations[index].name[0]),
                ),
              ),
            );
          },
        ));
  }
}
