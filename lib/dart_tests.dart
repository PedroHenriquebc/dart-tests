double calcularDesconto(double valor, double desconto, bool percentual) {
  if (percentual) {
    return valor - (valor * (desconto / 100));
  }
  return valor - desconto;
}