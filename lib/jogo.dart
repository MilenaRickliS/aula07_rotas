import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const Jogo());
}

class Jogo extends StatefulWidget {
  const Jogo({super.key});

  @override
  State<Jogo> createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  var _imagemApp = AssetImage('imagem/padrao.png')!;
  var _mensagem = 'Escolha sua opção abaixo';

  final Map<String, AssetImage> _opcaoImagem = {
    'pedra': AssetImage('imagem/pedra.png'),
    'papel': AssetImage('imagem/papel.png'),
    'tesoura': AssetImage('imagem/tesoura.png'),
  };

  void _opcaoSelecionada(String escolhaUsuario){
    final opcoes = ['pedra', 'papel', 'tesoura'];
    var numero = Random().nextInt(3);
    var escolhaApp = opcoes[numero];

    setState(() {
      this._imagemApp = _opcaoImagem[escolhaApp]!;

      if(
        (escolhaUsuario == 'pedra' && escolhaApp == 'tesoura') ||
        (escolhaUsuario == 'tesoura' && escolhaApp == 'papel') ||
        (escolhaUsuario == 'papel' && escolhaApp == 'pedra')
      ){
        setState(() {
          this._mensagem = 'Parabéns!!! Você ganhou :)';
        });
      }else if(
        (escolhaApp == 'pedra' && escolhaUsuario == 'tesoura') ||
        (escolhaApp == 'tesoura' && escolhaUsuario == 'papel') ||
        (escolhaApp == 'papel' && escolhaUsuario == 'pedra')
      ){
        setState(() {
          this._mensagem = 'Você perdeu :(';
        });
      } else{
        setState(() {
          this._mensagem = 'Empatamos ;)';
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'JokenPo'
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              'Escolha do App',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          Image(image: this._imagemApp),
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              this._mensagem,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                onTap: () => _opcaoSelecionada('pedra'),
                child: Image.asset('imagem/pedra.png', height: 100,),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada('papel'),
                child: Image.asset('imagem/papel.png', height: 100,),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada('tesoura'),
                child: Image.asset('imagem/tesoura.png', height: 100,),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
