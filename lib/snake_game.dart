import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class SnakeGame extends StatefulWidget {
  const SnakeGame({super.key});

  @override
  State<SnakeGame> createState() => _SnakeGameState();
}

class _SnakeGameState extends State<SnakeGame> {
  static List<int> snakePosition = [45,65,85,105,125];
  int numberOfSquares = 760;
  static var randomNumber = Random();
  int food = randomNumber.nextInt(760);
  Timer? gameTimer;

  @override
   void dispose(){
    gameTimer?.cancel();
    super.dispose();
  }


  void generateNewFood(){
    food = randomNumber.nextInt(numberOfSquares);
    while (snakePosition.contains(food)) {
      food = randomNumber.nextInt(numberOfSquares);
    }
  }

  void startGame(){
    snakePosition = [45,65,85,105,125];
    direction = 'down';
    const duration = Duration(milliseconds: 300);
    gameTimer?.cancel();
    gameTimer = Timer.periodic(duration, (Timer timer){
      updateSnake();
      if (gameOver()){
        timer.cancel();
        _showGameOverScreen();
      }
    });
  }

  var direction = 'down';
  void updateSnake(){
    setState(() {
      switch (direction){
        case 'down':
          if (snakePosition.last > 739){
            snakePosition.add(snakePosition.last +20 - 760);
          }
          else{
            snakePosition.add(snakePosition.last + 20);
          }
          break;

        case 'up':
          if(snakePosition.last < 20){
            snakePosition.add(snakePosition.last -20 +760);
          }else{
            snakePosition.add(snakePosition.last - 20);
          }
          break;

        case 'left' :
          if(snakePosition.last % 20 ==0){
            snakePosition.add(snakePosition.last - 1 + 20);
          }else{
            snakePosition.add(snakePosition.last - 1);
          }
          break;

        case 'right':
          if((snakePosition.last + 1)% 20 == 0){
            snakePosition.add(snakePosition.last + 1 - 20);
          }else{
            snakePosition.add(snakePosition.last + 1);
          }
          break;

      }

      if (snakePosition.last == food){
        generateNewFood();
      }else{
        snakePosition.removeAt(0);
      }
    });
  }

  bool gameOver(){
    for(int i = 0; i<snakePosition.length; i++){
      int count = 0;
      for(int j = 0; j<snakePosition.length; j++){
        if(snakePosition[i] == snakePosition[j]){
          count++;
        }
        if(count == 2){
          return true;
        }
      }
    }
    return false;
  }

  void _showGameOverScreen(){
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context){
          return AlertDialog(
            title: Text('GAME OVER'),
            content: Text('You\'re score: '+ (snakePosition.length - 5).toString()),
            actions: [
              TextButton(
                  onPressed: (){
                    startGame();
                    Navigator.of(context).pop();
                  },
                  child: Text('Play Again!')
              )
            ],
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
            // Stops the game and returns to the previous screen (HomePage)
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
              child: GestureDetector(
                onVerticalDragUpdate: (details) {
                  if (direction != 'up' && details.delta.dy>0){
                    direction = 'down';
                  }else if(direction != 'down' && details.delta.dy<0){
                    direction = 'up';
                  }
                },
                onHorizontalDragUpdate: (details) {
                  if (direction != 'left' && details.delta.dx>0){
                    direction = 'right';
                  }else if(direction != 'right' && details.delta.dx<0){
                    direction = 'left';
                  }
                },

                child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: numberOfSquares,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 20),
                    itemBuilder: (BuildContext context, int index){
                      if(snakePosition.contains(index)){
                        return Center(
                          child: Container(
                            padding: const EdgeInsets.all(2),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: Container(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        );
                      }
                      if(index == food){
                        return Container(
                          padding: EdgeInsets.all(2),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Container(
                              color: Colors.green,
                            ),
                          ),
                        );
                      }
                      return Container(
                        padding: const EdgeInsets.all(2),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Container(color: Colors.grey[900]),
                        ),
                      );
                    }

                ),
              )
          ),
          Padding(
              padding: const EdgeInsets.only(bottom: 20, top: 20),
            child: ElevatedButton(
                onPressed: startGame,
                child: const Text('Start Game'),
            ),
          )
        ],
      ),
    );
  }
}
