import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<StatefulWidget> createState() => ProfileState();
}

class ProfileState extends State<Profile> {
  String _obserwuj = 'Obserwuj';
  int _obserwujacy = 218714;
  final int _obserwowani = 3126;
  var _bellIcon = Icons.notification_add_outlined;

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

  void _obserwujClicked() {
    setState(() {
      if (_obserwuj == 'Obserwuj') {
        _obserwuj = 'Obserwujesz';
        _obserwujacy += 1;
      } else {
        _obserwuj = 'Obserwuj';
        _obserwujacy -= 1;
        _bellIcon = Icons.notification_add_outlined;
      }
    });
  }

  void dzwoneczekClicked() {
    setState(() {
      if (_bellIcon == Icons.notification_add_outlined) {
        _bellIcon = Icons.notification_add;
        _obserwuj = 'Obserwujesz';
      } else {
        _bellIcon = Icons.notification_add_outlined;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      textDirection: TextDirection.ltr,
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: <Widget>[
            const Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                    width: 500,
                    height: 200,
                    child: Image(image: AssetImage('assets/bg.jpg'))),
              ],
            ),
            Positioned(
              left: 20.0,
              top: 115.0,
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border:
                        Border.all(width: 2.9, color: const Color(0xFF010101)),
                    boxShadow: const <BoxShadow>[
                      BoxShadow(color: Colors.black, blurRadius: 5.0)
                    ],
                    color: const Color(0xFF010101),
                    image: const DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('assets/pfp.jpg'),
                    )),
              ),
            ),
            SideButtonPositioned(
              top: 175,
              right: 15,
              width: 130,
              height: 40,
              text: TextButton(
                onPressed: _obserwujClicked,
                child: Text(
                  _obserwuj,
                  // textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SideButtonPositioned(
              top: 175,
              right: 150,
              width: 40,
              height: 40,
              icon: IconButton(
                icon: Icon(_bellIcon),
                onPressed: dzwoneczekClicked,
                color: const Color(0xFFFFFFFF),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Container(
            margin: const EdgeInsets.all(5),
            alignment: Alignment.centerLeft,
            child: const Text(
              'Mariusz Błaszczak',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Color(0xFFDADADA),
              ),
            )),
        Container(
            margin: const EdgeInsets.all(5),
            alignment: Alignment.centerLeft,
            child: const Text(
              '@mblaszczak',
              style: TextStyle(
                fontSize: 15,
                color: Color(0xFF919294),
              ),
            )),
        Container(
            margin: const EdgeInsets.all(5),
            alignment: Alignment.centerLeft,
            child: const Text(
              'Wicepremier, Minister Obrony Narodowej',
              style: TextStyle(
                fontSize: 16,
                color: Color(0xFFD4D4D4),
              ),
            )),
        Container(
          margin: const EdgeInsets.all(3),
          alignment: Alignment.centerLeft,
          child: Row(
            children: [
              const SizedBox(height: 5),
              const Icon(Icons.location_on_outlined, color: Color(0xFF8A8B8D)),
              const SizedBox(width: 2),
              const Text('Warszawa',
                  style: TextStyle(fontSize: 16, color: Color(0xFF8A8B8D))),
              const SizedBox(width: 5),
              Transform.rotate(
                  angle: -45,
                  child: const Icon(Icons.link, color: Color(0xFF8A8B8D))),
              const SizedBox(width: 2),
              const Text('gov.pl/web/obrona-nar...',
                  style: TextStyle(fontSize: 16, color: Color(0xFF2879ba))),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.all(3),
          alignment: Alignment.centerLeft,
          child: const Row(
            children: [
              Icon(Icons.calendar_month_outlined, color: Color(0xFF8A8B8D)),
              SizedBox(width: 2),
              Text('Dołączył/a kwiecień 2010',
                  style: TextStyle(fontSize: 16, color: Color(0xFF8A8B8D))),
              SizedBox(height: 5),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.all(3),
          alignment: Alignment.centerLeft,
          child: Row(
            children: [
              const SizedBox(height: 5),
              Text(numf('$_obserwowani'),
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Color(0xFFDBDBDB))),
              const SizedBox(width: 5),
              const Text('Obserwowani',
                  style: TextStyle(fontSize: 16, color: Color(0xFF8A8B8D))),
              const SizedBox(width: 25),
              Text(numf('$_obserwujacy'),
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Color(0xFFDBDBDB))),
              const SizedBox(width: 5),
              const Text('Obserwujacy',
                  style: TextStyle(fontSize: 16, color: Color(0xFF8A8B8D))),
            ],
          ),
        ),
      ],
    );
  }
}

class SideButtonPositioned extends StatelessWidget {
  const SideButtonPositioned({
    super.key,
    this.top,
    this.bottom,
    this.right,
    this.left,
    this.width,
    this.height,
    this.icon,
    this.text,
  });
  final double? top, bottom, right, left, width, height;
  final IconButton? icon;
  final TextButton? text;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      right: right,
      width: width,
      height: height,
      child: Container(
        // margin: const EdgeInsets.all(1),
        // padding: const EdgeInsets.all(1),
        // width: width,
        // height: height,
        // alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          border: Border.all(
            width: 2,
            color: const Color(0xFF363F44),
          ),
          //color: const Color(0x88232429),
        ),
        child: (icon != null) ? icon : text,
      ),
    );
  }
}

class SemiTransparentButton extends StatelessWidget {
  const SemiTransparentButton({
    super.key,
    required this.icon,
  });

  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(0.5),
      margin: const EdgeInsets.all(2),
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: const Color(0x88232429),
      ),
      child: IconButton(
        icon: icon,
        onPressed: () {},
        color: const Color(0xFFFFFFFF),
      ),
    );
  }
}
