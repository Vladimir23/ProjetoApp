import 'package:flutter/material.dart';
import 'package:projeto_programacao_app/components/campo_widget.dart';
import 'package:projeto_programacao_app/models/tabuleiro.dart';
import 'package:projeto_programacao_app/models/campo.dart';

class TabuleiroWidget extends StatelessWidget {

  final Tabuleiro tabuleiro;
  final void Function(Campo) onAbrir;
  final void Function(Campo) onAlterarMarcacao;

  TabuleiroWidget({
    @required this.tabuleiro,
    @required this.onAbrir,
    @required this.onAlterarMarcacao,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.count(
          crossAxisCount: tabuleiro.colunas,
          children: tabuleiro.campos.map((c) {
            return CampoWidget(
                campo: c,
                onAbrir: onAbrir,
                onAlterarMarcacao: onAlterarMarcacao,
            );
          }).toList(),
      ),
    );
  }
}
