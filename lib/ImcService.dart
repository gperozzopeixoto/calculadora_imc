class ImcService {

  ImcService(double altura, double peso){
   this.Altura = altura;
   this.Peso = peso;
   Imc = this.obterImc();
  }

  double Altura;
  double Peso;
  double Imc;

  double obterImc() {
      return Peso / (Altura * Altura);
  }
}
