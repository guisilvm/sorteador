import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> images = ['assets/1.jpg', 'assets/2.jpeg', 'assets/3.jpeg'];

  List<int> imagemSelecionada = [0, 1, 2];

double somatoria = 100.0;

void sortear()
{

int i = 0;
while(i < 5) {
setState(() {
            imagemSelecionada[0] = Random().nextInt(images.length);
            imagemSelecionada[1] = Random().nextInt(images.length);
            imagemSelecionada[2] = Random().nextInt(images.length);
          sleep(Duration(milliseconds: 500));
          });
          i++;
        }


          if (imagemSelecionada[0] == imagemSelecionada[1] && imagemSelecionada[1] == imagemSelecionada[2]) {

somatoria = somatoria + 100.0;

             showDialog(
              context: context,
               builder: (context) => AlertDialog(
                 title: Text("Parabens"),
                 content: Text("voce ganhou"),
               )
             
            );
          } else {
            somatoria = somatoria - 100.0;
          }
        }



  @override
  Widget build(BuildContext context) {
    final larguraTela = MediaQuery.of(context).size.width - 30;
    final larguraimagem = larguraTela / 3;
    return Scaffold(
      appBar: AppBar(
        title: Text("Meu App GS", style: TextStyle(fontSize: 30)),
        backgroundColor: const Color.fromARGB(255, 90, 63, 63),
      ),
      backgroundColor: const Color.fromARGB(255, 82, 101, 119),
      floatingActionButton: FloatingActionButton.large(
        onPressed: () {
          sortear();
        },
        backgroundColor: const Color.fromARGB(255, 102, 70, 70),
        foregroundColor: const Color.fromARGB(255, 255, 255, 255),
        child: Icon(Icons.ac_unit),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                images[imagemSelecionada[0]],
                width: larguraimagem,
                height: 200,
              ),
              SizedBox(width: 15),
              Image.asset(
                images[imagemSelecionada[1]],
                width: larguraimagem,
                height: 200,
              ),
              SizedBox(width: 15),
              Image.asset(
                images[imagemSelecionada[2]],
                width: larguraimagem,
                height: 200,
              ),
            ],
          ),
          Text(somatoria.toString())
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}
