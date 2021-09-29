import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:calculadora_imc/main.dart';

void main() {
  testWidgets('Verifica texto inicial - Informe seus dados',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Home(),
    ));
    expect(find.text('Informe seus dados!'), findsOneWidget);
  });

  testWidgets('Botão calcular IMC - Deve retornar Grau III',
          (WidgetTester tester) async {
        await tester.pumpWidget(MaterialApp(
          home: Home(),
        ));

        await tester.enterText(find.byKey(Key("tffAltura")), "1");
        await tester.enterText(find.byKey(Key("tffPeso")), "1");
        await tester.pump();

        await tester.tap(find.byKey(Key("btnCalcular")));
        await tester.pump();

        expect(find.text('Obesidade Grau III'), findsOneWidget);
      });
}
