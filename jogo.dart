class Resultado {
  final String status;
  final String mensagem;

  Resultado(this.status, this.mensagem);
}

class Jogo {
  int pontosJogador = 0;
  int valorAnterior = 0;

  Resultado resultado(int valorDado) {
    // Se o dado mostra 5, o jogador repete a jogada sem somar pontos
    if (valorDado == 5) {
      return Resultado("continuar", "Você tirou 5. Repita a jogada.");
    }
    // Se o dado mostra 1 ou 3, o jogador perde a vez
    if (valorDado == 1 || valorDado == 3) {
      return Resultado("perdeu", "Você tirou $valorDado. Perdeu a vez.");
    }
    // Se o dado mostra 2, 4 ou 6, o jogador soma os pontos
    if (valorDado == 2 || valorDado == 4 || valorDado == 6) {
      // Se for o primeiro lançamento, apenas registra o valor
      if (valorAnterior == 0) {
        valorAnterior = valorDado;
        pontosJogador += valorDado;
        return Resultado("continuar", "Você tirou $valorDado. Continue jogando.");
      }

      // Se o valor atual é o mesmo do anterior, soma os pontos e repete
      if (valorDado == valorAnterior) {
        pontosJogador += valorDado;
        // Se o total de pontos for 10, o jogador ganha
        if (pontosJogador == 10) {
          valorAnterior = 0; // Reseta o valor para a próxima rodada
          return Resultado("ganhou", "Parabéns! Você ganhou com $pontosJogador pontos!");
        }
        // Se o total de pontos ultrapassar 10, o jogador perde
        else if (pontosJogador > 10) {
          valorAnterior = 0; // Reseta o valor para a próxima rodada
          return Resultado("perdeu", "Você ultrapassou 10 pontos e perdeu.");
        }
        return Resultado("continuar", "Você tirou $valorDado. Continue jogando.");
      }

      // Se o valor atual é diferente do anterior, apenas registra o novo valor
      valorAnterior = valorDado;
      pontosJogador += valorDado;
      return Resultado("continuar", "Você tirou $valorDado. Continue jogando.");
    }
    return Resultado("erro", "Erro! Tente novamente mais tarde.");
  }
}
