import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:profil_blaszczak/profile.dart';
import 'package:profil_blaszczak/post.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static MaterialColor generateMaterialColorFromColor(Color color) {
    return MaterialColor(color.value, {
      50: Color.fromRGBO(color.red, color.green, color.blue, 0.1),
      100: Color.fromRGBO(color.red, color.green, color.blue, 0.2),
      200: Color.fromRGBO(color.red, color.green, color.blue, 0.3),
      300: Color.fromRGBO(color.red, color.green, color.blue, 0.4),
      400: Color.fromRGBO(color.red, color.green, color.blue, 0.5),
      500: Color.fromRGBO(color.red, color.green, color.blue, 0.6),
      600: Color.fromRGBO(color.red, color.green, color.blue, 0.7),
      700: Color.fromRGBO(color.red, color.green, color.blue, 0.8),
      800: Color.fromRGBO(color.red, color.green, color.blue, 0.9),
      900: Color.fromRGBO(color.red, color.green, color.blue, 1.0),
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch:
              generateMaterialColorFromColor(const Color(0xFF010101))),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Widget> posts = <Widget>[
    const Profile(),
    PinnedTweet(
      post: Post(
          date: DateTime(2023, 5, 1),
          text:
              'I was pleased to meet @SecOfDef. Another milestone in our partnership and contribution to Euroatlantic security. It contributes very much to 🇵🇱&🇺🇸strategic bond over centuries, as shown in the display unveiled with Secretary Austin in the @DeptOfDefense today.'),
    ),
    Post(
        date: DateTime(2023, 5, 9),
        text: 'Konsekwentnie wzmacniamy Wojsko Polskie!'),
    Post(
        date: DateTime(2023, 4, 30),
        text:
            'Kolejny krok w programie PILICA+. Podpisano umowy na dostawę wyrzutni #iLauncher i pocisków #CAMM oraz przeciwlotniczych systemów rakietowo-artyleryjskich PSR-A #PILICA. To skokowy wzrost możliwości rażenia celów powietrznych i zwiększenie zdolności polskiej obrony powietrznej.'),
    Post(
        date: DateTime(2023, 4, 16),
        text:
            'Rok po wejściu w życie ustawy o obronie Ojczyzny w Wojsku Polskim służy już 167 tys. żołnierzy. Mamy rekordowy poziom powołań i w kilka lat osiągniemy nasz ambitny, ale realny cel - 300 tysięczne Siły Zbrojne RP.'),
    Post(
        date: DateTime(2023, 4, 15),
        text:
            'Kompleksowy antydronowy system polskiej produkcji #SKYctrl już znajduje się na wyposażeniu Wojska Polskiego. Jest przystosowany do działania z wielowarstwowym systemem obrony przeciwlotniczej. Urządzenia te pozwolą uzupełnić ochronę polskiej przestrzeni powietrznej.'), //Container(color: Colors.white, width: 100, height: 100),
  ];

  @override
  Widget build(BuildContext context) {
    // const Key centerKey = ValueKey<String>('sliver-list');
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: const Color(0xFF010101),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0x00000000),
        title: Center(
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SemiTransparentButton(icon: Icon(Icons.arrow_back)),
                Row(
                  children: const <Widget>[
                    SemiTransparentButton(icon: Icon(Icons.search)),
                    SemiTransparentButton(icon: Icon(Icons.more_vert))
                  ],
                )
              ]),
        ),
      ),
      body: ListView.separated(
        scrollDirection: Axis.vertical,
        itemCount: posts.length,
        itemBuilder: (context, index) => posts[index],
        separatorBuilder: (context, index) =>
            const Divider(color: Color(0xFF2C2C2C), thickness: 2),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          const snackBar = SnackBar(
            content: Text('Ups! Nie udało się dodać tweeta ;('),
          );

          // Find the ScaffoldMessenger in the widget tree
          // and use it to show a SnackBar.
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        tooltip: 'Post',
        backgroundColor: const Color(0xFF1D9BF2),
        child: const Icon(Icons.add),
      ),
    );
  }
}

class PinnedTweet extends StatelessWidget {
  const PinnedTweet({
    super.key,
    required this.post,
  });

  final Post post;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
            SizedBox(width: 39),
            Icon(Icons.push_pin, color: Color(0xFF919294), size: 15),
            SizedBox(width: 5),
            Text('Przypięty tweet',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF919294),
                )),
          ],
        ),
        const SizedBox(height: 5),
        post,
      ],
    );
  }
}

class TwitterAppBar extends StatelessWidget {
  const TwitterAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            icon: const FaIcon(FontAwesomeIcons.twitter,
                color: Color(0xFFd7d8da)),
            onPressed: () => {null},
          ),
          Container(
            // clipBehavior: Clip.hardEdge,
            padding: const EdgeInsets.all(1),
            width: 250,
            height: 35,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: const Color(0xFF232429),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () => {null},
                  icon: const Icon(Icons.search),
                  color: const Color(0xFF777C80),
                  alignment: Alignment.center,
                ),
                const Text('Wyszukiwarka Twittera',
                    style: TextStyle(
                      color: Color(0xFF777C80),
                      fontSize: 16,
                    )),
              ],
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_horiz),
            color: const Color(0xFF777C80),
          ),
        ]);
  }
}
