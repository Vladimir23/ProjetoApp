import 'package:flutter_test/flutter_test.dart';
import 'package:projeto_programacao_app/models/campo.dart';

main(){
  group('Campo', (){
    test('Abrir Campo com Explosão', (){
      Campo c = Campo(linha: 0, coluna: 0);
      c.minar();
      expect(c.abrir,throwsException);
    });

    test('Abrir Campo sem Explosão', (){
      Campo c = Campo(linha: 0, coluna: 0);
      c.abrir();
      expect(c.aberto,isTrue);
    });
    test('Adicionar não vizinhos', (){
      Campo c1 = Campo(linha:0, coluna: 0);
      Campo c2 = Campo(linha:1, coluna: 3);
      c1.adicionarVizinho(c2);
      expect(c1.vizinhos.isEmpty, isTrue);
    });
    test('Adicionar Vizinho', (){
      Campo c1 = Campo(linha:3, coluna: 3);
      Campo c2 = Campo(linha:3, coluna: 4);
      Campo c3 = Campo(linha:2, coluna: 2);
      Campo c4 = Campo(linha:4, coluna: 4);
      c1.adicionarVizinho(c2);
      c1.adicionarVizinho(c3);
      c1.adicionarVizinho(c4);
      expect(c1.vizinhos.length, 3);
    });
    test('Minas na vizinhança', (){
      Campo c1 = Campo(linha:3, coluna: 3);
      Campo c2 = Campo(linha:3, coluna: 4);
      c2.minar();
      Campo c3 = Campo(linha:2, coluna: 2);
      c3.minar();
      Campo c4 = Campo(linha:4, coluna: 4);
      c1.adicionarVizinho(c2);
      c1.adicionarVizinho(c3);
      c1.adicionarVizinho(c4);
      expect(c1.qtdMinasNaVizinhanca, 2);
    });

  });
}