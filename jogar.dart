// import 'package:flutter/material.dart';
// import 'package:jogo_repete/jogo.dart';

// import 'service.dart';

// class Jogar extends StatefulWidget {
//   const Jogar({super.key});

//   @override
//   State<Jogar> createState() => _Jogar();
// }

// class _Jogar extends State<Jogar> {
  
//   @override
//   Widget build(BuildContext context) {
//     String resultadoJogada = "";
//     int controle = 0;
//     final Service service = Service();


//     String validarJogada(int valorDado){
//       Jogo jogo = Jogo();
//       Resultado resultado = jogo.resultado(valorDado);
//       if(resultado.status == "continuar"){
//         controle = 0;
//       }else{
//         controle = 1;
//       }
//       return resultado.mensagem;
//     }

//     Future<void> jogar() async {
//       int valor = await service.obterValorDaJogada();
//       setState(() {
//         resultadoJogada = validarJogada(valor);
//       });
//     }

//     return Column(
//       children: [
//         Text(resultadoJogada),
//         ElevatedButton(
//           onPressed: () {
//            jogar();
//           }, 
//           child: const Text('Jogar'),
//           ),
//       ],
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:jogo_repete/jogo.dart';
import 'service.dart';

class Jogar extends StatefulWidget {
  const Jogar({super.key});

  @override
  State<Jogar> createState() => _JogarState();
}

class _JogarState extends State<Jogar> {
  String resultadoJogada = "";
  int controle = 0;
  final Service service = Service();
  final Jogo jogo = Jogo(); 

  
  String validarJogada(int valorDado) {
    Resultado resultado = jogo.resultado(valorDado);
    if (resultado.status == "continuar") {
      controle = 0;
    } else {
      controle = 1;
    }
    return resultado.mensagem;
  }

  Future<void> jogar() async {
    int valor = await service.obterValorDaJogada();
    setState(() {
      resultadoJogada = validarJogada(valor);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(resultadoJogada),
        ElevatedButton(
          onPressed: () {
            jogar();
          },
          child: const Text('Jogar'),
        ),
      ],
    );
  }
}
