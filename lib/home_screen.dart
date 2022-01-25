import 'package:flutter/material.dart';
import 'package:tic_tac/modules/clsses.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String activePlayer = "x";
  bool gameOver = false;
  int turn = 0;
  String result = " ";
  bool isSwitched = false;
  Game game = Game();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      body: SafeArea(
          child: Column(
        children: [
          SwitchListTile(
              title: const Text(
                "turn on/off Two Players",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              value: isSwitched,
              onChanged: (bool value) {
                setState(() {
                  isSwitched = value;
                });
              }),
          Text(
            "it's  $activePlayer turn",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),

          Expanded(
            child: GridView.count(
              padding:
                  const EdgeInsetsDirectional.only(start: 30, top: 10, end: 10),
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              childAspectRatio: 1,
              crossAxisCount: 3,
              children: List.generate(
                  9,
                  (index) => InkWell(
                        borderRadius: BorderRadius.circular(8),
                        onTap: gameOver ? null : () => _fun(index),
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.white),
                            // color: Player.playerX.contains(index)?Colors.white:Colors.deepPurple
                          ),
                          child: Center(
                            child: Text(
                              Player.playerX.contains(index)
                                  ? "x"
                                  : Player.playerO.contains(index)
                                      ? "o"
                                      : " ",
                              style: TextStyle(
                                  color: Player.playerX.contains(index)
                                      ? Colors.white
                                      : Colors.amber,
                                  fontSize: 30),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      )),
            ),
          ),
          Text(
            result,
            style: const TextStyle(
              color: Colors.red,
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
          ElevatedButton.icon(
            onPressed: () {
              setState(() {
                Player.playerX = [];
                Player.playerO = [];
                activePlayer = "x";
                gameOver = false;
                turn = 0;
                result = " ";
                isSwitched=false;
              });
            },
            icon: const Icon(Icons.replay),
            label: const Text(
              'Repeat the game ',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      )),
    );
  }

  _fun(index) async {
    if ((Player.playerX.isEmpty || !Player.playerX.contains(index)) &&
        (Player.playerO.isEmpty || !Player.playerO.contains(index))) {
      game.playGame(index, activePlayer);
      upDate();
      if (!isSwitched && !gameOver &&turn != 9) {
        await game.autoPlay(activePlayer);
        upDate();
      }
    }
  }

  void upDate() {
    setState(() {
      activePlayer = activePlayer == "x" ? "o" : "x";
      turn++;
      String winnerPlayer=game.checkWinner();
      if(winnerPlayer != ' ')
        {

          result=' $winnerPlayer is winner';
         // gameOver=true;

        }
      else if (!gameOver && turn==9){
        result =" it's Draw";
      }
        }
    );
  }
}
