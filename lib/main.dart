import 'package:flutter/widgets.dart';
import 'package:relat_4/pagina_lista_de_tarefas.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const ListaDeTarefas(),
    );
  }
}                             // prátiva, pois o código ficaria grande. Então crio uma classe HomePage, que também é