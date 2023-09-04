import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/tarefa.dart';
import '../widgets/todo_list_item.dart';

class TodoListPage extends StatefulWidget {
  TodoListPage({super.key});

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  final TextEditingController addController = TextEditingController();

  List<Tarefa> tarefas = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: addController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Adcione uma tarefa',
                          hintText: 'Ex. Estudar Flutter',
                        ),
                      ),
                    ),
                    SizedBox(width: 8,),
                    ElevatedButton(
                      onPressed: (){
                        String text = addController.text;
                        setState(() {
                          Tarefa novaTarefa = Tarefa(
                            title: text,
                            date: DateTime.now(),
                          );
                          tarefas.add(novaTarefa);
                        });
                        addController.clear();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amberAccent,
                        padding: EdgeInsets.all(14)
                      ),
                      child: Icon(
                        Icons.add,
                        size: 30,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 16,),
                Flexible(
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      for(Tarefa tarefa in tarefas)
                        TodoListItem(
                          tarefa: tarefa,
                        ),
                    ],
                  ),
                ),
                SizedBox(height: 16,),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Voce possui ${tarefas.length} tarefas pendentes'
                      ),
                    ),
                    SizedBox(width: 8,),
                    ElevatedButton(
                      onPressed: (){},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.amberAccent,
                          padding: EdgeInsets.all(14)
                      ),
                      child: Text('Limpar tudo'),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}