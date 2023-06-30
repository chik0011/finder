import 'package:flutter/material.dart';
import 'package:finder/models/bachelor.dart';
import 'package:finder/provider/bachelorsLikedProvider.dart';
import 'package:provider/provider.dart';

class BachelorsDetail extends StatefulWidget {
  final String title;
  Bachelor bachelor;

  BachelorsDetail({super.key, required this.title, required this.bachelor});

  @override
  State<BachelorsDetail> createState() => _BachelorsDetailState();
}

class _BachelorsDetailState extends State<BachelorsDetail> {
  bool _liked = false;

  void _setLiked() {
    setState(() {
      _liked = !_liked;
    });
  }

  @override
  Widget build(BuildContext context) {
    final BachelorsLikedProvider bachelorsLikedProvider =
        Provider.of<BachelorsLikedProvider>(context, listen: true);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: Text(widget.title,
            style: const TextStyle(
              color: Colors.white,
            )),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                child: Image.asset(width: 200, widget.bachelor.getAvatar()),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 15), //apply padding to some sides only
                        child: Text(
                          widget.bachelor.getIndentity(),
                          style: const TextStyle(fontSize: 20),
                        ),
                      ),
                      Text(widget.bachelor.getJob(),
                          style: const TextStyle(fontSize: 13)),
                    ],
                  )),
            ],
          )
        ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _setLiked();

          final snackBar = SnackBar(
            content: const Text("Vous avez like"),
            action: SnackBarAction(
              label: 'Info',
              onPressed: () {
                // Some code to undo the change.
              },
            ),
          );

          if (_liked) {
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
            bachelorsLikedProvider.addBachelorLiked(widget.bachelor);
          }
        },
        tooltip: 'Like',
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(50.0))),
        child: Icon(
          Icons.favorite,
          color: (bachelorsLikedProvider.isLiked(widget.bachelor) == false
              ? Colors.grey.withOpacity(0.40)
              : Colors.red.withOpacity(1)),
        ),
      ),
    );
  }
}
