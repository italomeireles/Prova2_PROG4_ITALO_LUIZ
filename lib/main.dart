import 'package:flutter/material.dart';
import 'package:hangman_game/interface/colors.dart';
import 'package:hangman_game/interface/widget/figure_image.dart';
import 'package:hangman_game/interface/widget/letter.dart';
import 'package:hangman_game/pages/lose.dart';
import 'package:hangman_game/pages/win.dart';
import 'package:hangman_game/utils/game_tries.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeApp(),
    );
  }
}

class HomeApp extends StatefulWidget {
  const HomeApp({Key? key}) : super(key: key);

  @override
  _HomeAppState createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  String word = "Programer".toUpperCase();
  String tip = "";

  winPage() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Winner()));
  }

  losePage() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Lose()));
  }

  List<String> letters = [
    "A",
    "B",
    "C",
    "D",
    "E",
    "F",
    "G",
    "H",
    "I",
    "J",
    "K",
    "L",
    "M",
    "N",
    "O",
    "P",
    "Q",
    "R",
    "S",
    "T",
    "U",
    "V",
    "W",
    "X",
    "Y",
    "Z"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      appBar: AppBar(
        title: Text(
          "Hangman Game",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: AppColor.primaryColor,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Stack(
              children: [
                Text(
                  "Dica: $tip",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                      fontSize: 20),
                ),
                figureImage(Game_tries.tries >= 0, "assets/hang.png"),
                figureImage(Game_tries.tries >= 1, "assets/head.png"),
                figureImage(Game_tries.tries >= 2, "assets/body.png"),
                figureImage(Game_tries.tries >= 3, "assets/ll.png"),
                figureImage(Game_tries.tries >= 4, "assets/rl.png"),
                figureImage(Game_tries.tries >= 5, "assets/la.png"),
                figureImage(Game_tries.tries >= 6, "assets/ra.png"),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: word
                .split('')
                .map((e) => letter(e.toUpperCase(),
                    !Game_tries.selectedChar.contains(e.toUpperCase())))
                .toList(),
          ),
          SizedBox(
            width: 480,
            height: 290.0,
            child: GridView.count(
              crossAxisCount: 7,
              mainAxisSpacing: 7.0,
              crossAxisSpacing: 7.0,
              padding: EdgeInsets.all(10.0),
              children: letters.map((e) {
                return RawMaterialButton(
                  onPressed: Game_tries.selectedChar.contains(e)
                      ? null
                      : () {
                          setState(() {
                            Game_tries.selectedChar.add(e);

                            if (!word.split('').contains(e.toUpperCase())) {
                              Game_tries.tries++;
                              if (Game_tries.tries > 3) {
                                tip = ("Profissão do Momento!");
                                if (Game_tries.tries == 6) {
                                  losePage();
                                }
                              }
                            }
                            if (word.split('').contains(e.toUpperCase())) {
                              Game_tries.acertos++;
                              if (Game_tries.acertos >= 7) {
                                winPage();
                              }
                            }
                          });
                        },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Text(
                    e,
                    style: TextStyle(
                      color: Color.fromARGB(255, 9, 55, 112),
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  fillColor: Game_tries.selectedChar.contains(e)
                      ? Color.fromARGB(221, 233, 0, 0)
                      : Color.fromARGB(255, 255, 255, 255),
                );
              }).toList(),
            ),
          ),
          Text(
            "Aluno: Italo Meireles, Luiz Fernando",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          )
        ],
      ),
    );
  }
}
