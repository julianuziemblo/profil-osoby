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
      title: 'Flutter Demo',
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
    Column(
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
        Post(date: DateTime(2023, 5, 1), text: '***** ***'),
      ],
    ),

    Post(
        date: DateTime(2023, 5, 9),
        text:
            'Wojewódzki mówi, że woli Konfederację od Razem, bo to lepsze dla jego portfela. Wybiera legalizację przemocy wobec dzieci, propagandę putinowską i postulowanie batożenia gejów - bo jako bogacz nie chce płacić większych podatków, by inni płacili mniejsze i mieli dostęp do lekarza.'),
    Post(
        date: DateTime(2023, 4, 30),
        text:
            'Zarobiłem w zeszłym roku ponad 150k a mimo to dostanę zwrot podatku, ZUSu i dotację z Czystego powietrza xD tylko PiS gwarantuje tyle przywilejów dla bogatych! Więc na jesieni wybierzcie mądrze 🤪'),
    Post(
        date: DateTime(2023, 4, 16),
        text:
            'Podobno Ukraińcy chcą zmienić rosyjską nazwę "Bachmut" na "Artiomowsk". Już raz w 1924 zmieniła ją Ukraińska SRS (na cześć śp.tow.Teodora Sergejewa ps."Artiom", komisarza jakiejś Ukraińskiej Rady Rewolucyjnej). Chodzi o to, by nie oddała "Bachmutu" lecz  jakiś "Artiemiwśk".'),
    Post(
        date: DateTime(2023, 4, 15),
        text:
            'Smutna wiadomość: jakaś KSNGpgP kazała zmienić nazwę "KALININGRAD" na "KRÓLEWIEC". Smutna - bo domagałem się tego od 60 lat, tłumaczyłem, przekonywałem - a barany nic. Argumenty nie działały. A jak jakaś reżymowa instytucja na polityczne zlecenie to nakazała: to już. Co za naród!'),
    //Container(color: Colors.white, width: 100, height: 100),
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
      // body: CustomScrollView(center: centerKey, slivers: [
      //   SliverList(
      //     key: centerKey,
      //     delegate: SliverChildBuilderDelegate(
      //       (BuildContext context, int index) {
      //         print('index: $index');
      //         return posts[index];
      //       },
      //       childCount: posts.length,
      //     ),
      //   ),
      // ]),
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
