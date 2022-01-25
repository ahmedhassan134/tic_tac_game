
import 'dart:math';

class Player {
  static const x = "x";
  static const y = "y";
  static const empty = " ";
  static List<int> playerX = [];
  static List<int> playerO = [];
}
extension ContainAll on List{
  bool containAll (int x, int y ,[z])
  {
    if(z==null)
      {
        return contains(x)&&contains(y);
      }
    else{
      return contains(x) &&contains(y)&&contains(z);
    }

  }

}
class Game {
  playGame(int index, String activePlayer) {
    if (activePlayer == "x") {
      Player.playerX.add(index);
    } else {
      Player.playerO.add(index);
    }
  }

  Future<void> autoPlay(activePlayer) async {
    int index = 0;
    List<int> emptySquares = [];
    for (int i = 0; i < 9; i++) {
      if (!(Player.playerX.contains(i) || Player.playerO.contains(i))) {
        emptySquares.add(i);
      }
    }
    if(Player.playerX.containAll(0, 2)&&emptySquares.contains(1))
      index=1;
    else if(Player.playerX.containAll(3, 5)&&emptySquares.contains(4))
      index=4;
    else if(Player.playerX.containAll(6, 8)&&emptySquares.contains(7))
      index=7;
    else if(Player.playerX.containAll(0, 6)&&emptySquares.contains(3))
      index=3;
    else if(Player.playerX.containAll(1, 7)&&emptySquares.contains(4))
      index=4;
    else if(Player.playerX.containAll(2, 8)&&emptySquares.contains(5)) {
      index=5;
    } else if(Player.playerX.containAll(0, 8)&&emptySquares.contains(4))
      index=4;
    else if(Player.playerX.containAll(2, 6)&&emptySquares.contains(4))
      index=4;
    // #######################
   else  if(Player.playerX.containAll(0, 1)&&emptySquares.contains(2))
      index=2;
    else if(Player.playerX.containAll(3, 4)&&emptySquares.contains(5))
      index=5;
    else if(Player.playerX.containAll(6, 7)&&emptySquares.contains(8))
      index=8;
    else if(Player.playerX.containAll(0, 3)&&emptySquares.contains(6))
      index=6;
    else if(Player.playerX.containAll(1, 4)&&emptySquares.contains(7))
      index=7;
    else if(Player.playerX.containAll(2, 5)&&emptySquares.contains(8))
      index=8;
    else if(Player.playerX.containAll(0, 4)&&emptySquares.contains(8))
      index=8;
    else if(Player.playerX.containAll(2, 4)&&emptySquares.contains(6))
      index=6;
    // ######################
   else  if(Player.playerX.containAll(1, 2)&&emptySquares.contains(0))
      index=0;
    else if(Player.playerX.containAll(4, 5)&&emptySquares.contains(3))
      index=3;
    else if(Player.playerX.containAll(7, 8)&&emptySquares.contains(6))
      index=6;
    else if(Player.playerX.containAll(3, 6)&&emptySquares.contains(0))
      index=0;
    else if(Player.playerX.containAll(4, 7)&&emptySquares.contains(1))
      index=1;
    else if(Player.playerX.containAll(5, 8)&&emptySquares.contains(2))
      index=8;
    else if(Player.playerX.containAll(4, 8)&&emptySquares.contains(0))
      index=0;
    else if(Player.playerX.containAll(4, 6)&&emptySquares.contains(2))
      index=2;
    //#####################################################
   else if(Player.playerO.containAll(0, 2)&&emptySquares.contains(1))
      index=1;
    else if(Player.playerO.containAll(3, 5)&&emptySquares.contains(4))
      index=4;
    else if(Player.playerO.containAll(6, 8)&&emptySquares.contains(7))
      index=7;
    else if(Player.playerO.containAll(0, 6)&&emptySquares.contains(3))
      index=3;
    else if(Player.playerO.containAll(1, 7)&&emptySquares.contains(4))
      index=4;
    else if(Player.playerO.containAll(2, 8)&&emptySquares.contains(5))
      index=5;
    else if(Player.playerO.containAll(0, 8)&&emptySquares.contains(4))
      index=4;
    else if(Player.playerO.containAll(2, 6)&&emptySquares.contains(4))
      index=4;
    // #######################
    else if(Player.playerO.containAll(0, 1)&&emptySquares.contains(2))
      index=2;
    else if(Player.playerO.containAll(3, 4)&&emptySquares.contains(5))
      index=5;
    else if(Player.playerO.containAll(6, 7)&&emptySquares.contains(8))
      index=8;
    else if(Player.playerO.containAll(0, 3)&&emptySquares.contains(6))
      index=6;
    else if(Player.playerO.containAll(1, 4)&&emptySquares.contains(7))
      index=7;
    else if(Player.playerO.containAll(2, 5)&&emptySquares.contains(8))
      index=8;
    else if(Player.playerO.containAll(0, 4)&&emptySquares.contains(8))
      index=8;
    else if(Player.playerO.containAll(2, 4)&&emptySquares.contains(6))
      index=6;
    // ######################
    else if(Player.playerO.containAll(1, 2)&&emptySquares.contains(0))
      index=0;
    else if(Player.playerO.containAll(4, 5)&&emptySquares.contains(3))
      index=3;
    else if(Player.playerO.containAll(7, 8)&&emptySquares.contains(6))
      index=6;
    else if(Player.playerO.containAll(3, 6)&&emptySquares.contains(0))
      index=0;
    else if(Player.playerO.containAll(4, 7)&&emptySquares.contains(1))
      index=1;
    else if(Player.playerO.containAll(5, 8)&&emptySquares.contains(2))
      index=8;
    else if(Player.playerO.containAll(4, 8)&&emptySquares.contains(0))
      index=0;
    else if(Player.playerO.containAll(4, 6)&&emptySquares.contains(2))
      index=2;



else{
      Random r = Random();
      int rIndex = r.nextInt(emptySquares.length);
      index = emptySquares[rIndex];


    }





































    playGame(index, activePlayer);
  }
 checkWinner()
  {
    String winner=' ';
    if(Player.playerX.containAll(0, 1,2)||
        Player.playerX.containAll(3, 4,5)||
        Player.playerX.containAll(6, 7,8)||
        Player.playerX.containAll(0, 3,6)||
        Player.playerX.containAll(1, 4,7)||
        Player.playerX.containAll(2, 5,8)||
        Player.playerX.containAll(0, 4,8)||
        Player.playerX.containAll(2, 4,6))

     {
      winner='x';

    }
   else if(Player.playerO.containAll(0, 1,2)||
        Player.playerO.containAll(3, 4,5)||
        Player.playerO.containAll(6, 7,8)||
        Player.playerO.containAll(0, 3,6)||
        Player.playerO.containAll(1, 4,7)||
        Player.playerO.containAll(2, 5,8)||
        Player.playerO.containAll(0, 4,8)||
        Player.playerO.containAll(2, 4,6))

    {
      winner='O';

    }
   else{
     winner=  " ";
    }
return winner;
  }
}
