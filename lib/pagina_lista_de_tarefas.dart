
import 'package:flutter/widgets.dart';

//criar a lista de tarefas
class ListaDeTarefas extends StatefulWidget {                             // conveerti em StatefulWidget para adicionar itens na lista
   const ListaDeTarefas({super.key});                          // posiciona cursos em ListaDeTarefas, ALT+ENTER
  @override
  _ListaDeTarefasState createState() => _ListaDeTarefasState();
}

 //criar uma classe de contatos para ser chamada e inserida na lista
class Contatos {
  int _id;
  String _nome;
  String _endereco;
  String _cpf;
  String _email;
  String _telefone;
  String _avatar; // Caminho para a imagem do avatar

  Contato({this._id, this._nome, this._endereco, this._cpf, this._email, this._telefone, this._avatar});
}

class _ListaDeTarefasState extends State<ListaDeTarefas> {

  final TextEditingController todoController = TextEditingController();  // para pegar o texto TextField
   TextEditingController nomeController = TextEditingController();
   TextEditingController enderecoController = TextEditingController();
   TextEditingController cpfController = TextEditingController();
   TextEditingController emailController = TextEditingController();
   TextEditingController telefoneController = TextEditingController();
   TextEditingController avatarController = TextEditingController();

   List<Contatos> todos = [];

   void addContato() {
     final novoContato = Contatos(
       _nome: nomeController.text,
       _endereco: enderecoController.text,
       _cpf: cpfController.text,
       _email: emailController.text,
       _telefone: telefoneController.text,
       _avatar: avatarController.text,
     );

  @override
  Widget build(BuildContext context) {
    return SafeArea(                                              // evita que a caixa de texto suma (para cima)
      child: Scaffold(

        //------------------------------------------------------------------AppBar
          appBar: AppBar(
            backgroundColor: Colors.teal,
            title: const Text(" Uso do ListView",
              style: TextStyle(
                fontSize: 25,
                color: Colors.white,
              ) ,
            ),
            centerTitle: true,         // centraliza o texto da AppBar

            shape: const RoundedRectangleBorder(  // arredonda a App bar
                borderRadius:
                BorderRadiusDirectional.vertical(bottom: Radius.circular(10))),
          ),
          //------------------------------------------------------------- Fim AppBar

          body: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16), // afastamente de 16 pixels nas bordas esquerda e direta
              child: Column(
                mainAxisSize: MainAxisSize.min,                   // para centralizar a linha no meio da tela
                children: [
                  Row(                                            // nesta linha vai o campo de texto e o símbro '+'
                    children: [                                   // Filhos desta ROW: TextField e ElevatedButton
                      Expanded(                                   // expande o TextField até a máxima largura possível
                        child: TextField(                         // campo de texto para entrada do nome da tarefa
                          controller: todoController,             // controlador para pegar o texto
                          decoration: InputDecoration(

                            border: const OutlineInputBorder(  // estabelecendo a cor/largura da borda da decoração inical
                              borderSide:
                              BorderSide(color: Colors.teal, width: 3),
                            ),

                            focusedBorder: const OutlineInputBorder(  // estabelecendo a cor/largura da borda da decoração
                                borderSide:
                                  BorderSide(color: Colors.teal, width: 3),
                            ),

                              labelText: 'Adicione um novo contato.',
                              labelStyle: const TextStyle(            // define tamanho/cor do labelText
                                fontSize:20,
                                color: Colors.teal,
                              ),// texto de TextField

                            // icone de cancelamento de entrada do texto
                            suffixIcon: IconButton(
                              onPressed: todoController.clear,
                              icon: const Icon(Icons.clear,
                                  color: Colors.teal
                              ),
                            ),
                          ),

                          style: const TextStyle(
                            fontSize: 25,
                          ),


                        ),

                      ),
                      const SizedBox(width: 8),                              // separa o texto do botão (8 pixels)
                      ElevatedButton(
                          onPressed: () {
                            String text = todoController.text;
                            setState(() {
                              todos.add(text);
                              todos.add(_cont());// tenho que transformar ListaDeTarefas em um StatefulWidget
                            });                                         // para usar o setState informando que uma nova tarefa foi adicionada
                            todoController.clear();                     // toda vez que adicionar uma tarefa, limpa a tela
                            print('Foi adicionada uma Tarefa');
                          },
                          style: ElevatedButton.styleFrom(             // porsonalizar o botão
                          backgroundColor: Colors.teal,                  // cor do botão: azul personalizado
                          padding: const EdgeInsets.all(17),                 // altura do botão. Deve ser a mesma do TextField
                        ),
                        child: const Icon(                                   // personaliza com ícone '+'
                          Icons.add,
                          size: 30,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 16),                                       // coloca um expaçamento entre as duas linhas
                  Flexible(                                                   // coloca a lista com o tamanho máximo
                    child: Scrollbar(                                         // permite scroll da tela
                      thumbVisibility: true,                                  // barra lateral para o scroll
                      child: ListView(                                        // cria uma lista de tarefas
                        shrinkWrap: true,                                     // deixa a altura da lista com a altura dos componentes
                        children: [
                          for(String todo in todos)                           // para cada tarefa na lista de tarefas, adiciona um ListTile
                            ListTile(                                         // ListTile é um elemento de uma lista
                              title: Text(todo,
                                style: const TextStyle(                             // estilo para texto da tarefa
                                  fontSize: 25.0,
                                  color: Colors.teal,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),                              // título = texto das tarefas da lista
                              onTap: () {                     // onTap: faz uma ação quando clica-se no ListView
                                print('Tarefa $todo');        // imprime a tarefa
                              },
                            ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(                                                  // dentro de column coloco mais uma Rou
                    children: [
                      const Expanded(                                         // coloca o texto com o tamanho máximo," empurrando" o botão para a direita
                        child: Text(
                          ''
                                        // texto da Row
                        ),
                      ),
                     ElevatedButton(                                    // crio um botão "Limpar tudo" nesta nova linha
                         //onPressed: () {},
                       onPressed: () {
                         //deleteAllTodos();                                      // chama uma função para limpar todas as tarefas

                         setState(() {
                           todos.removeAt(1);
                         });

                                                },
                         style: ElevatedButton.styleFrom(               // porsonalizar o botão
                           backgroundColor: Colors.teal,                  // cor do botão: azul personalizado
                           padding: const EdgeInsets.all(17),                 // altura do botão. Deve ser a mesma do TextField
                         ),
                         child: const Text('Limpar tudo.',
                           style: TextStyle(
                           fontSize: 20,
                         ),

                         ),
                     ),
                    ],
                  )
                ],
              ),
            ),
          )

      ),
    );
  }

   void deleteContact(int index) {
   }
   class ContactListScreen extends StatefulWidget {
   @override
   _ContactListScreenState createState() => _ContactListScreenState();
   }

   void deleteAllTodos(){
     setState(() {
       todos.clear();
     });

   }

}