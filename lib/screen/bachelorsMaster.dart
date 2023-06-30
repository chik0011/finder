import 'package:flutter/material.dart';
import 'package:finder/models/bachelor.dart';
import 'package:finder/screen/bachelorDetail.dart';
import 'package:finder/provider/bachelorsProvider.dart';
import 'package:finder/provider/bachelorsLikedProvider.dart';
import 'package:provider/provider.dart';

class BachelorsMaster extends StatefulWidget {
  const BachelorsMaster({super.key, required this.title});
  final String title;

  @override
  State<BachelorsMaster> createState() => _BachelorsMasterState();
}

class _BachelorsMasterState extends State<BachelorsMaster> {
  @override
  Widget build(BuildContext context) {
    final BachelorsProvider bachelorsProvider =
        Provider.of<BachelorsProvider>(context);
    final BachelorsLikedProvider bachelorsLikedProvider =
        Provider.of<BachelorsLikedProvider>(context);

    List<Bachelor> bachelors = bachelorsProvider.getBachelors();
    List<Bachelor> bachelorsLiked = bachelorsLikedProvider.getBachelorsLiked();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: Text(widget.title,
            style: const TextStyle(
              color: Colors.white,
            )),
      ),
      body: ListView.builder(
        itemCount: bachelors.length,
        prototypeItem: const ListTile(
          title: Text("bachelors"),
        ),
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: const Color(0xff764abc),
              child: Image.asset(bachelors[index].getAvatar()),
            ),
            title: Text(bachelors[index].getIndentity()),
            trailing: Icon(Icons.favorite,
                color: (bachelorsLikedProvider.isLiked(bachelors[index])
                    ? Colors.red
                    : Colors.grey)),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => BachelorsDetail(
                        title: widget.title,
                        bachelor: bachelors[index],
                      )),
            ),
          );
        },
      ),
    );
  }
}
