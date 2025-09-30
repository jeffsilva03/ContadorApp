import 'package:flutter/material.dart';

void main() {
  runApp(MeuApp());
}

// ========== WIDGET PRINCIPAL (StatelessWidget) ==========
class MeuApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contador App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: ContadorApp(),
    );
  }
}

// ========== TELA DO CONTADOR (StatefulWidget) ==========
class ContadorApp extends StatefulWidget {
  @override
  _ContadorAppState createState() => _ContadorAppState();
}

// CÉREBRO DO WIDGET
class _ContadorAppState extends State<ContadorApp> {
  // ========== VARIÁVEIS DO ESTADO ==========
  int numero = 0;
  String mensagem = 'Comece a clicar!';

  // LISTA DE CORES QUE VAI ALTERNAR A CADA 5 CLIQUES
  List<Color> cores = [
    Colors.blue,
    Colors.green,
    Colors.red,
    Colors.purple,
    Colors.orange,
    Colors.pink,
  ];

  // ========== MÉTODO QUE CONSTRÓI A INTERFACE ==========
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ===== BARRA SUPERIOR =====
      appBar: AppBar(
        title: Text('Contador Interativo'),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),

      // ===== CORPO DA TELA =====
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ----- TEXTO EXPLICATIVO -----
            Text(
              mensagem,
              style: TextStyle(fontSize: 18, color: Colors.grey[600]),
            ),

            SizedBox(height: 20),

            // ----- TEXTO INFORMATIVO SOBRE COR -----
            Text(
              'Cor muda a cada 5 cliques!',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[500],
                fontStyle: FontStyle.italic,
              ),
            ),

            SizedBox(height: 10),

            // ----- NÚMERO DO CONTADOR -----
            Text(
              '$numero',
              style: TextStyle(
                fontSize: 72,
                fontWeight: FontWeight.bold,
                color: cores[(numero ~/ 5) % cores.length],
              ),
            ),

            SizedBox(height: 10),

            // ----- TEXTO "CLIQUES" -----
            Text(
              numero == 1 ? 'clique' : 'cliques',
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),

            SizedBox(height: 40),

            // ----- BOTÕES -----
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // BOTÃO DIMINUIR
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (numero > 0) {
                        numero = numero - 2;
                        _atualizarMensagem();
                      }
                    });
                  },
                  child: Icon(Icons.remove),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black, // Cor do ícone
                  ),
                ),

                SizedBox(width: 30),

                // BOTÃO AUMENTAR
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      numero = numero + 1;
                      _atualizarMensagem();
                    });
                  },
                  child: Icon(Icons.add),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                ),

                SizedBox(width: 30),

                // BOTÃO MULTIPLICAR
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      numero = numero * 2;
                      _atualizarMensagem(); 
                    });
                  },
                  child: Icon(Icons.close),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                ),
              ],
            ),

            SizedBox(height: 20),

            // ----- BOTÃO RESET -----
            ElevatedButton(
              onPressed: () {
                setState(() {
                  numero = 0;
                  mensagem = 'Contador zerado!';
                });
              },
              child: Text('Zerar'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            ),

            SizedBox(height: 20),

            // ----- INDICADOR DE COR ATUAL -----
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                'Próxima mudança de cor: ${5 - (numero % 5)} cliques',
                style: TextStyle(fontSize: 12, color: Colors.grey[600]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ========== FUNÇÃO AUXILIAR ==========
  void _atualizarMensagem() {
    if (numero == 0) {
      mensagem = 'Comece a clicar para aparecer a quantidade!';
    } else if (numero < 5) {
      mensagem = 'Continue clicando...';
    } else if (numero < 10) {
      mensagem = 'Você está indo bem!';
    } else if (numero < 20) {
      mensagem = 'Parabéns! Mais de 10 cliques!';
    } else {
      mensagem = 'Incrível! Você é um mestre dos cliques!';
    }
  }
}
