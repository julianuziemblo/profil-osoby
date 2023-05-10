import 'package:flutter/material.dart';
import 'dart:math';

class Post extends StatefulWidget {
  const Post({
    super.key,
    required this.date,
    required this.text,
  });

  final DateTime date;
  final String text;

  @override
  State<StatefulWidget> createState() => PostState();
}

class PostState extends State<Post> {
  String days(int num) => (num != 1) ? ' · $num dni' : ' · wczoraj';

  final fontSize = 15.5;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile picture
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  margin: const EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                          width: 2.0, color: const Color(0xFF010101)),
                      boxShadow: const <BoxShadow>[
                        BoxShadow(color: Colors.black, blurRadius: 5.0)
                      ],
                      color: const Color(0xFF010101),
                      image: const DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage('assets/pfp.jpg'),
                      )),
                ),
              ],
            ),
            // text
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // header
                Row(
                  children: [
                    // Name
                    Text('Mariusz Błaszczak',
                        style: TextStyle(
                            color: const Color(0xFFDADADA),
                            fontWeight: FontWeight.bold,
                            fontSize: fontSize)),
                    // Tag
                    const SizedBox(width: 5),
                    Text(
                      '@mblaszczak',
                      style: TextStyle(
                          color: const Color(0xFF919294), fontSize: fontSize),
                    ),
                    // Date
                    Text(
                      days(DateTime.now().difference(widget.date).inDays),
                      style: TextStyle(
                          color: const Color(0xFF919294), fontSize: fontSize),
                    ),
                    // 'More' icon
                    const Icon(
                      Icons.more_vert,
                      color: Color(0xFF919294),
                    ),
                  ],
                ),
                // text
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: Text(widget.text,
                          style: TextStyle(
                              color: const Color(0xFFDADADA),
                              fontSize: fontSize)),
                    )
                  ],
                ),
                const SizedBox(height: 8),
                // icons
                IconRow(),
              ],
            ),
          ],
        ),
        // text
      ],
    );
  }
}

class IconRow extends StatefulWidget {
  const IconRow({super.key});

  @override
  State<StatefulWidget> createState() => IconRowState();
}

class IconRowState extends State<IconRow> {
  String numf(String n) {
    var numArr = n.split('');
    String revStr = "";
    int thousands = 0;
    for (var i = numArr.length - 1; i >= 0; i--) {
      if (numArr[i].toString() == ".") {
        thousands = 0;
      } else {
        thousands++;
      }
      revStr = revStr + numArr[i].toString();
      if (thousands == 3 && i > 0) {
        thousands = 0;
        revStr = '$revStr ';
      }
    }
    return revStr.split('').reversed.join('');
  }

  final fontSize = 15.5;
  final rng = Random();
  var _heartIcon = Icons.favorite_outline;
  var _heartColor = const Color(0xff84858a);

  void like() {
    setState(() {
      if (_heartIcon == Icons.favorite_outline) {
        _heartIcon = Icons.favorite;
        _heartColor = Colors.red;
      } else {
        _heartIcon = Icons.favorite_outline;
        _heartColor = const Color(0xff84858a);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            Icon(Icons.comment_outlined,
                color: const Color(0xff84858a), size: fontSize - 1),
            const SizedBox(width: 5),
            Text(numf('${rng.nextInt(10000)}'),
                style: TextStyle(
                    color: const Color(0xff84858a), fontSize: fontSize - 1))
          ],
        ),
        const SizedBox(width: 8),
        Row(
          children: [
            Icon(Icons.repeat,
                color: const Color(0xff84858a), size: fontSize - 1),
            const SizedBox(width: 5),
            Text(numf('${rng.nextInt(10000)}'),
                style: TextStyle(
                    color: const Color(0xff84858a), fontSize: fontSize - 1))
          ],
        ),
        //const SizedBox(width: 8),
        Row(
          children: [
            IconButton(
              onPressed: like,
              alignment: Alignment.centerRight,
              constraints: BoxConstraints.tight(const Size(25, 25)),
              icon: Icon(_heartIcon, color: _heartColor),
              padding: const EdgeInsets.all(0),
              iconSize: fontSize - 1,
              splashRadius: 0.1,
            ),
            const SizedBox(width: 5),
            Text(numf('${rng.nextInt(10000)}'),
                style: TextStyle(
                    color: const Color(0xff84858a), fontSize: fontSize - 1))
          ],
        ),
        const SizedBox(width: 8),
        Row(
          children: [
            Icon(Icons.bar_chart,
                color: const Color(0xff84858a), size: fontSize - 1),
            const SizedBox(width: 5),
            Text(numf('${rng.nextInt(10000)}'),
                style: TextStyle(
                    color: const Color(0xff84858a), fontSize: fontSize - 1))
          ],
        ),
        const SizedBox(width: 8),
        Icon(Icons.share, color: const Color(0xff84858a), size: fontSize - 1),
      ],
    );
  }
}
