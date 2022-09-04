import 'package:flutter/material.dart';
import 'game_logic.dart';

class UiScreen extends StatefulWidget {
  const UiScreen({Key? key}) : super(key: key);

  @override
  State<UiScreen> createState() => _UiScreenState();
}

class _UiScreenState extends State<UiScreen> {
  String activePlayer = 'X';
  bool gameOver = false;
  int turn = 0;
  String result = '';
  bool autoPlayer = true;
  Game game = Game();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: (MediaQuery.of(context).orientation == Orientation.landscape)
            ? Container(
                color: const Color(0xff80BDA5),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      Expanded(
                          child: Column(
                        children: [
                          const Text(
                            'Tic Tac Toe',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 28,
                              color: Colors.white,
                            ),
                          ),
                          const Text(
                            '.......................................................',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                              color: Color(0xffDDCC25),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            'PlayerX : PlayerO',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 26,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Text(
                            '${Player.scoreX} : ${Player.scoreO}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 40,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Column(
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.4,
                                height:
                                    MediaQuery.of(context).size.height * 0.13,
                                child: MaterialButton(
                                  onPressed: () => showDialog(
                                    barrierColor:const Color(0xaa276447),
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(32)),
                                        ),
                                        contentPadding:
                                            const EdgeInsets.all(10),

                                        title: const Text(
                                          'SELECT GAME MODE',
                                          style: TextStyle(
                                            fontSize: 26,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),

                                        content: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            SizedBox(
                                              width: 180,
                                              height: 50,
                                              child: MaterialButton(
                                                onPressed: () {
                                                  autoPlayer = false;
                                                  Navigator.of(context).pop();
                                                  setState(() {
                                                    Player.scoreO = 0;
                                                    Player.scoreX = 0;
                                                    Player.playerX = [];
                                                    Player.playerO = [];
                                                    activePlayer = 'X';
                                                    gameOver = false;
                                                    turn = 0;
                                                    result = '';
                                                  });
                                                },
                                                color: const Color(0xff80BDA5),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: const [
                                                    Icon(
                                                      Icons.person,
                                                      color: Colors.white,
                                                    ),
                                                    Text(
                                                      ' 2 Player',
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 20,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            SizedBox(
                                              width: 180,
                                              height: 50,
                                              child: MaterialButton(
                                                onPressed: () {
                                                  autoPlayer = true;
                                                  setState(() {
                                                    Player.scoreO = 0;
                                                    Player.scoreX = 0;
                                                    Player.playerX = [];
                                                    Player.playerO = [];
                                                    activePlayer = 'X';
                                                    gameOver = false;
                                                    turn = 0;
                                                    result = '';
                                                  });
                                                  Navigator.of(context).pop();
                                                },
                                                color: const Color(0xff80BDA5),
                                                child: const Text(
                                                  ' vs.Computer',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 25,
                                            ),
                                            const Text(
                                              'The computer will automatically be player two',
                                              style: TextStyle(
                                                fontSize: 10,
                                                fontWeight: FontWeight.w300,
                                                color: Colors.white,
                                              ),
                                            )
                                          ],
                                        ),
                                        backgroundColor:
                                            const Color(0xffEDBB99),
                                      );
                                    },
                                  ),
                                  color: const Color(0xff057952),
                                  child: const Text(
                                    'NEW GAME',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 24,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.4,
                                height:
                                    MediaQuery.of(context).size.height * 0.13,
                                child: MaterialButton(
                                  onPressed: () {
                                    setState(() {
                                      Player.playerX = [];
                                      Player.playerO = [];
                                      activePlayer = 'X';
                                      gameOver = false;
                                      turn = 0;
                                      result = '';
                                    });
                                  },
                                  color: const Color(0xff057952),
                                  child: const Text(
                                    'RESET GAME',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 24,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      )),
                      Expanded(
                        child: Column(
                          children: [
                            Expanded(
                              child: GridView.count(
                                padding: const EdgeInsets.all(20),
                                crossAxisCount: 3,
                                mainAxisSpacing: 0.0,
                                crossAxisSpacing: 0.0,
                                childAspectRatio: 1.2,
                                children: List.generate(
                                  9,
                                  (index) => buildGestureDetector(
                                    determineBorder: _determineBorder(
                                      index,
                                      const BorderSide(
                                        color: Color(0xffDDCC25),
                                      ),
                                    ),
                                    handleTap:
                                        gameOver ? null : () => onTap(index),
                                    playerSymbol: Player.playerX.contains(index)
                                        ? 'X'
                                        : Player.playerO.contains(index)
                                            ? 'O'
                                            : '',
                                    color: Player.playerX.contains(index)
                                        ? Colors.white
                                        : const Color(0xff20734A),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : Container(
                color: const Color(0xff80BDA5),
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Tic Tac Toe',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 28,
                          color: Colors.white,
                        ),
                      ),
                      const Text(
                        '.......................................................',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                          color: Color(0xffDDCC25),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'PlayerX : PlayerO',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 26,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        '${Player.scoreX} : ${Player.scoreO}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 40,
                          color: Colors.white,
                        ),
                      ),
                      Expanded(
                        child: GridView.count(
                          padding: const EdgeInsets.all(20),
                          crossAxisCount: 3,
                          mainAxisSpacing: 0.0,
                          crossAxisSpacing: 0.0,
                          childAspectRatio: 1.0,
                          children: List.generate(
                            9,
                            (index) => buildGestureDetector(
                              determineBorder: _determineBorder(
                                index,
                                const BorderSide(
                                  color: Color(0xffDDCC25),
                                ),
                              ),
                              handleTap: gameOver ? null : () => onTap(index),
                              playerSymbol: Player.playerX.contains(index)
                                  ? 'X'
                                  : Player.playerO.contains(index)
                                      ? 'O'
                                      : '',
                              color: Player.playerX.contains(index)
                                  ? Colors.white
                                  : const Color(0xff20734A),
                            ),
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.6,
                            height: MediaQuery.of(context).size.height * 0.07,
                            child: MaterialButton(
                              onPressed: () => showDialog(
                                barrierColor:const Color(0xaa276447),
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    shape: const RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(32)),
                                    ),
                                    contentPadding: const EdgeInsets.all(10),
                                    title: const Text(
                                      'SELECT GAME MODE',
                                      style: TextStyle(
                                        fontSize: 26,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        SizedBox(
                                          width: 180,
                                          height: 50,
                                          child: MaterialButton(
                                            onPressed: () {
                                              autoPlayer = false;
                                              Navigator.of(context).pop();
                                              setState(() {
                                                Player.scoreO = 0;
                                                Player.scoreX = 0;
                                                Player.playerX = [];
                                                Player.playerO = [];
                                                activePlayer = 'X';
                                                gameOver = false;
                                                turn = 0;
                                                result = '';
                                              });
                                            },
                                            color: const Color(0xff80BDA5),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              mainAxisSize: MainAxisSize.min,
                                              children: const [
                                                Icon(
                                                  Icons.person,
                                                  color: Colors.white,
                                                ),
                                                Text(
                                                  ' 2 Player',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        SizedBox(
                                          width: 180,
                                          height: 50,
                                          child: MaterialButton(
                                            onPressed: () {
                                              autoPlayer = true;
                                              Navigator.of(context).pop();
                                              setState(() {
                                                Player.scoreO = 0;
                                                Player.scoreX = 0;
                                                Player.playerX = [];
                                                Player.playerO = [];
                                                activePlayer = 'X';
                                                gameOver = false;
                                                turn = 0;
                                                result = '';
                                              });
                                            },
                                            color: const Color(0xff80BDA5),
                                            child: const Text(
                                              ' vs.Computer',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 25,
                                        ),
                                        const Text(
                                          'The computer will automatically be player two',
                                          style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w300,
                                            color: Colors.white,
                                          ),
                                        )
                                      ],
                                    ),
                                    backgroundColor: const Color(0xffEDBB99),
                                  );
                                },
                              ),
                              color: const Color(0xff057952),
                              child: const Text(
                                'NEW GAME',
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 24,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.6,
                            height: MediaQuery.of(context).size.height * 0.07,
                            child: MaterialButton(
                              onPressed: () {
                                setState(() {
                                  Player.playerX = [];
                                  Player.playerO = [];
                                  activePlayer = 'X';
                                  gameOver = false;
                                  turn = 0;
                                  result = '';
                                });
                              },
                              color: const Color(0xff057952),
                              child: const Text(
                                'RESET GAME',
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 24,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }

  onTap(int index) async {
    if ((Player.playerX.isEmpty ||
        !Player.playerX.contains(index)) && (Player.playerO.isEmpty ||
        !Player.playerO.contains(index))) {
      game.playGame(index, activePlayer);
      updateState();

      if (autoPlayer && !gameOver && turn != 9) {
        await game.autoPlay(activePlayer);
        updateState();
      }
    }
  }

  void updateState() {
    return setState(() {
      activePlayer = (activePlayer == 'X') ? 'O' : 'X';
      turn++;
      String winnerPlayer = game.checkWinner();
      if (winnerPlayer != '') {
        gameOver = true;
        result = '$winnerPlayer is the winner';
        showDialog(
            barrierColor:const Color(0xaa276447),
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                backgroundColor:  const Color(0xffF5CBA7),
                shape: const RoundedRectangleBorder(
                  borderRadius:
                  BorderRadius.all(Radius.circular(32)),
                ),

                contentPadding: const EdgeInsets.all(10),

                title: Text(result),

                actions: [
                  TextButton(
                    child:const Text("Play Again"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            });

      } else if (!gameOver && turn == 9) {
        result = 'Draw!';
        showDialog(
            barrierColor:const Color(0xaa276447),
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                backgroundColor:  const Color(0xffF5CBA7),
                shape: const RoundedRectangleBorder(
                  borderRadius:
                  BorderRadius.all(Radius.circular(32)),
                ),
                contentPadding: const EdgeInsets.all(10),
                title: Text(result),
                actions: [
                  TextButton(
                    child:const Text("Play Again"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  )
                ],
              );
            });
      }
    });
  }
}

GestureDetector buildGestureDetector({
  required Border determineBorder,
  required handleTap,
  required String playerSymbol,
  required Color color,
}) {
  return GestureDetector(
    onTap: handleTap,
    child: Container(
      margin: const EdgeInsets.all(0.0),
      decoration: BoxDecoration(
        border: determineBorder,
      ),
      child: Center(
        child: Text(
          playerSymbol,
          style: TextStyle(fontSize: 50, color: color),
        ),
      ),
    ),
  );
}

Border _determineBorder(int idx, BorderSide borderSide) {
  Border determinedBorder = Border.all();

  switch (idx) {
    case 0:
      determinedBorder = Border(bottom: borderSide, right: borderSide);
      break;
    case 1:
      determinedBorder =
          Border(left: borderSide, bottom: borderSide, right: borderSide);
      break;
    case 2:
      determinedBorder = Border(left: borderSide, bottom: borderSide);
      break;
    case 3:
      determinedBorder =
          Border(bottom: borderSide, right: borderSide, top: borderSide);
      break;
    case 4:
      determinedBorder = Border(
          left: borderSide,
          bottom: borderSide,
          right: borderSide,
          top: borderSide);
      break;
    case 5:
      determinedBorder =
          Border(left: borderSide, bottom: borderSide, top: borderSide);
      break;
    case 6:
      determinedBorder = Border(right: borderSide, top: borderSide);
      break;
    case 7:
      determinedBorder =
          Border(left: borderSide, top: borderSide, right: borderSide);
      break;
    case 8:
      determinedBorder = Border(left: borderSide, top: borderSide);
      break;
  }

  return determinedBorder;
}
