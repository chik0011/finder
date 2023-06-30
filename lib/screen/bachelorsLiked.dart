import 'package:flutter/material.dart';
import 'package:finder/models/bachelor.dart';
import 'package:finder/screen/bachelorDetail.dart';
import 'package:finder/provider/bachelorsLikedProvider.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

class BachelorsLiked extends StatelessWidget {
  final String title;

  BachelorsLiked({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final BachelorsLikedProvider bachelorsLikedProvider =
        Provider.of<BachelorsLikedProvider>(context);
    List<Bachelor> bachelorsLiked = bachelorsLikedProvider.getBachelorsLiked();

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.blue,
          title: Text(title,
              style: const TextStyle(
                color: Colors.white,
              )),
          leading: GestureDetector(
            onTap: () {
              context.go("/");
            },
            child: const Icon(
              Icons.arrow_back_rounded,
              color: Colors.white,
            ),
          ),
        ),
        body: ListView.builder(
            itemCount: bachelorsLiked.length,
            prototypeItem: const ListTile(title: Text("bachelorsLiked")),
            itemBuilder: (context, index) {
              return ListTile(
                leading: CircleAvatar(
                  backgroundColor: const Color(0xff764abc),
                  child: Image.asset(bachelorsLiked[index].getAvatar()),
                ),
                title: Text(bachelorsLiked[index].getIndentity()),
                trailing: Icon(Icons.favorite,
                    color:
                        (bachelorsLikedProvider.isLiked(bachelorsLiked[index])
                            ? Colors.red
                            : Colors.grey)),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => BachelorsDetail(
                            title: title,
                            bachelor: bachelorsLiked[index],
                          )),
                ),
              );
            }));
  }
}
