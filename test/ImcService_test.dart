import 'package:calculadora_imc/ImcService.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  testWidgets('ObterImc não deve retonar 0', (WidgetTester tester) async {
      final imcService =  new ImcService(1,  1);
      expect(imcService.obterImc(), 1);
  });
}
