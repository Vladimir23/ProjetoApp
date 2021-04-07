import 'package:flutter/material.dart';
import '../models/explosao_exception.dart';
import '../components/resultado_widget.dart';
import '../components/tabuleiro_widget.dart';
import '../models/campo.dart';
import '../models/tabuleiro.dart';

class CampoMinadoApp extends StatefulWidget {

  @override
  _CampoMinadoAppState createState() => _CampoMinadoAppState();
}

class _CampoMinadoAppState extends State<CampoMinadoApp> {

  bool _venceu;
  Tabuleiro _tabuleiro;

  void _reiniciar(){
    setState(() {
      _venceu=null;
      _tabuleiro.reiniciar();
    });
  }

  void _abrir(Campo campo){
    if(_venceu!=null){
      return;
    }
    setState(() {

    try{
      campo.abrir();
      if(_tabuleiro.resolvido){
        _venceu=true;
      }
    } on ExplosaoException{
  _venceu=false;
  _tabuleiro.revelarBombas();
    }
    });
  }

  void _alterarMarcacao(Campo campo){
    if(_venceu!=null){
      return;
    }
    setState(() {
      campo.alterarMarcacao();
      if(_tabuleiro.resolvido){
        _venceu=true;
      }
    });
  }
  Tabuleiro _getTabuleiro(double largura, double altura){
    if(_tabuleiro==null){
      int qtdeCalunas=15;
      double tamanhoCampo=largura/qtdeCalunas;
      int qtdeLinhas=(altura/tamanhoCampo).floor();

      _tabuleiro = Tabuleiro(linhas: qtdeLinhas, colunas: qtdeCalunas, qtdeBombas: 15);
    }return _tabuleiro;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: ResultadoWidget(
            venceu: _venceu,
            onReiniciar: _reiniciar,
        ),
        body: Container(
          color: Colors.grey,
          child: LayoutBuilder(
            builder: (ctx, contraints){
              return TabuleiroWidget(
                  tabuleiro: _getTabuleiro(contraints.maxWidth, contraints.maxHeight),
                  onAbrir: _abrir,
                  onAlterarMarcacao: _alterarMarcacao,
              );
            },
          ),
        ),
      ),
    );
  }
}
