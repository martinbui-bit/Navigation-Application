import 'package:flutter/material.dart';
class CL
{
  const CL({required this.name});

  final String name;

}

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<CL> locs =
  [
    const CL(name: "CLEVELAND HALL"),
    const CL(name: "CUB"),
    const CL(name: "CUE"),
    //const CL(name: "SPARK"),
    //const CL(name: "CHINOOK APARTMENTS"),
    //const CL(name: "MCEACHERN HALL"),
    const CL(name: "SOUTHSIDE DINING HALL"),
    //const CL(name: "STUDENT REC CENTER"),
    //const CL(name: "CHINOOK"),
  ];
  void updatelocation(index) async{
    CL temp = locs[index];
    Navigator.pop(context, {
          'location': temp.name
        });
  }
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text('Select Current Location'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: locs.length,
        itemBuilder: (context, index){
          return Card(
            child: ListTile(
              onTap: (){
                updatelocation(index);
              },
              title: Text(locs[index].name),
              leading: CircleAvatar(
                backgroundColor: Colors.red,
                child: Text(locs[index].name[0]),
              ),
            ),
          );
        },
      )
    );
  }
}
