import 'package:flutter/material.dart';

class TextParser {
  static RichText parse(
      String text, Color textColor, Color markingColor, double fontSize) {
    var plainText = <String>[];
    var splitText = <TextSpan>[];
    var at = <String>[];
    var hashtag = <String>[];
    var ats = <String>[];
    var hashtags = <String>[];

    //print("Got text: $text");

    for (int i = 0; i < text.length; i++) {
      var letter = text[i];
      if (letter == '@' && i < text.length) {
        while (letter != ' ') {
          letter = text[i];
          at.add(letter);
          i++;
        }
        // plainText.add('@');
        plainText.add(' ');
        splitText.add(TextSpan(
            text: plainText.join(),
            style: TextStyle(color: textColor, fontSize: fontSize)));
        plainText.clear();
        ats.add(at.join());
        splitText.add(TextSpan(
            text: at.join(),
            style: TextStyle(color: markingColor, fontSize: fontSize)));
        at.clear();
        i--;
      } else if (letter == '#') {
        while (letter != ' ' && i < text.length) {
          letter = text[i];
          hashtag.add(letter);
          i++;
          // print("getting letter: $letter");
        }
        // plainText.add('#');
        plainText.add(' ');
        splitText.add(TextSpan(
            text: plainText.join(),
            style: TextStyle(color: textColor, fontSize: fontSize)));
        plainText.clear();
        hashtags.add(hashtag.join());
        splitText.add(TextSpan(
            text: at.join(),
            style: TextStyle(color: markingColor, fontSize: fontSize)));
        hashtag.clear();
        i--;
      } else {
        plainText.add(letter);
      }
    }

    splitText.add(TextSpan(
        text: plainText.join(),
        style: TextStyle(color: textColor, fontSize: fontSize)));
    //print(splitText);
    // print('@`s: $ats');
    // print('#`s: $hashtags');

    return RichText(text: TextSpan(children: splitText));
  }
}

// // TEST
// void main(List<String> args) {
//   TextParser.parse(
//       'Alireza Firouzja on beating a @WorldChampion for the 1st time: "For sure it`s an easier World Champion than Magnus!" #GrandChessTour #c24live',
//       const Color(0xFFDADADA),
//       Colors.blue,
//       15.5);
// }
